Cloudinary.config do |config|
  config.cloud_name = ENV["cloud_name"]
  config.api_key = ENV["API_KEY"]
  config.api_secret = ENV["API_SECRET"]
  config.secure = true
  config.cdn_subdomain = true
end

# Cloudinary.cloud_name = 'cloud_name'
# Cloudinary.api_key = 'ENV["API_KEY"]'
# Cloudinary.api_secret = 'ENV["API_SECRET"]'
# Cloudinary.secure = true
# Cloudinary.cdn_subdomain = true