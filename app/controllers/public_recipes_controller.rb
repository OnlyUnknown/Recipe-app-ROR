class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:user)
    @recipe_food = RecipeFood.all
  end
end
