# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/alert_mailer/new_activity
  def new_activity
    activity = Activity.last
    AlertMailer.new_activity(activity)
  end

end
