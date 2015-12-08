class School < ActiveRecord::Base
  validates :name, existence:true, uniqueness: true

  has_many :applications, :dependent => :destroy

  #has_many :users, through: :applications
end
