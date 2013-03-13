express = require 'express'
routes = require './routes.js'
engines = require "consolidate"

app = express()

app.use('/static', express.static(__dirname + '/public'));
app.engine("jade", engines.jade)
app.set('view engine' ,'jade')
app.set('views', __dirname + '/../templates')
routes app


app.configure('local', ->
  app.set('port', 3000)
)

app.configure('prod', ->
  app.set('port', 80)
)

port = app.get('port')
app.listen port
console.log "Listening on port #{port}"
