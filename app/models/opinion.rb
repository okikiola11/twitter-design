class Opinion < ApplicationRecord
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
