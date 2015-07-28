###*
Main application routes
###
"use strict"
errors = require("./components/errors")

module.exports = (app) ->
  home = (req, res) ->
    res.sendfile app.get("appPath") + "/main.html"

  # Insert routes below
  app.get "/", home

  # All undefined asset or api routes should return a 404
  app.route("/:url(api|auth|components|app|bower_components|assets)/*").get errors[404]

  # All other routes should redirect to the home
  app.route("/*").get home
