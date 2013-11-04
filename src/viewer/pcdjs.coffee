two = null
pcd_string = ""

get_pcd_file = (filename) ->
  request = new XMLHttpRequest()
  request.open "GET", filename, false
  request.send null
  return request.responseText

process_file = (filename) ->
  pcd_string = get_pcd_file filename
  lines = pcd_string.split "\n"
  for line in [11..(lines.length - 1)]
    process_point lines[line]
    two.update()

process_point = (line) ->
  values = line.split " "
  radius = translate values[2], -20, 50, 0.3, 3
  create_circle values[0], 480 - values[1], radius

init_two_stuff = ->
  params = { width: 640, height: 480 }
  two = new Two params
  two.appendTo document.getElementById "render_container"

create_circle = (x, y, r) ->
  circle = two.makeCircle x, y, r
  circle.fill = "#FF8000"
  circle.noStroke()

translate = (value, left_min, left_max, right_min, right_max) ->
  left_span = left_max - left_min
  right_span = right_max - right_min

  value_scaled = (value - left_min) / left_span

  return right_min + (value_scaled * right_span)

init = ->
  init_two_stuff()

  process_file "test.pcd"

  two.update()
