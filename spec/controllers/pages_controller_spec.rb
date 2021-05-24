require 'rails_helper'

RSpec.describe "PagesController", type: :controller do
  describe "home" do
      it "responds successfully" do
        get :home
        expect(response.status).to be_equal(200)
      end
    end
end
