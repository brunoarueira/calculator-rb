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
        expect(subject.evaluate('0 - 1')).to eq(-1)
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

    context 'multiplication' do
      it 'resolve operation 1 * 1' do
        expect(subject.evaluate('1 * 1')).to eq 1
      end

      it 'resolve operation 0 * 1' do
        expect(subject.evaluate('0 * 1')).to eq 0
      end
    end

    context 'expressions' do
      it 'resolve expression (1 * 1) + (2 / 3)' do
        expect(subject.evaluate('(1 * 1) + (2 / 3)')).to eq 1.6666666666666665
      end

      it 'resolve operation (10 * 2) + (20 / 5)' do
        expect(subject.evaluate('(10 * 2) + (20 / 5)')).to eq 24
      end

      it 'resolve operation (10 * 2) * (20 / 5)' do
        expect(subject.evaluate('(10 * 2) * (20 / 5)')).to eq 80
      end

      it 'resolve operation (10 * 2) / (20 / 5)' do
        expect(subject.evaluate('(10 * 2) / (20 / 5)')).to eq 5
      end
    end

    context 'unsupported operation' do
      it 'raises error' do
        expect do
          subject.evaluate('1 . 1')
        end.to(
          raise_error(ArgumentError, 'Operator not found, should contain at least one of +, -, /, *')
        )
      end
    end
  end
end
