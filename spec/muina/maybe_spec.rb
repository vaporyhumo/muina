# frozen_string_literal: true

RSpec.describe Muina::Maybe do
  let(:object) { Object.new }
  let(:some)   { described_class::some(object) }
  let(:none)   { described_class::none }

  describe '.new' do
    specify do
      expect { described_class.new }.to raise_error(NoMethodError)
    end
  end

  describe '.some' do
    specify do
      expect(some).to be_a(Maybe)
    end

    specify do
      expect(some).to be_frozen
    end

    specify do
      expect(some.instance_variable_get(:@value)).to be object
    end
  end

  describe '.none' do
    specify do
      expect(none).to be_a(Maybe)
    end

    specify do
      expect(none).to be_frozen
    end

    specify do
      expect(none.instance_variable_get(:@value)).to be_nil
    end
  end
end
