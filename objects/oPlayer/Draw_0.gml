draw_self();

//draw_sprite_ext(sGun, 0, x, y - sprite_height / 2, 2, image_xscale, direction, c_white, 1);


if(debug_mode){

	var _lineX = lengthdir_x(10, direction);
	var _lineY = lengthdir_y(10, direction);
	
	draw_circle(x, y - sprite_height / 2, 10, 1);

	draw_line(x, y, x + _lineX, y + _lineY);
}
