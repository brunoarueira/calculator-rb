# frozen_string_literal: true

require 'calculator/operator'

module Calculator
  class Validator
    BASIC_OPERATORS = Operator.all.freeze
    LETTERS = ('A'..'Z')

    attr_reader :errors

    def initialize(expression)
      @expression = expression
      @errors = []

      validate_expression!
    end

    def valid?
      errors.empty?
    end

    private

    attr_reader :expression

    def validate_expression!
      if BASIC_OPERATORS.none? { |operator| expression.include?(operator) }
        errors << "Operator not found, should contain at least one of #{BASIC_OPERATORS.join(', ')}"
      end

      return unless LETTERS.any? { |letter| expression.downcase.include?(letter.downcase) }

      errors << 'Expression does not allowed to contain letters'
    end
  end
end
