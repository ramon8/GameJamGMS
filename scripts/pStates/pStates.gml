function walk(){
	if(!inputMagnitude) state = idle;
	if(action1 && timeSinceLastBullet > fireRate) state = shoot;
	if(action2) state = atack;
	
	movement();
		
	animate(sPlayerRun);
}



function idle(){
	if(inputMagnitude) state = walk;
	if(action1 && timeSinceLastBullet > fireRate) state = shoot;
	if(action2) state = atack;
		
	animate(sPlayerIdle);
}


function shoot(){
	if(timeSinceLastBullet > fireRate){
		//animate(sPlayerShoot);
		
		timeSinceLastBullet = 0;
	
		var _dirX = x + lengthdir_x(20, direction);
		var _dirY = (y - (sprite_height / 2)) + lengthdir_y(20, direction);
		var _bullet = instance_create_layer(_dirX, _dirY, "Bullets", oBullet);
		_bullet.direction = direction;
		oGun.shootBullet = true;
	
		movement();
	
		if(animationEnd()) state = walk;
	}else state = idle;
}


function atack(){
		if(down) animate(sPlayerAtackDown);
		else if(up) animate(sPlayerAtackUp);
		else animate(sPlayerAtackHorizontal)
		
		movement();
	
		if(action2 && image_index > 3) state = atack2;
		if(animationEnd()) state = idle;
}

function atack2(){
		if(down) animate(sPlayerAtackDown);
		else if(up) animate(sPlayerAtackUp);
		else animate(sPlayerAtackHorizontal)
		
		movement();
	
		if(action2 && image_index > 3) state = atack;
		if(animationEnd()) state = idle;
}

function movement(){
	hSpeed = lengthdir_x(inputMagnitude * ms, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * ms, inputDirection);
	
	
	if(place_meeting(x + hSpeed, y, oSolid)){
		while(!place_meeting(x + sign(hSpeed), y, oSolid)){
			x += sign(hSpeed);
		}
		hSpeed = 0;
	}
	x += hSpeed;
	
	if(place_meeting(x, y + vSpeed, oSolid)){
		while(!place_meeting(x, y + sign(vSpeed), oSolid)){
			y +=  + sign(vSpeed);
		}
		vSpeed = 0;
	}
	y += vSpeed;
}