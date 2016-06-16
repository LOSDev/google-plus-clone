angular.module('GPlusClone')
  .directive 'posts', ->

    controller: 'PostsCtrl',
    restrict: 'E',
    scope: {
      posts: '='
    },
    templateUrl: 'posts/posts.html'
