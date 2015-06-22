"use strict"
express = require("express")
controller = require("./user.controller")
config = require("../../config/environment")
auth = require("../../auth/auth.service")

router = express.Router()

router.get "/me", auth.isAuthenticated(), controller.me
router.get "/:id", auth.isAuthenticated(), controller.show
router.post "/", controller.create

module.exports = router
