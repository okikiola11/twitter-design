module ApplicationHelper
  def avatar_url
    image_tag("default.jpg", alt: @current_user.username)
  end
end
