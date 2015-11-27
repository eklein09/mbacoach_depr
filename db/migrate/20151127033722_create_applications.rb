class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|

      t.integer :school_id

      t.integer :applicant_id

      t.boolean :outcome

      t.integer :submission_year


      t.timestamps

    end

  end
end
