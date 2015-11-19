class RenameLoggedHourTypeToLoggedHourTypeId < ActiveRecord::Migration
  def change
    rename_column :logged_hours, :logged_hour_type, :logged_hour_type_id
  end
end
