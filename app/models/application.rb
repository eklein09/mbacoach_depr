  class Application < ActiveRecord::Base
    validates :applicant_id, existence: true
    validates :school_id, existence: true
    DISPLAY_HELP = { "false" => "No", "true" => "Yes" }


    belongs_to :user, foreign_key: "applicant_id", class_name: 'User'
    belongs_to :school
end
