image_speed = 0;

ms = 1;

hDirection = -1;

rotationChannel = animcurve_get_channel(animShotgunRotation, "angle");
distanceChannel = animcurve_get_channel(animShotgunDistance, "distance");
indexChannel = animcurve_get_channel(animShotgunIndex, "index");

percent = 0;
percentInc = 1/60;

// Shell
partSystem = part_system_create_layer("Particles", 1);
shellParticleType = part_type_create();
part_type_sprite(shellParticleType, sShotgunShell, 1, 0, 0);
part_type_scale(shellParticleType, .5, .5);
part_type_gravity(shellParticleType, .075, 270);
part_type_orientation(shellParticleType, 0, 360, 10, 0, 0);
part_type_direction(shellParticleType, 45, 135, 0, 0);
part_type_speed(shellParticleType, 1.5, 1.5, 0, 0);

// Smoke
smokeParticleType = part_type_create();
part_type_sprite(smokeParticleType, sShotgunSmoke, 1, 0, 0);
part_type_shape(smokeParticleType, pt_shape_cloud);
part_type_size(smokeParticleType, .05, .1, 0, .001);
part_type_alpha3(smokeParticleType, .5, .25, 0);
part_type_gravity(smokeParticleType, .01, 90);
part_type_orientation(smokeParticleType, 0, 360, 0.1, 0, 0);
part_type_speed(smokeParticleType, .05, .1, 0, 0);
part_type_life(smokeParticleType, 25, 50);

// Smoke
lightParticle = part_type_create();
part_type_sprite(lightParticle, sShotgunSmoke, 1, 0, 0);
part_type_shape(lightParticle, pt_shape_square);
part_type_size(lightParticle, .05, .05, 0, .001);
part_type_alpha2(lightParticle, 1, 0);
//part_type_gravity(lightParticle, .01, 90);
//part_type_orientation(lightParticle, 0, 360, 0.1, 0, 0);
//part_type_speed(lightParticle, .05, .1, 0, 0);
part_type_life(lightParticle, 3, 3);


function aim(){
	move();
}

function shoot(){
	if(percent = 0) {		
		var _pDistance = 12;
		var _pX = x + lengthdir_x(_pDistance, image_angle);
		var _pY = y + lengthdir_y(_pDistance, image_angle);
		part_type_direction(smokeParticleType, image_angle, image_angle, 0, 0);
		part_particles_create(partSystem, _pX, _pY, smokeParticleType, 5);
		
		part_particles_create(partSystem, _pX, _pY, lightParticle, 1);
		
		for(var i = 0; i < 5; i++){
			var _bullet = instance_create_layer(_pX, _pY, "Bullets", oShotgunBullet);
			with(_bullet){
				var _range = 5 * i;
				direction = other.image_angle + irandom_range(-_range, _range);
			}
		}
	}
	
	percent += percentInc;
	var _rotation = animcurve_channel_evaluate(rotationChannel, percent);
	
	var _distance = animcurve_channel_evaluate(distanceChannel, percent) - animcurve_channel_evaluate(distanceChannel, percent - percentInc);
	var _x = lengthdir_x(_distance, image_angle);
	var _y = lengthdir_y(_distance, image_angle);
	
	var _index = animcurve_channel_evaluate(indexChannel, percent);
	
	if(percent = .6) part_particles_create(partSystem, x, y, shellParticleType, 1);
	
	image_index = _index;
	
	direction += _rotation * image_yscale;
	
	if(percent > .7){
		percent = 0;
		state = aim;
	}
	
	move(_x, _y);
}

function move(_x = 0, _y = 0){
	x += ms * hDir + _x;
	y += _y;
};

state = aim;