class ActivityMailer < ApplicationMailer

  def new_activity_alert(user)
    @user = user
    @url  = "https://arcomptime.herokuapp.com"
    mail(:to => "kdjs@audiencerewards.com",
         :subject => "#{user.fullname} created a new Comp-Time activity for review.")
    
  end
  
end
