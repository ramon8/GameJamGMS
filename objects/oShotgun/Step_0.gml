mouseDown = mouse_check_button_pressed(mb_left);
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

hDir = right - left;

if(mouseDown) state = shoot;

if(!instance_exists(oPlayer)){
	direction = point_direction(x, y, mouse_x, mouse_y);
	if(mouse_x > x) image_yscale = 1;
	else image_yscale = -1;
} 

state();

image_angle = direction;