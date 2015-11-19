class LoggedHour < ActiveRecord::Base

  belongs_to :employee
  
  belongs_to :logged_hour_type

  validates :logged_from_date, :hours, :project_id, presence: true

end
