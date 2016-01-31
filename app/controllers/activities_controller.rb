class ActivitiesController < ApplicationController

  def index
    @user = User.find(params[:id])
    @activities = Activity.all
  end
end
