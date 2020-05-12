class CreateMsHiriseStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_hirise_staffs, id: false do |t|
      t.string :staff_no, primary_key: true, limit: 4
      t.string :staff_name, :limit => 72
      
      t.timestamps
    end
  end
end
