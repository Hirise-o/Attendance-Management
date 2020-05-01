class MsHiriseStaff < ApplicationRecord
  has_many :tr_contact_history #userに対してtr_contact_historyは複数持つ

end
