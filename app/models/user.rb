class User < ActiveRecord::Base
  include Clearance::User

  has_many :groups
end
