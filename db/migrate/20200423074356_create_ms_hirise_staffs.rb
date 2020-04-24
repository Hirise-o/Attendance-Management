class CreateMsHiriseStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_hirise_staffs, primary_key: :staff_no do |t|
      t.integer :staff_no :limit => 4
      t.string :staff_name :limit => 72
      t.datetime :insert_datetime
      t.datetime :update_datetime
      
      t.timestamps
    end
  end
end
