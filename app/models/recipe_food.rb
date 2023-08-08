class Recipe_food < ApplicationRecord
    belong_to :food, class_name: 'Food'
    belong_to :recipe, class_name: 'Recipe'
end