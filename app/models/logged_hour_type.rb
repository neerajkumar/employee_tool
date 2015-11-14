class LoggedHourType < ActiveRecord::Base
  belongs_to :project
  has_many :logged_hours
end
