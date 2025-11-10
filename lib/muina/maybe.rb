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
      alias return some

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

    # If instance is of the +Some+ variant, it passes the contained value to the
    # block and returns a new +Some+ instance containing the return value of the
    # block; if instance is of the +None+ variant, it returns itself.
    #
    # @yieldparam value [Elem] the contained value is passed to the block
    # @yieldreturn [Object]
    # @return [Maybe<yield>]
    def map
      if @value.nil?
        self
      else
        Maybe.return yield(@value)
      end
    end

    # If instance is of the +Some+ variant, it returns itself; if instance is of
    # the +None+ variant it runs the block and returns a new instance
    # containing the return value of the block.
    #
    # @yield []
    # @yieldreturn [Object]
    # @return [Maybe<yield>, self]
    def map_none
      if @value.nil?
        Maybe.return yield
      else
        self
      end
    end

    # If instance is of the +Some+ variant, it yields the contained value to the
    # block and it returns the return value of the block; if it is of the +None+
    # variant, it returns itself.
    #
    # @yieldparam value [Elem] the contained value is passed to the block
    # @yieldreturn [Maybe]
    # @return [Maybe]
    def bind
      if @value.nil?
        self
      else
        yield(@value)
      end
    end

    # If instance is of the +None+ variant, it runs the provided block and it
    # returns its return value; if it is of the +Some+ variant, it returns
    # itself.
    #
    # @yield []
    # @yieldreturn [Maybe]
    # @return [Maybe]
    def bind_none
      if @value.nil?
        yield
      else
        self
      end
    end
  end
end
