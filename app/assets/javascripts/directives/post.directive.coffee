angular.module('GPlusClone')
  .directive('post', ->
    restrict: 'E',
    scope: {
      post: '='
    },
    templateUrl: 'posts/post.html'
)
