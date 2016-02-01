class RemoveHoursWorkedFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :hours_worked, :decimal
  end
end
