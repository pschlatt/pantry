require "./test/test_helper"


class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_for_instance
    assert_instance_of Pantry, @pantry
  end

  def test_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_stock_check
    assert_equal 0, @pantry.stock_check(@cheese)
    refute nil, @pantry.stock_check(@cheese)
  end

  def test_restock
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    assert_equal 5, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_recipe
    skip
    assert_equal false, @pantry.enough_ingredients_for?
    assert_equal 0, @pantry.stock_check(@cheese)
    assert_equal 0, @pantry.stock_check(@mac)
    @pantry.restock(@cheese, 2)
    @pantry.restock(@mac, 8)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end







end



# pry(main)> require './lib/pantry'
# # => true
#
# pry(main)> require './lib/ingredient'
# # => true
#
# pry(main)> require './lib/recipe'
# # => true
#
# pry(main)> pantry = Pantry.new
# # => #<Pantry:0x007fd8858863b8...>
#
# pry(main)> cheese = Ingredient.new("Cheese", "C", 50)
# # => #<Ingredient:0x007fd885846e20...>
#
# pry(main)> mac = Ingredient.new("Macaroni", "oz", 200)
# # => #<Ingredient:0x007fd88582ed98...>
#
# pry(main)> mac_and_cheese = Recipe.new("Mac and Cheese")
# # => #<Recipe:0x007fd885050fe0...>
#
# pry(main)> mac_and_cheese.add_ingredient(cheese, 2)
#
# pry(main)> mac_and_cheese.add_ingredient(mac, 8)
#
# pry(main)> pantry.stock
# # => {}
#
# pry(main)> pantry.stock_check(cheese)
# # => 0
#
# pry(main)> pantry.restock(cheese, 5)
#
# pry(main)> pantry.restock(cheese, 10)
#
# pry(main)> pantry.stock_check(cheese)
# # => 15
#
# pry(main)> pantry.enough_ingredients_for?(mac_and_cheese)
# # => false
#
# pry(main)> pantry.restock(mac, 8)
#
# pry(main)> pantry.enough_ingredients_for?(mac_and_cheese)
# # => true
