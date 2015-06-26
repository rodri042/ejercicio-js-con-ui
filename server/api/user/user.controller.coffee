"use strict"
User = require("./user.model")
passport = require("passport")
config = require("../../config/environment")
jwt = require("jsonwebtoken")
validationError = (res, err) ->
  res.json 422, err


###*
Get list of users
###
exports.index = (req, res) ->
  User.find {}, (err, users) ->
    return res.send(500, err)  if err
    res.json 200, users
    return

  return


###*
Creates a new user
###
exports.create = (req, res, next) ->
  newUser = new User(req.body)
  newUser.provider = "local"
  newUser.save (err, user) ->
    return validationError(res, err)  if err
    token = jwt.sign(
      _id: user._id
    , config.secrets.session,
      expiresInMinutes: 60 * 5
    )
    res.json token: token
    return

  return


###*
Get a single user
###
exports.show = (req, res, next) ->
  userId = req.params.id
  User.findById userId, (err, user) ->
    return next(err)  if err
    return res.send(401)  unless user
    res.json user.profile
    return

  return


###*
Deletes a user
restriction: 'admin'
###
exports.destroy = (req, res) ->
  User.findByIdAndRemove req.params.id, (err, user) ->
    return res.send(500, err)  if err
    res.send 204

  return


###*
Get my info
###
exports.me = (req, res, next) ->
  userId = req.user._id
  User.findOne _id: userId, (err, user) ->
    return next(err)  if err
    return res.json(401)  unless user
    res.json user
    return

  return


###*
Authentication callback
###
exports.authCallback = (req, res, next) ->
  res.redirect "/"
  return
