class User < ApplicationRecord
  has_many :to_dos

  validates :psid, uniqueness: true
end
