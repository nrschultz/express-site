module.exports = (app) ->
    standard_views = require "./views/standard_views.js"
    #
    app.get('/', standard_views.home)
    app.get('/home', standard_views.home)
    app.get('/about', standard_views.about)