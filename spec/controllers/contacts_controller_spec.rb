require 'spec_helper'

describe ContactsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'pending'" do
    it "returns http success" do
      get 'pending'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'accept_signup_view'" do
    it "returns http success" do
      get 'accept_signup_view'
      response.should be_success
    end
  end

  describe "GET 'accept_signup'" do
    it "returns http success" do
      get 'accept_signup'
      response.should be_success
    end
  end

  describe "GET 'accept_signin_view'" do
    it "returns http success" do
      get 'accept_signin_view'
      response.should be_success
    end
  end

  describe "GET 'accept_signin'" do
    it "returns http success" do
      get 'accept_signin'
      response.should be_success
    end
  end

  describe "GET 'block'" do
    it "returns http success" do
      get 'block'
      response.should be_success
    end
  end

  describe "GET 'unblock'" do
    it "returns http success" do
      get 'unblock'
      response.should be_success
    end
  end

end
