module Operations
  def convert_to(new_currency)
    raise "Currency #{currency} not configured" unless Currency.configuration.options[new_currency]
    new_amount = (amount * Currency.configuration.options[new_currency])
    Currency::Money.new(new_amount, new_currency)
  end

  def +(other)
    other = other.convert_to(currency) if other.currency != currency
    return Currency::Money.new(amount + other.amount, currency) if other.currency == currency
  end

  def /(other)
    Currency::Money.new(amount / other, currency)
  end

  def *(other)
    Currency::Money.new(amount * other, currency)
  end
end
