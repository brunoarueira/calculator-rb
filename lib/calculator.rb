# frozen_string_literal: true

require 'calculator/expression'

module Calculator
  BASIC_OPERATORS = ['+', '-', '/'].freeze

  class << self
    def evaluate(expression)
      unless BASIC_OPERATORS.any? { |operator| expression.include?(operator) }
        raise ArgumentError, "Operator not found, should contain at least one of #{BASIC_OPERATORS.join(', ')}"
      end

      resolved_expression = resolve_expression(expression)

      if resolved_expression.operator == '+'
        resolved_expression.left + resolved_expression.right
      elsif resolved_expression.operator == '-'
        resolved_expression.left - resolved_expression.right
      elsif resolved_expression.operator == '/'
        resolved_expression.left / resolved_expression.right
      end
    end

    private

    def resolve_expression(expression)
      chars = expression.chars.map(&:strip).select { |char| !char.nil? && char != '' }

      operator = (BASIC_OPERATORS & chars).last

      Expression.new(chars[0].to_f, chars[2].to_f, operator)
    end
  end
end
