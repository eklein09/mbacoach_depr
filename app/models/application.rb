class Application < ActiveRecord::Base

  belongs_to :school
  belongs_to :user
end
