// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animate(_animation){
	if(_animation != sprite_index){
		image_index = 0;
		sprite_index = _animation;
	}
}