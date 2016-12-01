require 'spec_helper'

describe Currency do
  context 'manipulating values' do
    context 'with same currency' do
      before(:each) do
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

      it 'sum the right amount' do
        fifty_eur = Currency::Money.new(50, 'EUR')
        twenty_eur = Currency::Money.new(20, 'EUR')
        sum = fifty_eur + twenty_eur
        expect(sum.amount).to be_eql 70.0
      end

      it 'subtract the right amount' do
        fifty_eur = Currency::Money.new(50, 'EUR')
        twenty_eur = Currency::Money.new(20, 'EUR')
        sum = fifty_eur - twenty_eur
        expect(sum.amount).to be_eql 30.0
      end
    end

    context 'with different currency' do
      before(:each) do
        Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
      end
      it 'sum the right amount' do
        fifty_eur = Currency::Money.new(50, 'EUR')
        twenty_dolar = Currency::Money.new(20, 'USD')
        sum = fifty_eur + twenty_dolar
        expect(sum.amount).to be_eql 68.02
      end

      it 'subtract the right amount' do
        fifty_eur = Currency::Money.new(50, 'EUR')
        twenty_dolar = Currency::Money.new(20, 'USD')
        sum = fifty_eur - twenty_dolar
        expect(sum.amount).to be_eql 31.98
      end
    end
  end
end
