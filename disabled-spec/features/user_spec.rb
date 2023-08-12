require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(id: 1, name: 'Tom', email: 'Tom@name.com', password: '112112')
  user2 = User.new(id: 2, name: 'Lilly', email: 'Lilly@name.com', password: '122122')

  before(:all) do
    user.save
    user2.save
  end

  after(:all) do
    User.destroy_all
  end

  describe 'Post view', type: :feature do
    describe 'post index', type: :feature do
      before { visit '/users' }
      sleep(3)
      it 'shows that it has a pic' do
        expect(page).to have_content('Tom')
      end
    end
  end
end
