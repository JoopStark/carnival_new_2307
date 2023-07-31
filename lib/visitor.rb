class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  
  def initialize(name, height, string_spending_money)
    @name = name
    @height = height
    @string_spending_money = string_spending_money
    @spending_money = format_spending_money
    @preferences = []
  end

  def format_spending_money
    @string_spending_money[1..-1].to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(min_height)
    @height >= min_height
  end

  def pay_admission(admission)
    @spending_money -= admission
  end

end