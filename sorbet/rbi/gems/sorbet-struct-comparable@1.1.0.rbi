# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `sorbet-struct-comparable` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

module SorbetStructComparable; end
SorbetStructComparable::VERSION = T.let(T.unsafe(nil), String)

module T::Struct::ActsAsComparable
  include ::Comparable

  sig { params(other: Object).returns(T.nilable(Integer)) }
  def <=>(other); end
end

T::Struct::ActsAsComparable::EQUAL = T.let(T.unsafe(nil), Integer)
