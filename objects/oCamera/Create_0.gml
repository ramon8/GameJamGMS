aspect = 15;
camera = camera_create_view(x, y, 400 * aspect, 300 * aspect, 0);

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(400 * aspect, 300 * aspect, -10000, 10000);


camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);


view_camera[0] = camera;

follow = oPlanet;
angle = 0;

xTo = x;
yTo = y;