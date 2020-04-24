class MsHiriseStaff < ApplicationRecord
  has_many :tr_contact_historys #userはtr_contact_historyに対して複数持つ

  self.primary_ker = "staff_no"

  validates :staff_no, length: {maximum: 4}
  validates :staff_name, length: {maximum: 72}
end
