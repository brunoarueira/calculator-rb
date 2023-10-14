# frozen_string_literal: true

require 'calculator/parser'
require 'calculator/operator'

module Calculator
  BASIC_OPERATORS = Operator.all.freeze

  class << self
    def evaluate(expression)
      unless BASIC_OPERATORS.any? { |operator| expression.include?(operator) }
        raise ArgumentError, "Operator not found, should contain at least one of #{BASIC_OPERATORS.join(', ')}"
      end

      resolved_expression = Parser.new(expression).parse

      resolved_expression.call
    end
  end
end
