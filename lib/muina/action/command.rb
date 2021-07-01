# typed: strict
# frozen_string_literal: true

module Muina
  class Action
    # Run proc
    class Command < Value
      const :_name, T.untyped
      const :step,  T.proc.returns(T.untyped)

      T::Sig::WithoutRuntime.sig { params(instance: Object).void }
      def call(instance = Object)
        instance.instance_eval(&step)
        nil
      end
    end
  end
end
