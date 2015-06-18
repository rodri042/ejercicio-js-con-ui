promisify = require("bluebird").promisifyAll
request = promisify require("request")
md5 = require("MD5")
_ = require("lodash")

module.exports =

# Colppy Api
# credentials = { username: "API_USER", password: "API_PASSWORD" }
# All methods do expect the session object returned by the login.
class ColppyApi
  constructor: ({ username, password }) ->
    @url = "https://login.colppy.com/lib/frontera2/service.php"
    @app = usuario: username, password: md5(password)

  # Login. Returns a session object.
  # credentials = {
  #  username: "USERNAME",
  #  password: "PASSWORD"
  # }
  login: ({ username, password }) =>
    @_doRequest({ service: "Usuario", method: "iniciar_sesion" },
      usuario: username
      password: md5(password)
    ).then ({claveSesion}) =>
      usuario: username
      claveSesion: claveSesion

  # Get the last company of the user
  getLastCompany: (session) =>
    @_doRequest({ service: "Empresa", method: "listar_empresa" },
      {}, session
    ).then (companies) => _.last companies

  # Get all the products
  getProducts: (company, session) =>
    @_doRequest { service: "Inventario", method: "listar_itemsinventario" },
      {
        idEmpresa: company.IdEmpresa
        start: 0,
        limit: 0,
        order: [{ field: "descripcion", dir: "ASC" }],
        filter: []
      }, session

  _doRequest: ({ service, method}, data, session = {}) =>
    data = _.assign data, { sesion: session }

    req =
      url: @url
      json: true
      body:
        auth: @app
        service: { provision: service, operacion: method }
        parameters: data

    request.postAsync(req).spread ({body}) =>
      if body.response?.success isnt true
        throw new Error(body.response?.message || "Y bueh, se rompió")
      else body.response.data
