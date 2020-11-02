class Like < ApplicationRecord
  belongs_to :opinion
  belongs_to :user

  def self.find_user_like(userid, opinionid)
    Like.where(user_id: userid).where(opinion_id: opinionid)[0]
  end
end
