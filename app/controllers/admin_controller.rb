class AdminController < ApplicationController

  def index
    @users = User.all
    # @activities = Activity.all
  end
end