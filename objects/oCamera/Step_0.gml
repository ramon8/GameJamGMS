x += (xTo - x)/2;
y += (yTo - y)/2;

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);


if(keyboard_check_pressed(vk_space)) global.debug = !global.debug;

if(keyboard_check_pressed(ord("R"))) room_restart();