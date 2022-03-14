if(enemieSpawnRatio > enemieSpawnRatioMax){
	
	var _x = oPlayer.x;
	var _y = oPlayer.y;
	var _range = 500;
	
	var _random_position = new vector(
		_x + irandom_range(-_range, _range), 
		_y + irandom_range(-_range, _range)
	);

	while(point_in_circle(_random_position.x, _random_position.y, oPlayer.x, oPlayer.y, 300)){
		_random_position.set(
			_x + irandom_range(-_range, _range), 
			_y + irandom_range(-_range, _range)
		);
	}
	var _enemie = instance_create_layer(_random_position.x, _random_position.y, "Enemies", oEnemie);
	enemieSpawnRatio = 0;
}
enemieSpawnRatio++;
currentFrame++;