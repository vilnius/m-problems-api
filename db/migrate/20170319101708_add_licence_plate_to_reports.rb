class AddLicencePlateToReports < ActiveRecord::Migration[4.2]
  def up
   add_column :reports, :plate_number, :string
  end

  def down
    remove_column :reports, :plate_number
  end
end
