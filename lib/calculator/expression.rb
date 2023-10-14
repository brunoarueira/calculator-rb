# frozen_string_literal: true

module Calculator
  class Expression
    OPERATIONS = {
      '+' => ->(a, b) { a + b },
      '-' => ->(a, b) { a - b },
      '/' => ->(a, b) { a / b },
      '*' => ->(a, b) { a * b }
    }.freeze

    attr_reader :left, :right, :operator

    def initialize(left, right, operator)
      @left = left
      @right = right
      @operator = operator
    end

    def call
      selected_operation = OPERATIONS[operator]

      if left.respond_to?(:call) && right.respond_to?(:call)
        selected_operation.call(left.call, right.call)
      else
        selected_operation.call(left, right)
      end
    end
  end
end
