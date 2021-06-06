require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:brand) }
  end

  describe 'validations' do
    let(:walidacje) { 'walidacje' }
    it { should validate_presence_of(:name) }
  end
end
