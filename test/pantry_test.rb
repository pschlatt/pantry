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
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    assert_equal 0, @pantry.stock_check(@cheese)
    assert_equal 0, @pantry.stock_check(@mac)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.restock(@mac, 8)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

  
end
