scene = null
renderer = null
camera = null
controls = null

create_cube = (x, y, z) -> 
  cube_material = new THREE.MeshLambertMaterial { color: 0xCC0000 }

  cube_geometry = new THREE.CubeGeometry 1, 1, 1
  cube = new THREE.Mesh cube_geometry, cube_material

  cube.position.x = x
  cube.position.y = y
  cube.position.z = z

  scene.add cube

init_three_stuff = ->
  WIDTH = 640
  HEIGHT = 480
  VIEW_ANGLE = 45
  ASPECT = WIDTH / HEIGHT
  NEAR = 0.1
  FAR = 10000

  render_container = document.getElementById "render_container"

  renderer = new THREE.WebGLRenderer()
  camera = new THREE.PerspectiveCamera VIEW_ANGLE, ASPECT, NEAR, FAR
  scene = new THREE.Scene()
  scene.add camera
  camera.position.z = 300
  renderer.setSize WIDTH, HEIGHT
  render_container.appendChild renderer.domElement

  point_light = new THREE.PointLight 0xFFFFFF
  point_light.position.x = 10
  point_light.position.y = 50
  point_light.position.z = 130

  scene.add point_light

  controls = new THREE.OrbitControls camera, renderer.domElement

render_scene = ->
  renderer.render scene, camera
  controls.update()
  window.requestAnimationFrame render_scene

init = ->
  init_three_stuff()
  for x in [0..640]
    for y in [0..480]
      create_cube x, y, 0
  render_scene()
