class MsHiriseStaff < ApplicationRecord
  has_many :tr_contact_historys #userに対してtr_contact_historyは複数持つ

end
