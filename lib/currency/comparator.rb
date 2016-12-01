module Comparator
  def ==(other)
    return other.amount.eql? convert_to(other.currency).amount if currency != other.currency
    amount.eql? other.amount
  end

  def <(other)
    return other.amount > convert_to(other.currency).amount if currency != other.currency
    amount < other.amount
  end

  def >(other)
    return other.amount < convert_to(other.currency).amount if currency != other.currency
    amount > other.amount
  end

  alias eql? ==
end
