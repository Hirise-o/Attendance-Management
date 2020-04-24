class TrContactHistory < ApplicationRecord
  belongs_to :ms_hirise_staff

  validates :sutaff_no, length: {maximum: 4} # 4文字以下
end
