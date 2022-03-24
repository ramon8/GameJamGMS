draw_self();

if(global.debug){
	draw_set_color(c_white);
	var _x = x + lengthdir_x(100, direction);
	var _y = y + lengthdir_y(100, direction);
	draw_line(x, y, _x, _y);
	
	draw_set_color(c_lime);
	_x = x + lengthdir_x(100, grav.get_direction());
	_y = y + lengthdir_y(100, grav.get_direction());
	draw_line(x, y, _x, _y);
	
	draw_set_color(c_yellow);
	_x = x + lengthdir_x(100, velocity.get_direction());
	_y = y + lengthdir_y(100, velocity.get_direction());
	draw_line(x, y, _x, _y);
	
	//draw_set_color(c_lime);
	//_x = x + lengthdir_x(100, position.get_direction());
	//_y = y + lengthdir_y(100, position.get_direction());
	//draw_line(x, y, _x, _y);
	
	draw_set_color(c_purple);
	draw_circle(x, y, focusable_area, 1);
}