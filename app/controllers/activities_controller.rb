class ActivitiesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities.all.order('id DESC')
  end

  def new
    @user = User.find(params[:user_id])
    @activity = @user.activities.new
  end

  def create
    @user = User.find(params[:user_id])
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
