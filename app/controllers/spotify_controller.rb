class SpotifyController < ApplicationController
  def search
    # You can add your search logic here
  end

  def display
    if params[:query].present?
      @playlists = RSpotify::Playlist.search(params[:query]).first(5)
      @tracks = RSpotify::Track.search(params[:query]).first(5)
    else
      @playlists = []
      @tracks = []
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'spotify/results', locals: { playlists: @playlists, tracks: @tracks }, formats: [:html]}
    end
  end


end
