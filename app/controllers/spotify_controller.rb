class SpotifyController < ApplicationController
  def search
    # You can add your search logic here


  end

  def display
    if params[:query].present?
      @playlists = RSpotify::Playlist.search(params[:query]).first(5)
      @playlists.each do |playlist|
        puts playlist.name
      end
    end
  end
end
