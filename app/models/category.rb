class Category < ApplicationRecord
  has_many :categorizes
  has_many :opinions, through: :categorizes
end
