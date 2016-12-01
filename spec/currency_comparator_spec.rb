require 'spec_helper'

describe Currency do
  context 'comparating values' do
    context 'with same currency' do
      before do
        Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
      end
      it 'returns true if amount is the same' do
        one = Currency::Money.new(20, 'USD')
        other = Currency::Money.new(20, 'USD')

        expect(true).to be_eql one == other
      end

      it 'returns true if amount is bigger' do
        one = Currency::Money.new(22, 'USD')
        other = Currency::Money.new(20, 'USD')

        expect(one).to be > other
      end

      it 'returns true if amount is lower' do
        one = Currency::Money.new(19, 'USD')
        other = Currency::Money.new(20, 'USD')

        expect(one).to be < other
      end
    end

    context 'with different currency' do
      before do
        Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
      end
      it 'returns true if amount is the same' do
        one = Currency::Money.new(50, 'EUR')
        other = Currency::Money.new(55.50, 'USD')

        expect(true).to be_eql one == other
      end

      it 'returns true if amount is bigger' do
        one = Currency::Money.new(20, 'EUR')
        other = Currency::Money.new(20, 'USD')

        expect(one).to be > other
      end

      it 'returns true if amount is lower' do
        one = Currency::Money.new(10, 'EUR')
        other = Currency::Money.new(20, 'USD')

        expect(one).to be < other
      end
    end
  end
end
