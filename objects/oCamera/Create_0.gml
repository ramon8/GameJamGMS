camera = camera_create();
aspect = 3;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(160 * aspect, 120 * aspect, -10000, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;

xTo = x;
yTo = y;

global.debug = debug_mode;