module Inspector
  def inspect
    "#{amount.round(2)} #{currency}"
  end
end
