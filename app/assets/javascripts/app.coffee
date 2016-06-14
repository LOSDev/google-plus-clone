app = angular.module('GPlusClone', ['Devise', 'ngRoute', 'templates'])

.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
  .when('/register', {
    controller: 'RegisterCtrl',
    templateUrl: 'users/register.html'
  })
  .otherwise('/')

])
