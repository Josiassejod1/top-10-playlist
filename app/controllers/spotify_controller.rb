require 'rspotify'
require 'json'
require 'awesome_print'
class SpotifyController < ApplicationController
   

     def hello
      @A = Artist.all
      @A = Artist.order("position")
     end
    
     def sort
      
      
      params[:artist].each_with_index do |id, index|
    
        Artist.where(:id => id.to_i).update_all(
           :position => index+1,
           :id => id.to_i)
     end
    # render nothing: true
     redirect_to({:action => 'hello' })
     end
 
    def hi
       key = ENV["SPOTIFY_KEY"]
        secret = ENV["SPOTIFY_SECRET"]
        RSpotify.authenticate(key, secret)
        @artist = params[:artist];
        
        if @artist != ""
         @result = RSpotify::Artist.search(@artist, limit: 10, market:'US')
         puts ap(@result)
        else 
         flash[:null] = "Please Input Artist Name"
        redirect_to({:action => 'hello' })
        end
    end
    
    def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    puts spotify_user.country
    render nothing: true
    end
    
    def artist
     key = ENV["SPOTIFY_KEY"]
     secret = ENV["SPOTIFY_SECRET"]
     RSpotify.authenticate(key, secret)
     
     @artist  = params[:id]
     @position = params[:position]
     @result = RSpotify::Artist.search(@artist).first
     
      #Generates URI for artists important!!!!!
      @artist_uri = @result.uri
     
     
     #puts @result.images.count
     #Prints out images
     if @result.images.count == 0
        @image = 'not-found.png'
     else
        @image = @result.images[0]['url']
    # puts @result.images
    @track_uri = @result.top_tracks(:US).first(3)

     end
    end
    

    def create
     @A = Artist.create(:name => params[:name], :artist_uri => params[:artist_uri], :image => params[:image], :position => Artist.count + 1)
     redirect_to({:action => 'hello' })
    end
    
    def delete
       @A = Artist.where(name: params[:name]).destroy_all
       #Returns array of ID
      @Artist = Artist.pluck(:id)
       @Artist.each_with_index do |id, index|
        
        #Algorithm that updates position of records after deletion
        Artist.where(:id => id.to_i).update_all(
           :position => index+1,
           :id => id.to_i)
        end
       redirect_to({:action => 'hello' })
      
    end
end
