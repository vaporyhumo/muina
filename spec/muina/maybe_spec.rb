# frozen_string_literal: true

RSpec.describe Muina::Maybe do
  describe '.new' do
    specify do
      expect { described_class.new }.to raise_error(NoMethodError)
    end
  end
end
