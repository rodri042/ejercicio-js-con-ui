'use strict'

app.controller 'SettingsCtrl', ($scope, $state, observeOnScope, Settings, Producteca) ->
  $scope.settings = Settings.query()

  $state.go "settings.step1"
  $scope.settings.$promise.then (settings) =>
    if not settings.saved
      # set to settings some default values

  $scope.save = (form) ->
    $scope.submitted = true

    if form.$valid
      $scope.settings.saved = true
      Settings.update($scope.settings).$promise
      .then ->
        $scope.message = 'Configuración actualizada!'
      .catch ->
        $scope.message = 'Hubo un error :('
