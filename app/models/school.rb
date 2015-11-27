class School < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :applications

  has_many :users, through: :applications
end
