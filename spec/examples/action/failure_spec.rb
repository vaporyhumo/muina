# typed: false
# frozen_string_literal: true

class Failure < M::Action
  __failure { 1 }
end

RSpec.describe Failure do
  it 'returns a result with value 1' do
    expect(described_class.call(a: '1').error!).to be(1)
  end
end
