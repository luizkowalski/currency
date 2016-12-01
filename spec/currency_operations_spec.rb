require 'spec_helper'

describe Currency do
  context 'configuring the gem' do
    before do
      Currency.conversion_rates('EUR', 'USD' => 1.11,
                                       'Bitcoin' => 0.0047)
    end
    it 'returns true if amount is the same' do
      one = Currency::Money.new(20, 'USD')
      other = Currency::Money.new(20, 'EUR')

      expect(true).to be_eql one == other
    end

    it 'returns false if amount is not the same' do
      one = Currency::Money.new(20, 'USD')
      other = Currency::Money.new(20.02, 'EUR')

      expect(false).to be_eql one == other
    end
  end
end
