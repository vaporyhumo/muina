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

  describe '#some?' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.some?).to be true
      end
    end

    context 'when instance is of the none variant' do
      specify do
        expect(none.some?).to be false
      end
    end
  end

  describe '#none?' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.none?).to be false
      end
    end

    context 'when instance is of the none variant' do
      specify do
        expect(none.none?).to be true
      end
    end
  end

  describe '#value!' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.value!).to be object
      end
    end

    context 'when instance is of the none variant' do
      specify do
        expect { none.value! }.to raise_error Muina::Maybe::UnwrappingError
      end
    end
  end

  describe '#value_or' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.value_or(Object.new)).to be object
      end
    end

    context 'when instance is of the none variant' do
      specify do
        object = Object.new
        expect(none.value_or(object)).to be object
      end
    end
  end

  describe '#value_or_yield' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.value_or_yield { true }).to be object
      end
    end

    context 'when instance is of the none variant' do
      specify do
        expect(none.value_or_yield { object }).to be object
      end
    end
  end

  describe '#value_or_nil' do
    context 'when instance is of the some variant' do
      specify do
        expect(some.value_or_nil).to be object
      end
    end

    context 'when instance is of the none variant' do
      specify do
        expect(none.value_or_nil).to be_nil
      end
    end
  end

  describe '#and_then' do
    context 'when instance is of the some variant' do
      specify do
        allow(object).to receive(:inspect)
        result = some.and_then { |o| o.inspect }
        expect(object).to have_received(:inspect)
        expect(result).to be some
      end
    end

    context 'when instance is of the none variant' do
      specify do
        allow(object).to receive(:inspect)
        result = none.and_then { |o| o.inspect }
        expect(object).not_to have_received(:inspect)
        expect(result).to be none
      end
    end
  end

  describe '#or_else' do
    context 'when instance is of the some variant' do
      specify do
        allow(object).to receive(:inspect)
        result = some.or_else { object.inspect }
        expect(object).not_to have_received(:inspect)
        expect(result).to be some
      end
    end

    context 'when instance is of the none variant' do
      specify do
        allow(object).to receive(:inspect)
        result = none.or_else { object.inspect }
        expect(object).to have_received(:inspect)
        expect(result).to be none
      end
    end
  end

  describe '#map' do
    context 'when instance is of the some variant' do
      specify do
        some = described_class::return(1)
        result = some.map { |i| i + 1 }
                     .value!
        expect(result).to be 2
      end
    end

    context 'when instance is of the none variant' do
      specify do
        result = none.map { |i| i + 1 }
        expect(result).to be none
      end
    end
  end

  describe '#map_none' do
    context 'when instance is of the some variant' do
      specify do
        result = some.map_none { 1 }
                     .value!
        expect(result).to be object
      end
    end

    context 'when instance is of the none variant' do
      specify do
        result = none.map_none { 1 }
                     .value!
        expect(result).to be 1
      end
    end
  end

  describe '#bind' do
    context 'when instance is of the some variant' do
      specify do
        some = described_class::return(1)
        result = some.bind { |i| described_class.return(i + 1) }
                     .value!
        expect(result).to be 2
      end
    end

    context 'when instance is of the none variant' do
      specify do
        result = none.bind { |i| described_class.return(i + 1) }
        expect(result).to be none
      end
    end
  end
end
