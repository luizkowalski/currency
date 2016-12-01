require 'spec_helper'

describe Currency do
  context 'manipulating values' do
    before do
      Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
    end
    it 'converts to the right amount' do
      one = Currency::Money.new(20, 'EUR')
      converted = one.convert_to('USD')
      expect(converted.amount).to be_eql 22.2
    end

    it 'divides to the right amount' do
      twenty = Currency::Money.new(20, 'EUR')
      ten = twenty / 2
      expect(ten.amount).to be_eql 10.0
    end

    it 'multiplies to the right amount' do
      twenty = Currency::Money.new(20, 'EUR')
      ten = twenty * 2
      expect(ten.amount).to be_eql 40.0
    end
  end
end
