class Project < ActiveRecord::Base
  has_and_belongs_to_many :employees
  has_many :logged_hour_types, dependent: :destroy
  accepts_nested_attributes_for :logged_hour_types, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true, uniqueness: true
end
