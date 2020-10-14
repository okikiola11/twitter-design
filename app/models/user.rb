class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 50 }
end
