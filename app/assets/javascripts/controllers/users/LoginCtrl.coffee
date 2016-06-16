angular.module('GPlusClone')
.controller('LoginCtrl', [
  '$location', '$scope', 'Auth',
  ($location, $scope, Auth) ->
    $scope.user = {}

    if Auth.isAuthenticated()
      $location.url('/')

    $scope.login = ->
      Auth.login($scope.user).then ->
        $location.url('/')

  ])
