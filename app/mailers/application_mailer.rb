class ApplicationMailer < ActionMailer::Base
  default from: "hr@audiencerewards.com"
  layout 'mailer'

  def new_activity_alert(user)
    @user = user
    @url  = "http://arcomptime.herokuapp.com"
    mail(:to => "kdjs@audiencerewards.com",
         :subject => "#{user.fullname} created a new activity for review.")
    
  end

end
