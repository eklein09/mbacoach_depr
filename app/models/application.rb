  class Application < ActiveRecord::Base
    validates :applicant_id, presence: true
    validates :school_id, presence: true
    DISPLAY_HELP = { "false" => "No", "true" => "Yes" }


    belongs_to :user, foreign_key: "applicant_id", class_name: 'User'
    belongs_to :school
end
