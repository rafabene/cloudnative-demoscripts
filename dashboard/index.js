var express = require('express')
var mustacheExpress = require('mustache-express')
var app = express()

// Register '.html' extension with The Mustache Express
app.engine('html', mustacheExpress())
app.engine('json', mustacheExpress())

app.set('view engine', 'mustache')
app.set('views', __dirname)

// Return a custom index.html file
var customIndex = function (req, res) {
    var view = {
      dashboard: process.env.ENABLE_DASHBOARD ? JSON.parse(process.env.ENABLE_DASHBOARD): null,
      istio: process.env.ENABLE_ISTIO ? JSON.parse(process.env.ENABLE_ISTIO): null,
      jenkins: process.env.ENABLE_JENKINS ? JSON.parse(process.env.ENABLE_JENKINS): null,
    }
    res.render('index.html', view)
  }
  
  app.get('/', customIndex)
  app.get('/index.html', customIndex)

  // Serve all static files
app.use('/', express.static('.'))

var server = app.listen(8080, '0.0.0.0', function () {
  var host = server.address().address
  var port = server.address().port

  console.log('Dashboard service running at http://%s:%s', host, port)
})
  