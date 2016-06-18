angular.module('GPlusClone')
.controller('UserSettingsCtrl', [
  '$scope', '$location', '$routeParams', 'Auth', 'Notification', 'Users'
  ($scope, $location, $routeParams, Auth, Notification, Users) ->

    $scope.profile = null

    activate = ->
      username = $routeParams.username.substr(1)

      Auth.currentUser()
      .then (user) ->
        if (user.username != username)
          $location.url('/')
          Notification.error('You are not authorized to view this page.')
      , (error) ->
        $location.url('/')
        Notification.error('You are not authorized to view this page.')

      Users.getUser(username)
      .then (resp) ->
        $scope.profile = resp.data
      .catch (resp) ->
        $location.url('/')
        Notification.error('That user does not exist.')

    $scope.destroy = ->
      Users.deleteUser()
      .then (resp) ->
        Auth.logout()
        window.location = '/'
        Notification.info('Your account has been deleted.')
      .catch (resp) ->
        Notification.error(resp.error)

    $scope.update = ->
      Users.updateUser($scope.profile)
      .then (resp) ->
        Notification.info('Your profile has been updated.');
      .catch (resp) ->
        Notification.error(resp.error)

    activate()


  ])
