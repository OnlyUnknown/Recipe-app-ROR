class RecipeFood < ApplicationRecord
  belong_to :food, class_name: 'Food'
  belong_to :recipe, class_name: 'Recipe'
end
