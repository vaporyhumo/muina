# frozen_string_literal: true

module Muina
  class Maybe
    class << self
      # Returns a {Maybe} of the +Some+ variant wrapping the provided value.
      #
      # @param [Elem] value a value to wrap around a +Some+ variant.
      # @return [Maybe<Elem>]
      def some(value)
        new(value)
      end

      # Returns a {Maybe} of the +None+ variant, a safer alternative to +nil+.
      #
      # @return [Maybe]
      def none
        new(nil)
      end
    end

    private_class_method :new
    def initialize(value)
      @value = value
      freeze
    end

    # Returns +true+ if instance is of the +Some+ variant, or +false+ if it is
    # of the +None+ variant.
    #
    # @return [true] if instance is of the +Some+ variant
    # @return [false] if instance is of the +None+ variant
    def some?
      !@value.nil?
    end

    # Returns +true+ if instance is of the +None+ variant, or +false+ if it is
    # of the +Some+ variant.
    #
    # @return [true] if instance is of the +None+ variant
    # @return [false] if instance is of the +Some+ variant
    def none?
      @value.nil?
    end
  end
end
