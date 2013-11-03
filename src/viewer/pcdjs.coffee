scene = null
renderer = null
camera = null
controls = null

show_sphere = -> 
  radius = 50
  segments = 2
  rings = 2

  sphere_material = new THREE.MeshLambertMaterial { color: 0xCC0000 }

  sphere_geometry = new THREE.SphereGeometry radius, segments, rings
  sphere = new THREE.Mesh sphere_geometry, sphere_material

  scene.add sphere

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
  show_sphere()
  render_scene()
