class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', dependent: :destroy

  has_many :likes, dependent: :destroy

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :Text, presence: true, length: { minimum: 2 }
end
