require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(fullname: 'John doe', username: 'user33')
  end

  it 'requires user sign up' do
    visit '/signup'
    expect(page).to have_content('Sign Up')
    fill_in 'user_username', with: 'janeyz'
    fill_in 'user_fullname', with: 'jane doe'
    click_button 'Sign up'
  end
end
