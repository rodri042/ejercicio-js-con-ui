app.factory "Order", ($resource) ->
  $resource "/api/orders", {},
    query:
      isArray: false
