module UsersHelper
  def profile_coverimage(user)
    if user[:coverimage].nil?
      cover_image user.id
    else
      render 'helper_partials/show_cover_img', user: user
    end
  end

  def user_photo(_user)
    if @user[:photo].nil?
      user_image(@user)
    else
      image_tag @user.photo.thumb.url, class: 'rounded-circle'
    end
  end

  def opinion_avatar(opinion)
    if opinion.author[:photo].nil?
      user_avatar opinion.author, size: 50
    else
      image_tag opinion.author.photo.thumb.url
    end
  end

  def opinion_likes(opinion)
    opinion.likes.count
  end

  def opinion_likes_count(opinion)
    opinion.likes.count == 1 ? 'Like' : 'Likes'
  end

  def follow_unfollow_users
    follow_unfollow(@user) unless current_user?(@user)
  end

  def follow_unfollow(user)
    if !current_user.following?(user)
      render 'helper_partials/follow_btn', user: user
    else
      render 'helper_partials/unfollow_btn', user: user
    end
  end

  def user_opinion_likes(opinion)
    render 'opinions/partials/opinion_likes', opinion: opinion if opinion.likes.any?
  end
end
