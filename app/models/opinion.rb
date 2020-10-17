class Opinion < ApplicationRecord 
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :Text, presence: true
end
