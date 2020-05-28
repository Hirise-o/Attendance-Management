class MsHiriseStaff < ApplicationRecord
  has_many :tr_contact_historys #userに対してtr_contact_historyは複数持つ

  def view_staffs
    '(' + self.staff_no + ')' + self.staff_name
  end

end
