respond = (res, promise) ->
  promise.then ((data) -> res.send 200, data), (error) -> console.error error ; res.send 500, error

exports.orders = (req, res) ->
  respond res, req.user.getExporter().getFileFromOrders()

exports.sync = (req, res) ->
  respond res, req.user.getExporter().uploadFileFromOrders()
