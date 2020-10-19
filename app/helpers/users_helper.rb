module UsersHelper
  def user_coverimage(user)
    if user.coverimage.nil? 
      puts 'get in here'
    else
      render 'helper_partials/show_cover_img', user: user
    end 
  end

  def opinion_avatar(opinion)
    if opinion.author.photo.nil? 
      puts 'get in here'
    else 
     image_tag opinion.author.photo.thumb.url
    end
  end

  def likes_dislike(opinion)
    if opinion.likes.any? { |like| like.user_id == current_user.id }
      render 'helper_partials/unlike', opinion: opinion
    else 
      render 'helper_partials/likes', opinion: opinion
    end 
  end

  def opinion_likes(opinion)
    opinion.likes.count
  end

  def opinion_likes_count(opinion)
    opinion.likes.count == 1 ? 'Like' : 'Likes'
  end
end
