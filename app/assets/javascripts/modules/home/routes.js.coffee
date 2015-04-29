angular.module('home',[])
.config([ '$stateProvider', '$urlRouterProvider',
    ($stateProvider, $urlRouterProvider)->
      $urlRouterProvider.otherwise("/")
      $stateProvider
      .state('home',
        url: '/'
        templateUrl: "home.html"
        controller: 'HomeCtrl'
      )
  ])