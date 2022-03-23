leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
rightKey = keyboard_check(ord("D"));
downKey = keyboard_check(ord("S"));

isMoving = leftKey || upKey || rightKey || downKey;

setCameraAspect(self, 1, 0.1);
var _currentPlanet = collision_circle(x, y, planetCollisionArea, oPlanet, 1, 1);

// Movement
var _horizontalDirection = rightKey - leftKey;
var _verticalDirection = downKey - upKey;

var _direction = new vector_zero();
if(_horizontalDirection == 1){
	_direction.set(grav.y, -grav.x);
}
if(_horizontalDirection == -1){
	_direction.set(-grav.y, grav.x);
}
steering_forces.add(_direction);

var _landed = place_meeting(x + velocity.x, y + velocity.y, _currentPlanet);
if(_landed)	{
	velocity = new vector_zero();
	if(upKey){
		var _invertedGrav = new vector();
		_invertedGrav.copy(grav);
		_invertedGrav.negate();
		steering_forces.add(_invertedGrav);
	}
}else{
	
	// Gravity
	var _x = lengthdir_x(200, direction);
	var _y = lengthdir_y(200, direction);

	grav.set(_x, _y);
	steering_forces.add(grav);
}

direction = point_direction(x, y, _currentPlanet.x, _currentPlanet.y);
oCamera.angle = direction;




// Forces
steering_forces.limit_magnitude(max_force);
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_forces.set(0, 0);
	

// Positioning	
x = position.x;
y = position.y;

image_angle = direction;

if(place_meeting(x, y, oShip) && keyboard_check_pressed(ord("Q"))){
	with(oShip){
		state = arrive;
	}
	instance_destroy(self);
}