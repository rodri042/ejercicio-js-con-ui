# ejercicio-js-con-ui
Please, replace the string "ejercicio-js-con-ui" with the name you want, in all the project.

## Setup

```bash
#(instalar mongodb-org)

npm install
bower install
```

Crear `/server/config/local.env.coffee` con:
```coffee
"use strict"

# Use local.env.js for environment variables that grunt will set when the server starts locally.
# Use for your api keys, secrets, etc. This file should not be tracked by git.
#
# You will need to set these on the server you deploy to.
module.exports =
 DOMAIN: "http://localhost:9000"
 SESSION_SECRET: "***"
 VARIABLE: "***"

 # Control debug level for modules using visionmedia/debug
 DEBUG: ""
```

Los valores de estos atributos son secretos, por eso este archivo se encuentra ignorado en el versionado.

## Servidor

```bash
grunt serve
```

## Tests

```bash
grunt test:client
grunt test:server
```
