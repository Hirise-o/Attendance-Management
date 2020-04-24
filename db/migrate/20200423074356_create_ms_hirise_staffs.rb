class CreateMsHiriseStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_hirise_staffs,  id: false do |t|
      t.string :staff_no, 'VARCHAR(4) PRIMARY KEY'
      t.string :staff_name, :limit => 72
      t.datetime :insert_datetime
      t.datetime :update_datetime
      
      t.timestamps
    end
  end
end
