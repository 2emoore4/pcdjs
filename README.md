pcdjs

WebGL point cloud viewer using three.js, node, and coffeescript.

This will eventually be a simple server with a frontend that allows you to
browse and view pcd (point cloud) files. I'm doing this because I've been
coding on a chromebook using arch linux and I can't get open gl to work, so I
can't use any point cloud viewers. It's really easy to switch back to chromeos,
which supports webgl. So when I create point clouds, I'll upload them to my
server, then browse and view them using this application. Hopefully it works
well.

I doubt that this code will ever be used in its entirety, but some of it could
probably be used as a reference. Most of the interesting stuff is in
src/viewer/pcdjs.coffee. That script will be doing all of the rendering.

To compile:
		coffee --compile --bare --output lib src

To run:
		node lib/server.js

I don't even have pcd's being loaded yet, but that will eventually be there.
