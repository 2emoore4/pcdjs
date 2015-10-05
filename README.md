pcdjs

WebGL point cloud viewer using two.js, node, and coffeescript.

I doubt that this code will ever be used in its entirety, but some of it could
probably be used as a reference. Most of the interesting stuff is in
src/viewer/pcdjs.coffee. That script will be doing all of the rendering.

To compile:
		coffee --compile --bare --output lib src

To run:
		node lib/server.js
