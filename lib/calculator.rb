# frozen_string_literal: true

require 'calculator/parser'
require 'calculator/validator'

module Calculator
  class << self
    def evaluate(expression)
      validator = Validator.new(expression)

      raise ArgumentError, validator.errors.first unless validator.valid?

      resolved_expression = Parser.new(expression).parse

      resolved_expression.call
    end
  end
end
