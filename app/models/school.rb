class School < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :applications, :dependent => :destroy

  #has_many :users, through: :applications
end
