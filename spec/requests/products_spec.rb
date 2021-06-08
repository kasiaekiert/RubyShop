 require 'rails_helper'

RSpec.describe "/products", type: :request do
  describe "GET /" do
    it "renders a successful response" do
      get root_path
      
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /index show products on page" do
    let!(:products) { create_list(:product, 3) }
    
    it "shows products on page" do
      get "/products"
      expect(response).to be_successful
    end

    it "GET /index returns products on page after filtering" do
      get "/products", params: { q: { name_cont: products.first.name } }

      expect(response.body).to include(products.first.name)
      expect(response.body).to_not include(products.second.name)
    end

    it "GET /index returns products on page after filtering on category" do
      get "/products", params: { q: { category_id_in: products.first.category_id } }

      expect(response.body).to include(products.first.name)
      expect(response.body).to_not include(products.second.name)
    end

    it "GET /index returns products on page after filtering on category" do
      get "/products", params: { q: { brand_id_in: products.first.brand_id } }

      expect(response.body).to include(products.first.name)
      expect(response.body).to_not include(products.third.name)
    end

    it "GET /index returns products on page after filtering on category and brand" do
      get "/products", params: { q: { brand_id_in: products.first.brand_id, category_id_in: products.first.category_id } }
      
      expect(response.body).to include(products.first.name)
      expect(response.body).to_not include(products.second.name)
    end
  end

  #describe "GET /index (filters)" do
  #  it "filter products by category" do
  #    get "/products?utf8=&q%5B#{name}"
  #    expect(response).to be_successful
  #  end
  #end
end
