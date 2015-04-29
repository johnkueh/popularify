class PagesController < ApplicationController
  def home
  end

  def playlist
    auth_spotify
    @playlist = playlist_parsed
  end

  def auth_spotify
    client_id = '450b23ce91dd40db93b513e0fe2e230c'
    client_secret = '5a378dcda9e24fed8e46bc9b034363fb'
    RSpotify.authenticate(client_id, client_secret)
  end

  def playlist_parsed
    response = RSpotify::Playlist.find(params[:owner_id], params[:playlist_id])
    top_tracks = response.tracks.sort!{|a,b|a.popularity <=> b.popularity}.reverse[0..39]
    popularity_total = top_tracks.map { |t| t.popularity }.inject(:+)
    OpenStruct.new(
      owner_id: params[:owner_id],
      playlist_id: params[:playlist_id],
      name: response.name,
      description: response.description,
      tracks: top_tracks,
      popularity_total: popularity_total
    )
  end
end
