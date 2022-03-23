
position = new vector(x, y);
velocity = new vector_random();
steering_forces = new vector_zero();

focusable_area = 500;

max_force = 0.25;
max_speed = 10;
max_speed_sprint = 20;

collision_area = 10;

pSys = part_system_create();
p = part_type_create();

part_type_shape(p, pt_shape_pixel);
part_type_size(p, 2, 5, 0, 1);

function forces(){
	// Forces
	steering_forces.limit_magnitude(max_force);
	velocity.add(steering_forces);
	//velocity.add(_direction);
	velocity.limit_magnitude(max_speed);
	position.add(velocity);

	steering_forces.set(0, 0);
	

	// Positioning	
	x = position.x;
	y = position.y;
	image_angle = direction;
}

function move(){
	//Turbo
	if(keyboard_check(vk_shift)) max_speed = max_speed_sprint;
	else max_speed = lerp(max_speed, 5, 0.01);


	// Movement
	var _horizontalDirection = rightKey - leftKey;
	var _verticalDirection = downKey - upKey;

	var _direction = new vector(_horizontalDirection, _verticalDirection);
	steering_forces.add(_direction);
	
	direction = point_direction(0, 0, velocity.x, velocity.y);
}

function free(){
	setCameraAspect(oShip, 7, 0.1);
	move();


	// Focusable
	var _collisionFocusable = collision_circle(x, y, focusable_area, oCameraFocusable, 0, 1);

	if(_collisionFocusable) state = arrive;
	
	/*
		if(_collisionFocusable){
			steering_forces.add(arrive_force(_collisionFocusable.x, _collisionFocusable.y, 200));
			setCameraAspect(_collisionFocusable, 5, 0.05);
		}else{
			setCameraAspect(oShip, 7, 0.1);
		}
	*/
	
	forces();
}

function arrive(){
	var _collisionFocusable = collision_circle(x, y, focusable_area, oCameraFocusable, 0, 1);
	setCameraAspect(_collisionFocusable, 6, 0.05);
	
	if(!_collisionFocusable) state = free;
	else{
		var _x = _collisionFocusable.x;
		var _y = _collisionFocusable.y;
		var _landed = place_meeting(x + velocity.x, y + velocity.y, _collisionFocusable);
		if(_landed)	{
			velocity = new vector_zero();
			if(keyboard_check_pressed(ord("E"))) state = landed;
		}
		else steering_forces.add(arrive_force(_x, _y, 200));
		direction = lerp(direction, point_direction(_x, _y, x, y), 0.2);
	}
	
	if(isMoving) move();
	
	forces();
}

function landed(){
	if(!instance_exists(oAstronaut)) instance_create_layer(x, y, "Player", oAstronaut);
	//else state = arrive;
}


state = free;
