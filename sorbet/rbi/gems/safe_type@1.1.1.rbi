# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `safe_type` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

module SafeType
  class << self
    def coerce(input, rule, coerce_key = T.unsafe(nil)); end
    def coerce!(input, rule); end
  end
end

class SafeType::Boolean < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), **args); end

  class << self
    def default(value = T.unsafe(nil)); end
  end
end

module SafeType::BooleanMixin; end

class SafeType::CoercionError < ::StandardError
  def initialize(value, desired_type, key = T.unsafe(nil)); end

  def desired_type; end
  def key; end
  def value; end
end

class SafeType::Converter
  class << self
    def to_bool(input); end
    def to_date(input); end
    def to_date_time(input); end
    def to_false(input); end
    def to_float(input); end
    def to_int(input); end
    def to_time(input); end
    def to_true(input); end
    def to_type(input, type); end
  end
end

class SafeType::Date < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil), **args); end

  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil)); end
    def strict(from: T.unsafe(nil), to: T.unsafe(nil)); end
  end
end

class SafeType::DateTime < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil), **args); end

  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil)); end
    def strict(from: T.unsafe(nil), to: T.unsafe(nil)); end
  end
end

class SafeType::EmptyValueError < ::StandardError
  def initialize(desired_type, key = T.unsafe(nil)); end

  def desired_type; end
  def key; end
end

class SafeType::Float < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), min: T.unsafe(nil), max: T.unsafe(nil), **args); end

  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), min: T.unsafe(nil), max: T.unsafe(nil)); end
    def strict(min: T.unsafe(nil), max: T.unsafe(nil)); end
  end
end

class SafeType::Integer < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), min: T.unsafe(nil), max: T.unsafe(nil), **args); end

  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), min: T.unsafe(nil), max: T.unsafe(nil)); end
    def strict(min: T.unsafe(nil), max: T.unsafe(nil)); end
  end
end

class SafeType::InvalidRuleError < ::ArgumentError
  def initialize; end
end

class SafeType::Rule
  def initialize(type:, default: T.unsafe(nil), required: T.unsafe(nil), **args); end

  def after(input); end
  def before(input); end
  def coerce(input, key = T.unsafe(nil)); end
  def is_valid?(input); end

  class << self
    def coerce(input); end
    def default; end
    def strict; end
  end
end

class SafeType::String < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), min_length: T.unsafe(nil), max_length: T.unsafe(nil), **args); end

  def after(input); end
  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), min_length: T.unsafe(nil), max_length: T.unsafe(nil)); end
    def strict(min_length: T.unsafe(nil), max_length: T.unsafe(nil)); end
  end
end

class SafeType::Symbol < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), min_length: T.unsafe(nil), max_length: T.unsafe(nil), **args); end

  def after(input); end
  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), min_length: T.unsafe(nil), max_length: T.unsafe(nil)); end
    def strict(min_length: T.unsafe(nil), max_length: T.unsafe(nil)); end
  end
end

class SafeType::Time < ::SafeType::Rule
  def initialize(type: T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil), **args); end

  def is_valid?(input); end

  class << self
    def default(value = T.unsafe(nil), from: T.unsafe(nil), to: T.unsafe(nil)); end
    def strict(from: T.unsafe(nil), to: T.unsafe(nil)); end
  end
end

class SafeType::ValidationError < ::StandardError
  def initialize(value, desired_type, key = T.unsafe(nil)); end

  def desired_type; end
  def key; end
  def value; end
end
