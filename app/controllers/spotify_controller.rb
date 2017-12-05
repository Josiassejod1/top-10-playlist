require 'rspotify'
require 'json'
require 'awesome_print'
class SpotifyController < ApplicationController
    def hello
    end
    
    def hi
        RSpotify.authenticate("a40b9858e96946819ffdcfa45239c8c1", "31de96cfb3ef4fe4941ea49a9fd92351")
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
