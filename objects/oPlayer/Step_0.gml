left = keyboard_check(ord("A"));
down = keyboard_check(ord("S"));
up = keyboard_check(ord("W"));
right = keyboard_check(ord("D"));


action1 = keyboard_check(ord("K"));
action2 = keyboard_check(ord("L"));


inputDirection = point_direction(0, 0, right - left, down - up);
inputMagnitude = (right - left != 0) || (down - up != 0);

if(inputMagnitude != 0) direction = inputDirection;
if(right - left != 0) image_xscale = (right - left) * 2;

timeSinceLastBullet++;

state();