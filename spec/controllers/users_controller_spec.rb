require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'forgot_password'" do
    it "returns http success" do
      get 'forgot_password'
      response.should be_success
    end
  end

  describe "GET 'update_password'" do
    it "returns http success" do
      get 'update_password'
      response.should be_success
    end
  end

  describe "GET 'reset_password'" do
    it "returns http success" do
      get 'reset_password'
      response.should be_success
    end
  end

  describe "GET 'reset_password_view'" do
    it "returns http success" do
      get 'reset_password_view'
      response.should be_success
    end
  end

end
