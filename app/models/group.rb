class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members

  validates :user, presence: true
  validates :name, presence: true

  def num_members
    members.size
  end
end
