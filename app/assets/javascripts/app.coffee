app = angular.module('GPlusClone', ['Devise', 'ngRoute', 'templates', 'ui-notification', 'ngDialog'])

.config(['$routeProvider', '$locationProvider', 'NotificationProvider',
 ($routeProvider, $locationProvider, NotificationProvider) ->
  $routeProvider
  .when('/', {
    controller: 'IndexCtrl',
    templateUrl: 'shared/index.html'
  })
  .when('/register', {
    controller: 'RegisterCtrl',
    templateUrl: 'users/register.html'
  })
  .when('/login', {
    controller: 'LoginCtrl',
    templateUrl: 'users/login.html'
  })
  .when('/+:username/settings', {
    controller: 'UserSettingsCtrl',
    templateUrl: 'users/userSettings.html'
  })
  .when('/+:username', {
    controller: 'UserDetailsCtrl',
    templateUrl: 'users/userDetails.html'
  })
  .otherwise('/')

  NotificationProvider.setOptions(
      startTop: 50,
      startRight: 10,
      verticalSpacing: 20,
      horizontalSpacing: 20
    )

])
