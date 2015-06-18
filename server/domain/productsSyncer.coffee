ColppyApi = require("./colppyApi")
SDK = require("producteca-sdk")
ProductecaApi = SDK.Api
Adjustment = SDK.Sync.Adjustment
Syncer = SDK.Sync.Syncer
config = require("../config/environment")

module.exports = new

class ProductsSyncer
  constructor: (@user, @settings)->
    @colppyApi = new ColppyApi config.colppy
    @productecaApi = new ProductecaApi accessToken: config.producteca.uri
