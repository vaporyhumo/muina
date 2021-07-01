# typed: strict
# frozen_string_literal: true

module Muina
  # Feature implementation with typesafe params and wrapped up failures
  class Action < Params
    include T::Props
    include T::Props::Constructor

    T::Sig::WithoutRuntime.sig { returns(T::Array[T.any(Query, Step, Command)]) }
    def self.steps
      @steps ||= []
    end

    T::Sig::WithoutRuntime.sig { params(value: T.untyped).returns(T.untyped) }
    def self.success(&value)
      @success = value[] if value
      @success ||= T.untyped
    end

    T::Sig::WithoutRuntime.sig { params(error: T.untyped).returns(T.untyped) }
    def self.failure(&error)
      @failure = error[] if error
      @failure ||= T.untyped
    end

    def self.__failure(&step)
      steps << FailStep.new(step: step, success: success, failure: failure)
    end

    def self.parameters(&blk)
      @parameters ||= Class.new(T::Struct)
      parameters.instance_eval(&blk) if blk
      instance_eval(&blk) if blk
      @parameters
    end

    T::Sig::WithoutRuntime.sig { params(params: Parameters).returns(T.attached_class) }
    def self.extract(params)
      params = ActionController::Parameters.new(params) if params.instance_of?(Hash)
      i = TypedParams[parameters].new.extract!(params)
      new(i.serialize.symbolize_keys)
    end

    T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
    def self.result_set
      @result_set ||= false
    end

    T::Sig::WithoutRuntime.sig { params(hash: SymbolHash).returns(T.untyped) }
    def self.call(hash = {})
      extract(hash).perform
    end

    T::Sig::WithoutRuntime.sig { params(name: Symbol, step: T.untyped).void }
    def self.query(name, &step)
      const name, T.untyped
      steps << Query.new(name: name, step: step)
    end

    T::Sig::WithoutRuntime.sig { params(_name: T.untyped, step: T.untyped).void }
    def self.command(_name = nil, &step)
      steps << Command.new(step: step)
    end

    T::Sig::WithoutRuntime.sig { params(step: T.untyped).void }
    def self.result(&step)
      raise Error if result_set

      steps << Step.new(step: step, success: success, failure: failure)
      @result_set = true
    end

    T::Sig::WithoutRuntime.sig { returns(Result) }
    def perform
      self.class.steps.map { |step| step.call(self) }.last || Result.success(UNIT)
    rescue => error
      Result.failure(error)
    end
  end
end
