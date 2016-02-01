class AddHoursWorkedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :hours_worked, :decimal, :precision => 4, :scale => 2
  end
end
