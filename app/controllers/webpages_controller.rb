class WebpagesController < ApplicationController

  before_filter :unlogged_in_user, only: [:landing]

  def landing
  	@user = User.new
  	redirect_to contacts_path
  end
end
