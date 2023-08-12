require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.new(id: 1, name: 'Tom', email: 'Tom@name.com', password: '112112')
  user2 = User.new(id: 2, name: 'Lilly', email: 'Lilly@name.com', password: '122122')
  food = Food.new(id: 1, name: 'apple', price: 10, measurement_unit: 1, user:, quantity: 1)

  before(:all) do
    Food.destroy_all
    User.destroy_all
    user.save
    user2.save
    food.save
  end

  after(:all) do
    Food.destroy_all
    User.destroy_all
  end

  describe 'Foods view', type: :feature do
    before(:all) do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email # Assuming 'Email' is the label text for the email field
      fill_in 'Password', with: user.password # Assuming 'Password' is the label text for the password field

      click_button 'Log in'
    end
    describe 'Foods', type: :feature do
      before { visit '/foods/1' }
      it 'shows that it has a pic' do
        expect(page).to have_content('Name: apple')
      end
      it 'shows that it has a pic' do
        expect(page).to have_content('Price: 10')
      end
      it 'shows that it has a pic' do
        expect(page).to have_content('Quantity: 1')
      end
      it 'shows that it has a pic' do
        visit '/foods'
        click_link('New food')
        expect(page).to have_content('New food')
      end
    end
  end
end
