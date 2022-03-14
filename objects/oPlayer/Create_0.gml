ms = 1;

invencibleHitTime = 50;
currentInvencibleHitTime = 0;

maxHp = 100;
hp = maxHp;

hSpeed = 0;
vSpeed = 0;

function idle(){
	currentInvencibleHitTime = 0;
	animate(sPlayerIdle);
	
	hSpeed = 0;
	vSpeed = 0;
	
	if(moving) state = run;
	
}

function run(){
	animate(sPlayerRun);
	
	move();

	if(!moving) state = idle;
}


function hit(){
	animate(sPlayerHit);
	move();
	if(currentInvencibleHitTime >= invencibleHitTime) state = idle;
}


function move(){
	
	hSpeed = lerp(hSpeed, lengthdir_x(ms, direction), 0.2) * moving;
	vSpeed = lerp(vSpeed, lengthdir_y(ms, direction), 0.2) * moving;
	
	if(place_meeting(x + hSpeed, y, oSolid)){
		var _onePixel = sign(hSpeed);
		while(!place_meeting(x + _onePixel, y, oSolid)){
			x += _onePixel;
		}
		hSpeed = 0;
	}
	x += hSpeed;
	
	
	if(place_meeting(x, y + vSpeed, oSolid)){
		var _onePixel = sign(vSpeed);
		while(!place_meeting(x, y + vSpeed, oSolid)){
			x += _onePixel;
		}
		vSpeed = 0;
	}
	y += vSpeed;
	
	if(hDir != 0) image_xscale = hDir;
}

state = idle;