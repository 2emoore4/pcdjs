two = null

get_pcd_array = (filename) ->
  console.log "getting pcd array"
  request = new XMLHttpRequest()
  request.open "GET", filename, false
  request.send null
  return JSON.parse request.responseText
  console.log "got pcd array: " + request.json

process_file = (filename) ->
  pcd_array = get_pcd_array filename
  console.log "processing points in pcd array" 
  for point in [0..(pcd_array.length - 1)]
    process_point pcd_array[point]
  two.update()

process_point = (point) ->
  create_circle point[0], point[1], point[2]

init_two_stuff = ->
  params = { width: 640, height: 480 }
  two = new Two params
  two.appendTo document.getElementById "render_container"
  two.update()

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
  process_file "latest"
  two.update()
