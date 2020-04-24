class MsHiriseStaff < ApplicationRecord
  has_many :tr_contact_historys #userはtr_contact_historyに対して複数持つ

end
