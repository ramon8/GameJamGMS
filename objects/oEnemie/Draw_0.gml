 
draw_self();

if(global.debug){
	draw_set_color(c_gray);

	var _barSize = 10;

	var _xStart, _xEnd, _yStart, _yEnd;

	_xStart = x - _barSize / 2;
	_xEnd = _xStart + _barSize;
	_yStart = y + 10;
	_yEnd = _yStart + 1;

	draw_rectangle(_xStart, _yStart, _xEnd, _yEnd, 0);

	draw_set_color(c_lime);

	var _divisions = _barSize / maxHp;

	_xEnd = _xStart + _divisions * hp;

	draw_rectangle(_xStart, _yStart, _xEnd, _yEnd, 0);
}