require "./test/test_helper"

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_for_instance
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_name_of_recipe
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_ingredients_required
    expected = {}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_can_add_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = {@cheese => 2,
                @mac => 8}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_for_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end




end

# pry(main)> mac_and_cheese.total_calories
# # => 440
