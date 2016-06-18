angular.module('GPlusClone')
.controller('UserDetailsCtrl', [
  '$scope', '$location', '$routeParams', 'Posts', 'Notification', 'Users'
  ($scope, $location, $routeParams, Posts, Notification, Users) ->
    $scope.profile = {}
    $scope.posts = []

    username = $routeParams.username.slice(1)
    Users.getUser(username)
    .then (resp) ->
      $scope.profile = resp.data
    .catch (resp) ->
      $location.url('/')
      Notification.error('That user does not exist.')

    Users.getPosts(username)
    .then (resp) ->
      $scope.posts = resp.data
    .catch (resp) ->
      Notification.error(resp.data.error)

  ])
