class AlertMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.new_activity.subject
  #
  def new_activity(activity)
    @activity = activity
    @user = @activity.user
    @url  = "https://arcomptime.herokuapp.com"
    mail(:to => "josh@audiencerewards.com",
         :subject => "#{@user.fullname} created a new Comp-Time activity for review.")
  end
end
