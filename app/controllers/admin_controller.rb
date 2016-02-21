class AdminController < ApplicationController

  def index
    @users = User.all
    # @activities = @users.activities.all
  end
end