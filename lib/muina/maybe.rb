# frozen_string_literal: true

module Muina
  class Maybe
    # Raised when trying to unwrap the value on a +None+ variant.
    UnwrappingError = Class.new(Error)

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
    # @return [true] if instance is of the +Some+ variant.
    # @return [false] if instance is of the +None+ variant.
    def some?
      !@value.nil?
    end

    # Returns +true+ if instance is of the +None+ variant, or +false+ if it is
    # of the +Some+ variant.
    #
    # @return [true] if instance is of the +None+ variant.
    # @return [false] if instance is of the +Some+ variant.
    def none?
      @value.nil?
    end

    # Returns the contained value if instance is of the +Some+ variant, or
    # raises {UnwrappingError} if it is of the +None+ variant.
    #
    # @return [Elem] if instance is of the +Some+ variant.
    # @raise [UnwrappingError] if instance is of the +None+ variant.
    def value!
      raise UnwrappingError if @value.nil?

      @value
    end

    # Returns the contained value if instance is of the +Some+ variant, or the
    # provided +default+ value if it is of the +None+ variant.
    #
    # @param [Object] default the value to be used if the instance is of the
    #   {None} variant.
    # @return [Elem] if instance is of the +Some+ variant.
    # @return [Object] if instance is of the +None+ variant.
    def value_or(default)
      if @value.nil?
        default
      else
        @value
      end
    end

    # Returns the contained value if instance is of the +Some+ variant, or runs
    # the provided block and returns its result if it is of the +None+ variant.
    #
    # @yieldreturn [Object]
    # @return [Elem] if instance is of the +Some+ variant.
    # @return [yield] if instance is of the +None+ variant.
    def value_or_yield
      if @value.nil?
        yield
      else
        @value
      end
    end

    # Returns the contained value if instance is of the +Some+ variant, or +nil+
    # if it is of the +None+ variant.
    #
    # @return [Elem] if instance is of the +Some+ variant.
    # @return [nil] if instance is of the +None+ variant.
    def value_or_nil
      @value
    end

    # Runs the provided block only if instance is of the +Some+ variant,
    # yielding the contained value.
    # Always returns +self+.
    #
    # @yieldparam value [Elem] the contained value is passed to the block.
    # @return [self]
    def and_then(&_blk)
      unless @value.nil?
        yield(@value)
      end

      self
    end

    # Runs the provided block only if instance is of the +None+ variant,
    # yielding no value to the block.
    # Always returns +self+.
    #
    # @yieldreturn [Object]
    # @return [self]
    def or_else(&_blk)
      if @value.nil?
        yield
      end

      self
    end
  end
end
