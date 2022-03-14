

var _x = lengthdir_x(speed, direction);
var _y = lengthdir_y(speed, direction);

var _enemie = collision_circle(x + _x, y + _y, 1, oEnemie, 1, 1);
if(instance_exists(_enemie)){
	if(place_meeting(x + _x, y + _y, _enemie)){
		while(!place_meeting(x + _x, y + _y, _enemie)){
			x += sign(_x);
			y += sign(_y);
		}
		instance_destroy(self);
		_enemie.reciveDamage();
	}
}