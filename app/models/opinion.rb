class Opinion < ApplicationRecord 
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categorizes
  has_many :categories, through: :categorizes

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :Text, presence: true
end
