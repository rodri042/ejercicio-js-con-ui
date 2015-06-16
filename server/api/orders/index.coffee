"use strict"
express = require("express")
controller = require("./orders.controller.coffee")
auth = require("../../auth/auth.service")

router = express.Router()

router.get "/", auth.isAuthenticated(), controller.orders
router.post "/", auth.isAuthenticated(), controller.sync

module.exports = router
