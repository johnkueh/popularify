angular.module('spotify.api', [])
.factory 'SpotifyAPI', ["$http", "$q"
  ($http, $q) ->
    fetchPlaylist: (ownerId, playlistId) ->
      deferred = $q.defer()
      promise = deferred.promise
      $http.get("/playlist?owner_id=#{ownerId}&playlist_id=#{playlistId}", headers: {
        'Accept': 'application/json'
      }).then(
        (data) ->
          deferred.resolve(data.data)
        (err) ->
          deferred.reject(err)
      )
      return promise
]