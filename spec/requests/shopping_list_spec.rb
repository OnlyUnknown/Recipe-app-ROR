require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /general_shopping_list' do
    it 'signs user in and out' do
      user = User.create(email: 'test@test.com', password: 'password1234', password_confirmation: 'password1234')
      sign_in user
      get root_path


      sign_out user
      get root_path
    end
  end
end
