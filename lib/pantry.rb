require "./test/test_helper"


class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    if @stock[item] == nil
      @stock[item] = 0
    else
      @stock[item]
    end
  end

  def restock(item, quantity)
      @stock[item] += quantity
  end

  def enough_ingredients_for?(recipe)
    if recipe.ingredients_required >= @stock
      false
    else
      true
    end
  end

end
