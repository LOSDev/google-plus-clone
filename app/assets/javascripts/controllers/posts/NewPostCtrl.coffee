angular.module('GPlusClone')
  .controller('NewPostCtrl',
  ['$scope', '$rootScope', 'Auth', 'Notification', 'Posts', 'ngDialog'
  ($scope, $rootScope, Auth, Notification, Posts, ngDialog) ->
    $scope.post = {}

    $scope.submit = ->
      $rootScope.$broadcast('post.created', {
        content: $scope.post.content,
        user: {
          username: Auth._currentUser.username
        }
      });
      $scope.closeThisDialog()

      Posts.createPost($scope.post)
      .then (resp) ->
        Notification.info('Success! Post created.')
      .catch (resp) ->
        $rootScope.$broadcast('post.created.error');
        Notification.error(resp.error);
  ])
