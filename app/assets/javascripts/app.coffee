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
  .otherwise('/')

  NotificationProvider.setOptions(
      startTop: 50,
      startRight: 10,
      verticalSpacing: 20,
      horizontalSpacing: 20
    )

])
