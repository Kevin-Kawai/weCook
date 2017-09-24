require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "sessions#new" do 
    it "should allow us to access the login page" do
      get :new
      expect(response).to have_http_response(:success)
    end
  end
  describe "sessions#create" do
    it "should allow us to login and have a current_user" do 
      user = FactoryGirl.create(:user)
      post :create, params: { user: {email: "awesome@email.com", password: "password" } }

      expect(response).to redirect_to root_path
      #will this work?
      expect(current_user.email).to eq("awesome@email.com")
    end
    it "should redirect to login if our credentials do not exist" do
      post :create, params: { user: {email: "I don't exist", password: "no I don't" } }

      expect(response).to redirect_to login_path
    end
  end
  describe "sessions#destroy" do
    it "should allow us to logout" do
      user = FactoryGirl.create(:user)
      login(user)
      get :destroy

      expect(response).to redirect_to root_path
      #is this accurate?
      expect(current_user.email).to eq(nil)
    end
  end
end