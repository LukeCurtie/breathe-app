class SpotifyController < ApplicationController
  def search
    # You can add your search logic here
  end

  def display
    if params[:query].present? && params[:query].length > 2
      @playlists = RSpotify::Playlist.search(params[:query]).first(5)
      @tracks = RSpotify::Track.search(params[:query]).first(5)
    else
      @playlists = []
      @tracks = []
    end
  end
end
