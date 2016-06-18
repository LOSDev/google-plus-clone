angular.module('GPlusClone')
  .factory('Users', ['$http', ($http) ->

    urlBase = '/users'
    o = {}

    o.getUser = (id) ->
      return $http.get(urlBase + '/' + id + '.json')

    o.getPosts = (id) ->
      return $http.get(urlBase + '/' + id + '/posts.json')

    o.updateUser = (user) ->
      return $http.put(urlBase + '.json', user: user)

    o.deleteUser = ->
      return $http.delete(urlBase + '.json')

    return o
])
