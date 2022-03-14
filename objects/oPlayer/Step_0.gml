
keyUp = keyboard_check(ord("W"));
keyLeft = keyboard_check(ord("A"));
keyDown = keyboard_check(ord("S"));
keyRight = keyboard_check(ord("D"));

keyAttack = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter);
keyPick = mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_space);

hDir = keyRight - keyLeft;
vDir = keyDown - keyUp;

moving = !(vDir == 0 && hDir == 0);

if(moving) direction = point_direction(x, y, x + hDir, y + vDir);

if(place_meeting(x, y, oEnemie) && currentInvencibleHitTime == 0){
	state = hit;
	hp -= 10;
	currentInvencibleHitTime++;
}

if(hp <= 0) room_restart();

if(currentInvencibleHitTime != 0) currentInvencibleHitTime++;

state();