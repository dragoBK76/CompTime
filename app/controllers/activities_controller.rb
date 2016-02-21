class ActivitiesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities.all.order('id DESC')

    if @user.id != current_user.id
      flash[:notice] = "You can't view that."
      redirect_to user_activities_path(current_user.id)
    end
    rescue ActiveRecord::RecordNotFound  
      flash[:notice] = "Record was not found."
      redirect_to user_activities_path(current_user.id)
      return
  end

  def new
    @user = User.find(params[:user_id])
    @activity = @user.activities.new
  end

  def create
    @user = User.find(params[:user_id])
    @activity = @user.activities.new(activity_params)

    if @activity.save
      ActivityMailer.new_activity_alert(@user).deliver
      redirect_to user_activities_path(@user.id)

    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @activity = @user.activities.find(params[:id])
  end


  def update
    @user = User.find(params[:user_id])
    @activity = @user.activities.find(params[:id])

    @activity.update_attributes(activity_params)

    redirect_to user_activities_path(@user.id)
  end


  private

  def activity_params
    params.require(:activity).permit(:name, :date, :hours_worked, :notes, :approved)
  end

end
