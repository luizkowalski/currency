require 'spec_helper'

describe Currency do
  context 'inspecting values' do
    before do
      Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
    end
    it 'inpects return the right way' do
      expect(Currency::Money.new(20, 'USD').inspect).to be_eql '20.0 USD'
    end
  end
end
