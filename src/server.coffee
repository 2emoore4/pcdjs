express = require 'express'

app = express()

app.use express.static 'lib/viewer/'

app.use express.bodyParser()
app.get '/ping', (req, res) ->
  res.end 'pong'

app.listen 8888
console.log 'listening...'
