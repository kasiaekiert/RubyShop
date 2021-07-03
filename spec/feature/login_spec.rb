# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create new user', type: :feature do
  context 'create new user' do
    let(:user) { build(:user) }

    it 'is successful' do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to have_content user.email.to_s
    end

    it 'is failed' do
      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign up'

      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'User can log in' do
    let!(:user) { create(:user) }

    it 'user may enter login page and log in' do
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content user.email.to_s
    end

    it 'user can not log in with invalid password' do
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12344'
      click_button 'Log in'

      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'User can restore forgotten password' do
    let!(:user) { create(:user) }

    it 'user may enter login page and click the link to restore password' do
      visit root_path
      click_link 'Log in'
      click_link 'Forgot your password?'

      expect(page).to have_content 'Forgot your password?'
      expect(page).to have_current_path '/users/password/new'
    end

    it 'user can write email adress to get the instructions' do
      visit root_path
      click_link 'Log in'
      click_link 'Forgot your password?'
      fill_in 'Email', with: user.email
      click_button 'Send me reset password instructions'

      expect(page).to have_text 'You will receive an email with instructions on how to reset your password in a few minutes.'
      expect(page).to have_current_path new_user_session_path
    end
  end

  context 'User can see Log in or Log out buttons on each page' do
    let(:user) { create(:user) }

    it 'user may enter page and see button log in' do
      visit root_path

      expect(page).to have_link('Log in')
    end

    it 'user may enter subpage and see button log in' do
      visit new_product_path

      expect(page).to have_link('Log in')
    end

    it 'User can see Log out button on homepage' do
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_link('Log out')
    end

    it 'User can see Log out button on products page' do
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      visit new_product_path

      expect(page).to have_link('Log out')
    end
  end

  context 'user has not an access to admin panel' do
    let(:user) { create(:user) }
    before do 
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it 'has not access to admin panel' do
      visit rails_admin_path

      expect(page).to have_content 'You are not authorized'
    end 
  end
end
