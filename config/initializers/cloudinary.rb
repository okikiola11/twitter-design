# Cloudinary.config do |config|
#   config.cloud_name = ENV["cloud_name"]
#   config.api_key = ENV["API_KEY"]
#   config.api_secret = ENV["API_SECRET"]
#   config.secure = true
#   config.cdn_subdomain = true
# end

Rails.application.credentials.cloudinary[:cloud_name]
Rails.application.credentials.cloudinary[:api_key]
Rails.application.credentials.cloudinary[:api_secret]