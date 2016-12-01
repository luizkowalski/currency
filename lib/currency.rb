require 'currency/version'
require 'currency/configuration'
require 'currency/operations'

module Currency
  class << self
    attr_accessor :configuration

    def conversion_rates(base, options)
      self.configuration ||= Configuration::BaseConfiguration.new(base, options)
    end
  end

  class Money
    include Operations
    attr_accessor :amount, :currency

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end
  end
end
