// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enemie(_name, _hp, _speed) constructor{
	sprite = asset_get_index("s" + _name);
	spriteHit = asset_get_index("s" + _name + "Hit");
	hp = _hp;
	speed = _speed;
}