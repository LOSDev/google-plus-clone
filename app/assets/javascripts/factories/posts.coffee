angular.module('GPlusClone')
  .factory('Posts', ['$http', ($http) ->

    urlBase = '/posts'
    o = {}

    o.getPosts = ->
      return $http.get(urlBase + '.json')

    o.getPost = (id) ->
      return $http.get(urlBase + '/' + id + '.json')

    o.createPost = (post) ->
      return $http.post(urlBase + '.json', post)

    return o
])
