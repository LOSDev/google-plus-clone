angular.module('GPlusClone')
.controller('NavbarCtrl', [
  '$scope', '$rootScope', 'Auth', '$location'
  ($scope, $rootScope, Auth, $location) ->
    Auth.currentUser()
    $scope.signedIn = Auth.isAuthenticated

    $scope.logout = ->
      Auth.logout().then (resp) ->

    $scope.$on('devise:new-registration', (e, user) ->
      $scope.user = user
      $rootScope.currentUser = Auth._currentUser
    )
    $scope.$on('devise:login', (e, user) ->
      $scope.user = user
      $rootScope.currentUser = Auth._currentUser
    )
    $scope.$on('devise:logout', (e, user) ->
      $scope.user = {}
      $rootScope.currentUser = false
    )

  ])
