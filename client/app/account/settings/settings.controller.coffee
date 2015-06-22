'use strict'

app.controller 'SettingsCtrl', ($scope, $state, observeOnScope, Settings, Producteca) ->
  $scope.settings = Settings.query()

  $state.go "settings.tokens"
  $scope.settings.$promise.then (settings) =>
    if not settings.saved
      settings.synchro = stocks: true, prices: true
      settings.identifier = "barcode"

  Producteca.then (Producteca) =>
    observeOnScope $scope, "settings.parsimotionToken"
    .filter ({newValue}) -> newValue?
    .map ({newValue}) -> new Producteca newValue
    .subscribe (producteca) ->
      $scope.user = producteca.user()
      $scope.priceLists = producteca.priceLists()
      $scope.warehouses = producteca.warehouses()

  $scope.save = (form) ->
    $scope.submitted = true

    if form.$valid
      $scope.settings.saved = true
      Settings.update($scope.settings).$promise
      .then ->
        $scope.message = 'Configuración actualizada!'
      .catch ->
        $scope.message = 'Hubo un error :('
