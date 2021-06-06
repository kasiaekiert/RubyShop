require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:cala_klasa) { 'cała klasa' }

  describe 'attributes' do
    #it 'has a name' do
    #  product = build(:product)
    #  expect(product).to respond_to(:name)
    #end
  end

  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:brand) }
  end

  describe 'validations' do
    let(:walidacje) { 'walidacje' }

    it { should validate_presence_of(:name) }
  end

  describe 'test factory bot' do
    let(:name) { 'name' }
    let(:built_product) { build(:product, name: name) }
    let(:created_product) { create(:product) }
    let!(:persisted_product) { create(:product) }

    it 'test sth' do


    end
  end
end
