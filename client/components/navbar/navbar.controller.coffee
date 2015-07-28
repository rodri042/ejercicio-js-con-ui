'use strict'

angular.module 'ejercicio-js-con-ui-app'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.menu = [
    title: 'Inicio'
    link: '/'
  ]

  $scope.isActive = (route) ->
    route is $location.path()
