if(place_meeting(x, y, oPlayer)){
	oPlayer.ms += .1;
	instance_destroy(self);
}

xPos = animcurve_channel_evaluate(curve, curvePos) - animcurve_channel_evaluate(curve, curvePos - curveSpeed);

log(xPos);

y += xPos;

curvePos += curveSpeed;
if(curvePos >= 1) curvePos = 0;