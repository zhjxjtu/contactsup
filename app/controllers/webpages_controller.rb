class WebpagesController < ApplicationController

  before_filter :unlogged_in_user, only: [:landing]

  def landing
  end
end
