require "./test/test_helper"

class CookBook
  attr_reader :summary

  def initialize
    @summary = []
  end


  def add_recipe(food)
    recipes = Hash.new(0)
    food.each {|recipe|
          recipes[food] += recipe.name
        }
      @summary << recipes
  end

end
