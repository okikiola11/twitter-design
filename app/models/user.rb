class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'

  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followed, through: :active_followings

  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :passive_followings

  mount_uploader :photo, ImageUploader
  mount_uploader :coverimage, ImageUploader
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 50 }

  def follow(user)
    followed << user if !self.following?(user) && self != user
  end

  def unfollow(user)
    followed.delete(user)
  end

  def following?(user)
    followed.include?(user)
  end
end
