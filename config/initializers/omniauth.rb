require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
    key = ENV["SPOTIFY_KEY"]
     secret = ENV["SPOTIFY_SECRET"]
  provider :spotify, key, secret, scope: 'user-read-email'
end