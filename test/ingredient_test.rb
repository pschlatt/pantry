require "./test/test_helper"


class IngredientTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_for_instance
    assert_instance_of Ingredient, @cheese
  end

  def test_for_name
    assert_equal "Cheese", @cheese.name
  end

  def test_for_unit
    assert_equal "oz", @cheese.unit
  end

  def test_for_calories
    assert_equal 50, @cheese.calories
  end

end
