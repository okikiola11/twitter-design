module OpinionsHelper
  def follow_suggestions(user)
    return if current_user.following?(user)

    render 'helper_partials/follow_user', user: user
  end

  def likes_dislike(opinion)
    if opinion.likes.any? { |like| like.user_id == current_user.id }
      render 'helper_partials/unlike', opinion: opinion
    else
      render 'helper_partials/likes', opinion: opinion
    end
  end
end
