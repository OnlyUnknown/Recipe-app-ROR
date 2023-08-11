class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user: @user)
    @ingredients = RecipeFood.includes(:food).where(recipe: @recipe).group_by { |ingredient| ingredient.food.name }

    @total_price = @ingredients.map do |_food, ingredients|
      ingredients.map do |ingredient|
        ingredient.food.price.to_i * ingredient.quantity.to_i
      end.sum
    end.sum
  end
end
