class CreateLoggedHours < ActiveRecord::Migration
  def change
    create_table :logged_hours do |t|
      t.integer :hours
      t.datetime :logger_date
      t.integer :employee_id
      t.integer :logged_hour_type
      t.datetime :logged_to_date
      t.boolean :period
      t.text :description
      t.datetime :logged_from_date
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
