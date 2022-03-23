randomize();
// Press space to enable debug
if(keyboard_check_pressed(vk_space)) global.debug = !global.debug;

if(keyboard_check_pressed(ord("R"))) room_restart();


if(global.debug){
	// Click to create more ships
	if(mouse_check_button(mb_left)) instance_create_layer(mouse_x, mouse_y, "Ships", oShipEnemie);
}