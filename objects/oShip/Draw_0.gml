draw_self();

var _grav = new vector(0, 100);
var _force = new vector(_grav.x, _grav.y);

draw_line(x, y, x + _grav.x, y + _grav.y);
draw_set_color(c_red);
draw_line(x, y, x + _force.x, y + _force.y);

if(global.debug){
	draw_set_color(c_lime);
	draw_circle(x, y, collision_area, 1);
	
	draw_set_color(c_purple);
	draw_circle(x, y, focusable_area, 1);
}