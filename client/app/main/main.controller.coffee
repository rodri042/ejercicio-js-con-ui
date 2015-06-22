'use strict'

app.controller 'MainCtrl', ($scope, $http, Auth) ->
  Auth.getCurrentUser().$promise?.then (user) ->
    $scope.lastSync = user.lastSync
