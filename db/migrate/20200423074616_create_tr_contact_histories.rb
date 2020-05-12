class CreateTrContactHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_contact_histories, primary_key: :unique_id, unsigned: true do |t|
      t.references :ms_hirise_staff, type: :string, limit: 4
      t.datetime :contact_datetime, null: false
      t.integer :contact_registration_type

      t.timestamps
    end
    add_foreign_key :tr_contact_histories, :ms_hirise_staffs, colmun: :staff_no, primary_key: :staff_no
  end
end
