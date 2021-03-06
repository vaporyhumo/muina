# typed: strict
# frozen_string_literal: true

require 'simplecov' unless $PROGRAM_NAME == 'bin/mutant'
require 'muina'
require 'byebug'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

require 'rspec/mocks'

module RSpec
  module Mocks
    class InstanceVerifyingDouble
      sig { params(expected: Module).returns(T::Boolean) }
      def is_a?(expected)
        @doubled_module = T.let(@doubled_module, T.untyped)
        @doubled_module.target <= expected || super
      end
    end
  end
end
