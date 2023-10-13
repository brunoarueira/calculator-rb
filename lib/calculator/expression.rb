module Calculator
  class Expression
    attr_reader :left, :right, :operator

    def initialize(left, right, operator)
      @left = left
      @right = right
      @operator = operator
    end
  end
end
