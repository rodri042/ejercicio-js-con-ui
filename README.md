# Producteca->colppy
[![Build Status](https://semaphoreci.com/api/v1/projects/f3b4e1f2-dc1d-4ed2-9cd3-9b74dd2af6db/462640/badge.svg)](https://semaphoreci.com/andreskir/producteca2colppy)      

## Setup

```bash
#(instalar mongodb-org)

npm install
bower install
bundle install
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
 DROPBOX_ID: "***"
 DROPBOX_SECRET: "***"

 # Control debug level for modules using visionmedia/debug
 DEBUG: ""
```

Los valores de estos atributos son secreto de estado, pero pueden obtenerse desde la sección de variables de entorno del hosting.

## Servidor

```bash
grunt serve
```

## Tests

```bash
grunt test:client
grunt test:server
```
