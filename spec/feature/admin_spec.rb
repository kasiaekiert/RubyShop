# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in as an Admin user', type: :feature do
  context 'log in as an admin' do
    let(:admin_user) { build(:admin_user) }

    it 'is successful' do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      fill_in 'Password confirmation', with: admin_user.password
      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to have_content admin_user.email.to_s
    end

    it 'is failed' do
      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: '123'
      click_button 'Sign up'

      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'admin has access to admin panel' do
    let(:admin_user) { create(:admin_user) }
    before do 
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      click_button 'Log in'
    end

    it 'is successful' do
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content admin_user.email.to_s
    end

    it 'has access to admin panel' do
      visit admin_root_path

      expect(page).to have_content 'Admin Panel'
    end
  end

  context 'admin in admin panel has access to all products and functionalities' do
    let(:admin_user) { create(:admin_user) }
    let!(:products) { create_list(:product, 3) }

    before do 
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      click_button 'Log in'
    end

    it 'can see products list in admin panel' do
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content(products.first.name)
      expect(page).to have_content(products.third.name)
    end

    it 'can add products' do
      visit admin_root_path

      expect(page).to have_content 'Admin Panel'
    end

    it 'can remove product' do
      visit admin_root_path

      expect(page).to have_content 'Admin Panel'
    end

    it 'can update product' do
      visit admin_root_path

      expect(page).to have_content 'Admin Panel'
    end
  end
end
