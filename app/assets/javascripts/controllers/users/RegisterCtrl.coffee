angular.module('GPlusClone')
.controller('RegisterCtrl', [
  '$location', '$scope', 'Auth',
  ($location, $scope, Auth) ->
    $scope.user = {}

    $scope.register = ->
      console.log $scope.user
      Auth.register($scope.user).then ->
        $state.go('home')
  ])
