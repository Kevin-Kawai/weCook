require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages#index" do
    it "should allow initial access to landing page" do 
      get :index
      expect(response).to eq(:success)
    end 
  end
end
