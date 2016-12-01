module Comparator
  # TODO
  def ==(other)
    return amount.eql? other.amount if currency == other.currency
  end

  # TODO
  def <(other)
    return amount > other.amount if currency == other.currency
  end

  # TODO
  def >(other)
    return amount < other.amount if currency == other.currency
  end

  alias eql? ==
end
