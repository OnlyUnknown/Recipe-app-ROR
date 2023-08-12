require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.new(id: 1, name: 'Tom', email: 'Tom@name.com', password: '112112')
  user2 = User.new(id: 2, name: 'Lilly', email: 'Lilly@name.com', password: '122122')
    food = Food.new(id:1, name:"apple", price: 10, measurement_unit: 1, user: user, quantity: 1)
    recipe = Recipe.new(id:1, name:"cake", preparation_time: 10, cooking_time: 10, public:true, description: "it is a cake", user: user)
    recipe2 = Recipe.new(id:2, name:"pancake", preparation_time: 10, cooking_time: 10, public:false, description: "pancake", user: user2)
  before(:all) do
    Food.destroy_all
    User.destroy_all
    user.save
    user2.save
    food.save
    recipe.save
    recipe2.save
  end

  after(:all) do
    Food.destroy_all
    User.destroy_all
    Recipe.destroy_all
  end

  describe 'public Recipe view', type: :feature do
    before(:all) do
      visit '/users/sign_in' 
      fill_in 'Email', with: user.email # Assuming 'Email' is the label text for the email field
      fill_in 'Password', with: user.password # Assuming 'Password' is the label text for the password field
  
      click_button 'Log in'
    end
    describe 'public Recipe', type: :feature do
      

      before { visit '/public_recipes' }
      it 'shows that it has a pic' do
        expect(page).to have_content("cake")
      end
      it 'shows that it has a pic' do
        expect(page).to_not have_content("pancake")
      end
      it 'shows that it has a pic' do
        expect(page).to have_content("it is a cake")
      end
  end
end
end