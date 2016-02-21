class ApplicationMailer < ActionMailer::Base
  default from: "comp-time-alert@audiencerewards.com"
  layout 'mailer'

  def new_activity_alert(user)
    @user = user.email
    @url  = "http://example.com/login"
    mail(:to => "new-comp-alert@audiencerewards.com",
         :subject => "#{user.fullname} created a new record.")
    
  end

end
