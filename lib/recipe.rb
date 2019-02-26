require './test/test_helper'

class Recipe

    attr_reader :name, :ingredients_required

    def initialize(name)
      @name = name
      @ingredients_required = {}
    end

    def add_ingredient(name, amount)
      hash = {name => amount}
      @ingredients_required.merge!(hash)
    end

    def amount_required(name)
      @ingredients_required[name]
    end

    def total_calories
      count = 0
      @ingredients_required.select {|thing|
       count += thing.calories * @ingredients_required[thing]}
       count
    end


end
