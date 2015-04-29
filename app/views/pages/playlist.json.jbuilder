json.owner_id @playlist.owner_id
json.playlist_id @playlist.playlist_id
json.name @playlist.name
json.description @playlist.description
json.popularity_total @playlist.popularity_total
json.tracks @playlist.tracks do |track|
  json.(track, :name, :popularity)
end