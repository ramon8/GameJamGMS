draw_self();

var _barSize = 40;

if(global.debug){

	draw_set_color(c_white);
	var _x = lengthdir_x(10, direction) + x;
	var _y = lengthdir_y(10, direction) + y;
	draw_line(x, y, _x, _y);

	draw_circle(x, y, 300, 1);

}
draw_set_color(c_gray);

var _xStart, _xEnd, _yStart, _yEnd;

_xStart = x - _barSize/2;
_xEnd = _xStart + _barSize;
_yStart = y + 3;
_yEnd = _yStart + 2;

draw_rectangle(_xStart, _yStart, _xEnd, _yEnd, 0);

draw_set_color(c_red);

var _divisions = _barSize / maxHp;

_xEnd = _xStart + _divisions * hp;

draw_rectangle(_xStart, _yStart, _xEnd, _yEnd, 0);
