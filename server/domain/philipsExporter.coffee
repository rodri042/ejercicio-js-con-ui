FixedLengthBuilder = require("./utils/fixedLengthBuilder")
ProductecaApi = require("producteca-sdk").Api
Promise = require("bluebird")
DropboxClient = require("dropbox").Client
_ = require("lodash")
config = require("../config/environment")

module.exports =

class PhilipsExporter
  constructor: (@user) ->
    @api = new ProductecaApi
      accessToken: @user.tokens.parsimotion
      url: config.parsimotion.uri

    @dropbox = Promise
      .promisifyAll new DropboxClient token: @user.tokens.dropbox

    @builder = new FixedLengthBuilder [
      { name: "id", length: 12 }
      { name: "lines[0].product.sku", length: 30 },
      { name: "lines[0].price", length: 12, decimals: 2 }
      { name: "lines[0].quantity", length: 10, decimals: 2 }
      { name: "shippingCost", length: 12, decimals: 2 }
      { name: "contact.taxId", length: 11 }
      { name: "contact.contactPerson", length: 27 }
      { name: "contact.name", length: 20 }
      { name: "contact.location.address", length: 40 }
      { name: "contact.phoneNumber", length: 20 }
      { name: "contact.location.state", length: 30 }
      { name: "contact.location.zipCode", length: 10 }
      { name: "contact.location.city", length: 20 }
    ]

  getFileFromOrders: =>
    @api.getSalesOrders()
      .then @getFile
      .then (content) => file: content

  getFile: (orders) => @builder.build orders, true

  uploadFileFromOrders: =>
    @getFileFromOrders().then (orders) =>
      buffer = new Buffer orders.file, "ascii"

      @dropbox
        .writeFileAsync "orders.txt", buffer
        .then (stat) =>
          @user.lastSync.date = new Date()
          @user.save()
          @user.lastSync
