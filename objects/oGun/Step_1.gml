if(instance_exists(oPlayer)){
	x = oPlayer.x;
	y = oPlayer.y - oPlayer.sprite_height / 2;
	//direction = oPlayer.direction;
	direction = point_direction(x, y, mouse_x, mouse_y);

	if(mouse_x > x) image_yscale = 1;
	else image_yscale = -1;
}

depth = -10000;