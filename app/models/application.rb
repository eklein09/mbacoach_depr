  class Application < ActiveRecord::Base

    belongs_to :user, foreign_key: "applicant_id", class_name: 'User'
    belongs_to :school
end
