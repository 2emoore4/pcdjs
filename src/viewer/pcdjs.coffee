get_pcd_file = (filename) ->
  filetext = ""
  request = new XMLHttpRequest()
  request.onreadystatechange = () ->
    filetext = request.responseText
  request.open "GET", filename, true
  request.send()

init = ->
  pcd_string = get_pcd_file "test.pcd"
  alert pcd_string
