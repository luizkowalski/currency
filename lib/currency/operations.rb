module Operations
  def convert_to(new_currency)
    raise "Currency #{new_currency} not configured" unless Currency.configuration.options[new_currency]
    new_amount = (amount * Currency.configuration.options[new_currency])
    Currency::Money.new(new_amount, new_currency)
  end

  def +(other)
    other_amount = calculate_relative_amount(other)
    Currency::Money.new(amount + other_amount, currency)
  end

  def -(other)
    other_amount = calculate_relative_amount(other)
    Currency::Money.new(amount - other_amount, currency)
  end

  def /(other)
    Currency::Money.new(amount / other, currency)
  end

  def *(other)
    Currency::Money.new(amount * other, currency)
  end

  private

  def calculate_relative_amount(other)
    if other.currency != currency
      other.amount / Currency.configuration.options[other.currency]
    else
      other.amount
    end
  end
end
