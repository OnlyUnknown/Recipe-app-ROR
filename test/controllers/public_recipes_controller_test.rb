require 'test_helper'

class PublicRecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get public_recipes_show_url
    assert_response :success
  end
end
