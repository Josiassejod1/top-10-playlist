require 'rspotify'
require 'json'
require 'awesome_print'
class SpotifyController < ApplicationController
    def hello
    end
    
    def hi
       key = ENV["SPOTIFY_KEY"]
        secret = ENV["SPOTIFY_SECRET"]
        
        RSpotify.authenticate(key, secret)
        @artist = params[:artist];
         result = RSpotify::Artist.search(@artist)
         puts ap(result)
        render json: result
       # render json: result
    end
    
    def album
    end
    
    def index
    end

    def create
    end
    
    def track
    end
end
