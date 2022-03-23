// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setCameraAspect(_follow, _aspect, _amount){
	with(oCamera){
		aspect = lerp(aspect, _aspect, _amount);
		follow = _follow;
	}
}