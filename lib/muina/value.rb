# typed: strict
# frozen_string_literal: true

module Muina
  # Immutable Value Object parent class
  class Value
    include T::Props
    include T::Props::Constructor
    include T::Struct::ActsAsComparable

    def initialize(hash = {})
      super(hash)
      freeze
    end

    def serialize
      self.class.props.keys.to_h { |prop| [prop, __send__(prop)] }
    end

    def with(hash = {})
      self.class.new(serialize.merge(hash))
    end
  end
end
