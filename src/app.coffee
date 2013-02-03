express = require 'express'
routes = require './routes.js'
engines = require "consolidate"

app = express()

app.use('/static', express.static(__dirname + '/public'));
console.log(__dirname+"/public")
app.engine("jade", engines.jade)
app.set('view engine' ,'jade')
app.set('views', __dirname + '/../templates')
routes app


app.listen 80
console.log 'Listening on port 80'
