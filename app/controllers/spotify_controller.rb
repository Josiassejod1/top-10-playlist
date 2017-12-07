require 'rspotify'
require 'json'
require 'awesome_print'
class SpotifyController < ApplicationController
    def hello
     @A = Artist.all
         
    end
    
    def hi
       key = ENV["SPOTIFY_KEY"]
        secret = ENV["SPOTIFY_SECRET"]
        
        RSpotify.authenticate(key, secret)
        @artist = params[:artist];
         @result = RSpotify::Artist.search(@artist, limit: 10, market:'US')
         puts ap(@result)
         
         
         
         
        #render json: result
       # render json: result
    end
    
    def artist
     @artist  = params[:id]
     @result = RSpotify::Artist.search(@artist).first
     
   puts  @artist_uri = @result.uri
     
     
     #puts @result.images.count
     #Prints out images
     if @result.images.count == 0
        @image = 'not-found.png'
     else
        @image = @result.images[0]['url']
    # puts @result.images
    @track_uri = @result.top_tracks(:US).first(3)
     #render json: @uri
     #render json: params[:id]
     end
    end
    
    def index
    end

    def create
     @A = Artist.create(:name => params[:name], :artist_uri => params[:artist_uri], :image => params[:image], :position => 1)
     puts @A
     redirect_to({:action => 'hello' })
    end
    
    def track
    end
    
    def delete
    @A = Artist.where(name: params[:name]).destroy_all
    redirect_to({:action => 'hello' })
   end
    
end
