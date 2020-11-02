module OpinionsHelper
  def follow_suggestions(user)
    return if current_user.following?(user)

    render 'helper_partials/follow_user', user: user
  end

  def likes_dislike(opinion)
    if opinion.likes.any? { |like| like.user_id == current_user.id }
      link_to opinion_like_path(opinion, opinion.likes.ids), class: 'btn', method: :delete do
        render 'helper_partials/unlike', opinion: opinion
      end    
    else
      link_to opinion_likes_path(opinion), class: 'btn', method: :post do
        render 'helper_partials/likes', opinion: opinion
      end   
    end
  end
end
