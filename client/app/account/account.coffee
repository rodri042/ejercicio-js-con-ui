'use strict'

angular.module 'producteca2colppyApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'login',
    url: '/login'
    templateUrl: 'app/account/login/login.html'
    controller: 'LoginCtrl'

  .state 'settings',
    url: '/settings'
    templateUrl: 'app/account/settings/settings.html'
    controller: 'SettingsCtrl'
    authenticate: true

  .state 'settings.tokens',
    url: '/tokens'
    templateUrl: 'app/account/settings/settings-tokens.html'

  .state 'settings.syncer',
    url: '/syncer'
    templateUrl: 'app/account/settings/settings-syncer.html'
