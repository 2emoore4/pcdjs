express = require 'express'
fs = require 'fs'

translate = (value, left_min, left_max, right_min, right_max) ->
  left_span = left_max - left_min
  right_span = right_max - right_min

  value_scaled = (value - left_min) / left_span

  return right_min + (value_scaled * right_span)

process_file = (filename, result) ->
  console.log 'opening file ' + filename
  fs.readFile filename, 'utf8', (err, data) ->
    if err
      console.log 'file open was not successful:\n' + err
      result.status 404
      result.end '404, check the console output'
    else
      pcd_json = pcd_to_json data
      result.json pcd_json
      result.end
      console.log 'sent point array'

pcd_to_json = (data) ->
  console.log 'creating array of points'
  output = []
  lines = data.split '\n'
  for line in [11..(lines.length - 1)]
    output.push process_point lines[line]
  return output

process_point = (point_line) ->
  values = point_line.split ' '
  radius = translate values[2], -20, 50, 0.3, 3
  return [values[0], 480 - values[1], radius]

app = express()

app.use express.static 'lib/viewer/'

app.use express.bodyParser()
app.get '/ping', (req, res) ->
  res.end 'pong'

app.get '/latest', (req, res) ->
  console.log 'getting a request for latest pcd file'
  process_file 'lib/viewer/test.pcd', res

  pcd_file_list = fs.readdirSync "/srv/pcd"
  console.log pcd_file_list

app.listen 8888
console.log 'listening...'
