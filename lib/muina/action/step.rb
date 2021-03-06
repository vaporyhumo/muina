# typed: strict
# frozen_string_literal: true

module Muina
  class Action
    # Base class for diferent kind of action steps
    class Step < Value
      const :step, T.untyped

      def call(instance); end
    end
  end
end
