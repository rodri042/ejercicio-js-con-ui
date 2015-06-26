passport = require("passport")
DropboxOAuth2Strategy = require("passport-dropbox-oauth2").Strategy

exports.setup = (User, config) ->
  # passport.use new DropboxOAuth2Strategy
  #   clientID: config.producteca.clientID
  #   clientSecret: config.producteca.clientSecret
  #   callbackURL: config.producteca.callbackURL
  # , (accessToken, refreshToken, profile, done) ->
  #   User.findOne { provider: "producteca", providerId: profile.id }, (err, user) ->
  #     return done err if err

  #     setTokenAndSave = =>
  #       user.tokens.producteca = accessToken
  #       user.save() ; user
  #     return done null, setTokenAndSave() if user?

  #     user = new User
  #       name: profile.displayName
  #       email: profile.emails[0].value
  #       role: "user"
  #       username: profile.username
  #       provider: "producteca"
  #       providerId: profile.id
  #       tokens:
  #         producteca: accessToken

  #     user.save (err) ->
  #       done err if err
  #       done null, user
