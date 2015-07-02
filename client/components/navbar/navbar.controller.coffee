'use strict'

angular.module 'integration-seed-app'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [
    title: 'Inicio'
    link: '/'
  ]
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.isActive = (route) ->
    route is $location.path()

  $scope.logout = ->
    window.location = "/logout"
