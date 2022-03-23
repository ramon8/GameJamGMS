x += (xTo - x)/15;
y += (yTo - y)/15;

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(400 * aspect, 300 * aspect, -10000, 10000);


//camera_set_view_angle(camera, angle);
camera_set_proj_mat(camera, pm);
camera_set_view_mat(camera, vm);
//log(angle);
//angle++;

var _near	= layer_get_id("bNear");
var _far	= layer_get_id("bFar");
var _middle = layer_get_id("bMiddle");

layer_x(_near,		lerp(0, x, 0.85));
layer_x(_middle,	lerp(0, x, 0.9));
layer_x(_far,		lerp(0, x, 0.95));

layer_y(_near,		lerp(0, y, 0.85));
layer_y(_middle,	lerp(0, y, 0.9));
layer_y(_far,		lerp(0, y, 0.95));