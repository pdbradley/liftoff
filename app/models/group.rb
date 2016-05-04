class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members

  validates :user, presence: true
  validates :name, presence: true
end
