module ApplicationHelper
  def user_avatar(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.username.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

  def cover_image(_user)
    image_tag('cover-image', alt: @user.username, class: 'cover-img')
  end
end
