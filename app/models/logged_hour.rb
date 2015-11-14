class LoggedHour < ActiveRecord::Base

  belongs_to :employee
  
  belongs_to :logged_hour_type

end
