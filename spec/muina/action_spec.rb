# typed: false
# frozen_string_literal: true

RSpec.describe Muina::Action do
  let(:action) { Class.new(described_class) }

  def block_getsetter(action, name)
    expect(action.__send__(name)).to be(T.untyped)
    action.__send__(name) { 2 }
    expect(action.__send__(name)).to be(2)
  end

  describe '.success' do
    it '', aggregate_failures: true do
      block_getsetter(action, :success)
    end
  end

  describe '.failure' do
    it '', aggregate_failures: true do
      block_getsetter(action, :failure)
    end
  end

  describe '.extract' do
    let(:klass) do
      Class.new(described_class) do
        parameters do
          const :id, Integer
        end
      end
    end

    it 'casts correctly', aggregate_failures: true do
      expect(klass.extract({ id: '1' }).id).to be(1)
      expect(klass.extract(ActionController::Parameters.new({ id: '1' })).id).to be(1)
    end
  end
end
