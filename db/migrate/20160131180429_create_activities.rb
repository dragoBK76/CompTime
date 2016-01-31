class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date, precision: 4, scale: 2
      t.decimal :hours_worked
      t.text :notes
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
