"use strict"

express = require("express")
passport = require("passport")
config = require("../config/environment")
User = require("../api/user/user.model")

# Passport Configuration
require("./producteca/passport").setup User, config

router = express.Router()
router.use "/producteca", require("./producteca")

module.exports = router
