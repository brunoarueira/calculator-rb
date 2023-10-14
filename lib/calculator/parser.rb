require_relative './operator'

module Calculator
  class Parser
    EXPRESSION_REGEX = /\((.*)\)(\s?[+\-*\/]\s?)\((.*)\)/
    OPERATORS = Operator.all.freeze

    attr_reader :expression

    def initialize(expression)
      @expression = expression
    end

    def parse
      resolve_complex_expression(expression)
    end

    private

    def resolve_basic_expression(expression)
      chars = expression.chars.map(&:strip).select { |char| !char.nil? && char != '' }

      operator = (OPERATORS & chars).last

      left = expression.split(operator).first
      right = expression.split(operator).last

      Expression.new(left.to_f, right.to_f, operator)
    end

    def resolve_complex_expression(expression)
      matched_data = expression.match(EXPRESSION_REGEX).to_a[1..-1]

      if matched_data&.length == 3
        left = resolve_basic_expression(matched_data[0])
        operator = matched_data[1].strip
        right = resolve_basic_expression(matched_data[2])

        Expression.new(left, right, operator)
      else
        resolve_basic_expression(expression)
      end
    end
  end
end
