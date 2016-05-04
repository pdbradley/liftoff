class Member < ActiveRecord::Base
  belongs_to :group

  validates :first_name, :last_name, :phone_number, presence: true
  validates :group, presence: true

end
