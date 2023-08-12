require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.new(id: 1, name: 'Tom', email: 'Tom@name.com', password: '112112')
  user2 = User.new(id: 2, name: 'Lilly', email: 'Lilly@name.com', password: '122122')
    food = Food.new(id:1, name:"apple", price: 10, measurement_unit: 1, user: user, quantity: 1)
    recipe = Recipe.new(id:1, name:"cake", preparation_time: 10, cooking_time: 10, description: "cake", user: user)
  before(:all) do
    Food.destroy_all
    User.destroy_all
    user.save
    user2.save
    food.save
    recipe.save
  end

  after(:all) do
    Food.destroy_all
    User.destroy_all
    Recipe.destroy_all
  end

  describe 'Recipe view', type: :feature do
    before(:all) do
      visit '/users/sign_in' 
      fill_in 'Email', with: user.email # Assuming 'Email' is the label text for the email field
      fill_in 'Password', with: user.password # Assuming 'Password' is the label text for the password field
  
      click_button 'Log in'
    end
    describe 'Recipe', type: :feature do
      

      before { visit '/recipes' }
      it 'shows that it has a pic' do
        expect(page).to have_content("Name: cake")
      end
      it 'shows that it has a pic' do
        visit 'recipes/1'
        expect(page).to have_button
      end
  end
end
end