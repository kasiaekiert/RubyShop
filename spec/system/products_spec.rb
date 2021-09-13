# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'visits homepage and sees title of a page: products' do
    visit root_path
    assert_selector 'h1', text: 'Products'
  end
end
