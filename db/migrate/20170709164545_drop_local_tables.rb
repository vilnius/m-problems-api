class DropLocalTables < ActiveRecord::Migration
  def change
    drop_table :report_photos
    drop_table :report_types
    drop_table :reports
  end
end