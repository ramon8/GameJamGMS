x = oPlayer.x;
y = oPlayer.y - oPlayer.sprite_height / 2;

depth = -10000;
if (shootBullet) {
	percent += 1/10;

	if(percent > 1) percent -= 1;

	position = animcurve_channel_evaluate(curve, percent);
	if(!shootBullet) position = 0;

	if(oPlayer.image_xscale) image_angle = oPlayer.direction + position;
	else image_angle = oPlayer.direction - position;
	if(percent == 1) shootBullet = false;
	log(percent)
}else{
	image_angle = oPlayer.direction;
}

image_yscale = oPlayer.image_xscale;
