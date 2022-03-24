
position = new vector(x, y);
velocity = new vector_zero();
steering_forces = new vector_zero();
grav = new vector_zero();

focusable_area = 500;

max_force = 1;
grav_magnitude = 0;

ship_grav_force = 0.5;

rotation_force = 2;

max_speed_sprint = 30;
max_speed_normal = 20;
max_speed = max_speed_normal;

collision_area = 10;

pSys = part_system_create();
p = part_type_create();

part_type_shape(p, pt_shape_pixel);
part_type_size(p, 2, 5, 0, 1);


function forces(){
	steering_forces.limit_magnitude(max_force);
	velocity.add(steering_forces);
	
	
	velocity.limit_magnitude(max_speed);
	grav.limit_magnitude(grav_magnitude * ship_grav_force);
	
	position.add(velocity);
	position.add(grav);

	steering_forces.set(0, 0);

	x = position.x;
	y = position.y;
	//image_angle = velocity.get_direction();
	image_angle = direction;
}

function move(){

	var _slowForce = vector_copy(velocity.get_negated());
	
	if(downKey || !upKey) steering_forces.add(_slowForce);
	
	if(keyboard_check(vk_shift) && upKey) max_speed = lerp(max_speed, max_speed_sprint, 0.01);
	else max_speed = lerp(max_speed, max_speed_normal, 0.01);

	direction += (leftKey - rightKey) * rotation_force;
	
	if(upKey){
		var _shipForce = vector_from_direction(direction, upKey);
		steering_forces.add(_shipForce);
	}
}


function free(){
	setCameraAspect(oShip, 15, 0.1);
	move();

	var _landed = place_meeting(x + velocity.x, y + velocity.y, oCameraFocusable);
	if(_landed)	{
		velocity = new vector_zero();
		state = landed;
	}
	
	forces();
}

function landed(){
	if(keyboard_check_pressed(ord("E")) && !instance_exists(oAstronaut)) instance_create_layer(x, y, "Player", oAstronaut);
	if(upKey){
		state = free;
	}
}


state = free;
