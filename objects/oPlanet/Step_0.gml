
if(collision_circle(x, y, gravArea, oShip, 1, 1)){
	var _direction = point_direction(oShip.x, oShip.y, x, y);
	var _gravVec = vector_from_direction(_direction);
	var _gravMagnitude = gravMagnitude;
	with(oShip){
		grav.add(_gravVec);
		grav_magnitude = _gravMagnitude;
		
		_direction = point_direction(other.x, other.y, oShip.x, oShip.y);
		if(!isMoving) direction = lerp(direction, _direction, 0.1);
	}
}