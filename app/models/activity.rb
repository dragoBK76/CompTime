class Activity < ActiveRecord::Base
  belongs_to :user

  scope :approved_hours, -> { where(approved: true).sum(:hours_worked) }
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
end
