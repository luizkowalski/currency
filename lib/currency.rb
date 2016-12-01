require 'currency/version'
require 'currency/configuration'
require 'currency/operations'
require 'currency/Comparator'
require 'currency/inspector'

module Currency
  class << self
    attr_accessor :configuration

    def conversion_rates(base, options)
      self.configuration ||= Configuration::BaseConfiguration.new(base, options)
    end
  end

  class Money
    include Operations
    include Inspector
    include Comparator
    attr_accessor :amount, :currency

    def initialize(amount, currency)
      @amount = amount.round(2)
      @currency = currency
    end
  end
end
