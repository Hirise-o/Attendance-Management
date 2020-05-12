class TrContactHistory < ApplicationRecord
  belongs_to :ms_hirise_staff, optional: true

end
