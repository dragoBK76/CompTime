class AdminController < ApplicationController

  def index
    if !current_user.admin?
      redirect_to user_activities_path(current_user.id)
    else
    @users = User.all
    @this_year = Date.current.year
  end
  end
end