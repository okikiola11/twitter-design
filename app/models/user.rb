class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id', dependent: :destroy

  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_followings, source: :followed

  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_followings, source: :follower

  mount_uploader :photo, ImageUploader
  mount_uploader :coverimage, ImageUploader
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 50 }

  # Follow another user
  def follow(user)
    # followed << user if !self.following?(user) && self != user
    active_followings.create(followed_id: user.id)
  end

  def unfollow(user)
    # followed.delete(user)
    active_followings.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    # followed.include?(user)
    following.include?(user)
  end

  def not_following
    User.where.not(id: followed).where.not(id: id).order('created_at DESC')
  end
end
