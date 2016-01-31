class ActivitiesController < ApplicationController

  def index
    @user = current_user
    @activities = Activity.all
  end

  def new
    @user = User.find(params[:id])
    @activity = @user.activities.new
  end

  def create
    @user = User.find(params[:id])
    @activity = @user.activities.new(activity_params)

    if @activity.save
      redirect_to user_activities_path(@user.id)

    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :date, :hours_worked, :notes)
  end

end
