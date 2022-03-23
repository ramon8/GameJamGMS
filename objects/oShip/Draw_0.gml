draw_self();

if(global.debug){
	draw_set_color(c_lime);
	draw_circle(x, y, collision_area, 1);
	
	draw_set_color(c_purple);
	draw_circle(x, y, focusable_area, 1);
}