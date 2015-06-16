'use strict'

app.controller 'MainCtrl', ($scope, $http, Order, Auth) ->
  Auth.getCurrentUser().$promise?.then (user) ->
    $scope.lastSync = user.lastSync

  $scope.orders = Order.query()
  $scope.file = ""

  $scope.sincronizar = ->
    $scope.isSincronizando = true

    $http.post("/api/orders").success (resultado) ->
      $scope.lastSync = resultado
      $scope.isSincronizando = false

      $scope.lastSync = resultado
