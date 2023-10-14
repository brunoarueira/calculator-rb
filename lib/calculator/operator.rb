# frozen_string_literal: true

require_relative 'expression'

module Calculator
  module Operator
    BASIC = Expression::OPERATIONS.keys.freeze

    class << self
      def all
        BASIC
      end
    end
  end
end
