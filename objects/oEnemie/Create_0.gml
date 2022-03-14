

types = [
	new Enemie("Cuca", 1, .6),
	new Enemie("Bat", 2, .7),
	new Enemie("Hand", 2, .5),
	new Enemie("Zombie", 3, .45),
	new Enemie("Dead", 4, .4),
	new Enemie("Mummy", 5, .3),
];

if(type == "Boss") enemie = new Enemie("Boss", 200, .5);
else enemie = types[irandom_range(0, array_length(types) - 1)];
sprite = enemie.sprite;
spriteHit = enemie.spriteHit;

rotationChannel = animcurve_get_channel(monsterMovementAnimation, "rotation");
curvePos = 0;
curveSpeed = 1/60;


maxHp = enemie.hp;
hp = maxHp;

max_force = 0.05;
max_speed = enemie.speed;

position = new vector(x, y);
velocity = new vector_random(3);
steering_forces = new vector_zero();


function reciveDamage(){
	if(hp - 1 <= 0){
		var _random = irandom_range(0, 100);
		if(_random == 0){
			var _powerUp = instance_create_layer(x, y, "Guns", oPowerup);
			_powerUp.type = "Shotgun";
		}
		if(_random == 1){
			var _powerUp = instance_create_layer(x, y, "Guns", oPowerup);
			_powerUp.type = "Machinegun";
		}
		if(_random > 80){
			if(irandom_range(0, 1)) {
				if(oPlayer.hp < oPlayer.maxHp) instance_create_layer(x, y, "Guns", oLive);
			}else instance_create_layer(x, y, "Guns", oMovement);
		}
		instance_destroy(self);
	}
	else{
		hp--;
		state = hit;
	}
}

function move(){
	animate(sprite);
	steering_forces.add(seek_force(oPlayer.x, oPlayer.y));
	steering_forces.add(collision_avoidance(object_index, sprite_width/2));

	steering_forces.limit_magnitude(max_force);
	velocity.add(steering_forces);
	velocity.limit_magnitude(max_speed);

	position.add(velocity);

	steering_forces.set(0, 0);
	
	if(velocity.x > .05) image_xscale = 1;
	else if(velocity.x < -.05) image_xscale = -1;

	x = position.x;
	y = position.y;
	
	rotationCurve = animcurve_channel_evaluate(rotationChannel, curvePos)
	
	image_angle = rotationCurve;
	
	
	curvePos += curveSpeed;
	if(curvePos >= 1) curvePos = 0;
}

function hit(){
	animate(spriteHit);
	
	if(animationEnd()) state = move;
}

state = move;