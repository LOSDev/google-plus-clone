angular.module('GPlusClone')
.controller('RegisterCtrl', [
  '$location', '$scope', 'Auth',
  ($location, $scope, Auth) ->
    $scope.user = {}

    if Auth.isAuthenticated()
      $location.url('/')

    $scope.register = ->
      Auth.register($scope.user).then ->

    $scope.$on('devise:new-registration', (event, user) ->
      Auth.login(user).then (resp) -> $location.url('/')
    )

  ])
