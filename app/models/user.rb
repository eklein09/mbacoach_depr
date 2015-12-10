class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # validates :major, presence: true
  # validates :industry, presence: true
  validates :gmat, presence:true, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 800, only_integer: true }
  validates :gpa, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
  validates :collegerank, presence: true, numericality: { only_integer: true }
  validates :major, presence: true

  has_many :applications, :dependent => :destroy, foreign_key: :applicant_id

end
