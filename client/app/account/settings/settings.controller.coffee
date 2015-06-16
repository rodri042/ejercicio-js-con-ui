'use strict'

app.controller 'SettingsCtrl', ($scope, $state, observeOnScope, Settings, Producteca) ->
  $scope.settings = Settings.query()

  $state.go "settings.tokens"

  Producteca.then (Producteca) =>
    observeOnScope $scope, "settings.parsimotionToken"
    .filter ({newValue}) -> newValue?
    .map ({newValue}) -> new Producteca newValue
    .subscribe (producteca) ->
      $scope.user = producteca.user()

  $scope.save = (form) ->
    $scope.submitted = true

    if form.$valid
      Settings.update($scope.settings).$promise
      .then ->
        $scope.message = 'Configuración actualizada!'
      .catch ->
        $scope.message = 'Hubo un error :('
