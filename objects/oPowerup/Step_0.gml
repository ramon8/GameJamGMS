animate(asset_get_index("s" + type + "Powerup"));

if(place_meeting(x, y, oPlayer)){
	instance_destroy(oGun);
	instance_destroy(self);
	var _gun = -1;
	log("new gun?");
	switch(type){
		case "Pistol": _gun = instance_create_layer(x, y, "Guns", oPistol); break;
		case "Machinegun": _gun = instance_create_layer(x, y, "Guns", oMachinegun); break;
		case "Shotgun": _gun = instance_create_layer(x, y, "Guns", oShotgun); break;
	}
	log(_gun);
	
}