express = require 'express'
routes = require './routes.js'

app = express()
routes app

app.listen 80
console.log 'Listening on port 80'
