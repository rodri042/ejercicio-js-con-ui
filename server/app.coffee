"use strict"
###*
Main application file
###

# Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV or "development"
express = require("express")
config = require("./config/environment")

# Setup server
app = express()
server = require("http").createServer(app)
require("./config/express") app
require("./routes") app

exports = module.exports =
  app: app
  server: server
  ip: config.ip
  port: config.port
  env: app.get "env"
