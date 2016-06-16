angular.module('GPlusClone')
.controller('IndexCtrl', [
  '$scope', 'Auth', 'Posts', 'Notification', 'ngDialog'
  ($scope, Auth, Posts, Notification, ngDialog) ->
    $scope.signedIn = Auth.isAuthenticated
    $scope.posts = []

    Posts.getPosts()
    .then (resp) ->
      $scope.posts = resp.data
    .catch (error) ->
      Notification.error(error.error)

    $scope.$on('post.created', (event, post) ->
      $scope.posts.unshift(post)
    )

    $scope.$on('post.created.error', ->
      $scope.posts.shift()
    )

  ])
