# frozen_string_literal: true

require 'calculator'

RSpec.describe Calculator do
  subject { described_class }

  describe '.evaluate' do
    context 'sum' do
      it 'resolve operation 1 + 1' do
        expect(subject.evaluate('1 + 1')).to eq 2
      end

      it 'resolve operation 0 + 1' do
        expect(subject.evaluate('0 + 1')).to eq 1
      end
    end

    context 'subtract' do
      it 'resolve operation 1 - 1' do
        expect(subject.evaluate('1 - 1')).to eq 0
      end

      it 'resolve operation 0 - 1' do
        expect(subject.evaluate('0 - 1')).to eq -1
      end
    end

    context 'division' do
      it 'resolve operation 1 / 1' do
        expect(subject.evaluate('1 / 1')).to eq 1
      end

      it 'resolve operation 0 / 1' do
        expect(subject.evaluate('0 / 1')).to eq 0
      end
    end

    context 'unsupported operation' do
      it 'raises error' do
        expect do
          subject.evaluate('1 . 1')
        end.to(
          raise_error(ArgumentError, 'Operator not found, should contain at least one of +, -, /')
        )
      end
    end
  end
end
