class Activity < ActiveRecord::Base
  belongs_to :user
  after_create :send_admin_alert

  scope :approved_hours, -> { where(approved: true).sum(:hours_worked) }
  scope :total_hours, -> { self.sum(:hours_worked)}
  scope :accrued_days, -> { where(approved: true).sum(:hours_worked) / 8}

  def self.calc_accrued_days
    if (where(approved: true).sum(:hours_worked) % 8) > 3
      (where(approved: true).sum(:hours_worked) / 8).to_i + 0.5
    else
      (where(approved: true).sum(:hours_worked) / 8).to_i
    end
  end

  def year
    self.date.strftime('%Y')
  end

  def self.by_year(year)
    dt = DateTime.new(year)
    boy = dt.beginning_of_year
    eoy = dt.end_of_year
    where("date >= ? and date <= ?", boy, eoy)
  end

  def send_admin_alert
    ActivityMailer.new_activity_alert(self.user).deliver
  end

end
