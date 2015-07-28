'use strict'

angular.module 'ejercicio-js-con-ui-app'
.factory 'User', ($resource) ->
  $resource '/api/users/:id/:controller',
    id: '@_id'
  ,
    get:
      method: 'GET'
      params:
        id: 'me'

