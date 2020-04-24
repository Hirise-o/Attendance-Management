class CreateTrContactHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_contact_histories, primary_key: :unique_id do |t|
      t.integer :staff_no
      t.datetime :contact_datetime
      t.datetime :insert_datetime
      t.datetime :update_datetime
      
      t.timestamps
    end
  end
end
