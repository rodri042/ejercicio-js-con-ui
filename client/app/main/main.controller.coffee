'use strict'

app.controller 'MainCtrl', ($scope, $http, Order, Auth) ->
  Auth.getCurrentUser().$promise?.then (user) ->
    $scope.lastSync = user.lastSync

  $scope.file = ""

  $scope.sincronizar = ->
    $scope.isSincronizando = true

