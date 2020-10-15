class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 50 }
end
