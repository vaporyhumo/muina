# typed: false
# frozen_string_literal: true

RSpec.describe Muina::Action do
  describe '.command' do
    it 'one', aggregate_failures: true do
      object = double(new: nil)
      klass = Class.new(described_class) do
        command(:one) { object.new }
        command { nil }
      end
      klass.call
      expect(object).to have_received(:new)
    end
  end
end
