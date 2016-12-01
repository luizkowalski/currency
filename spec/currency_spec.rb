require 'spec_helper'

describe Currency do
  context 'configuring the gem' do
    before do
      Currency.conversion_rates('EUR', 'USD' => 1.11,
                                       'Bitcoin' => 0.0047)
    end
    it 'has a version number' do
      expect(Currency::VERSION).not_to be nil
    end

    it 'is confugure correctly' do
      expect(Currency.configuration.base).to be_eql 'EUR'
    end
  end
end
