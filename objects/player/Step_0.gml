
x_speed = 0;
y_speed = 0;

true_x = (bbox_left + bbox_right) / 2;
true_y  = (bbox_top + bbox_bottom) / 2;

if keyboard_check(vk_left) or keyboard_check(ord("A")) {
    x_speed = -movement_speed;
	sprite_index = sPlayerLeftWalk;
	next_sprite = sPlayerLeft;
}
if keyboard_check(vk_right) or keyboard_check(ord("D")) {
    x_speed = movement_speed;
	sprite_index = sPlayerRightWalk;
	next_sprite = sPlayerRight;
}
if keyboard_check(vk_up) or keyboard_check(ord("W")) {
    y_speed = -movement_speed;
	sprite_index = sPlayerBackwardWalk;
	next_sprite = sPlayerBackward;
}
if keyboard_check(vk_down) or keyboard_check(ord("S")) {
    y_speed = movement_speed;
	sprite_index = sPlayerForwardWalk;
	next_sprite = sPlayerForward;
}

if ((x_speed == 0) && (y_speed == 0) && (next_sprite != noone)) {
	sprite_index = next_sprite;
}

//show_debug_message(place_meeting(x, y-16, oCubicle_left_desk));
//show_debug_message(place_meeting(x, y+16, oCubicle_left_desk));
//show_debug_message(place_meeting(x-16, y, oCubicle_left_desk));
//show_debug_message(place_meeting(x+16, y, oCubicle_left_desk));

if (slowed_duration > 0) {
	x_speed *= slowed_amount;
	y_speed *= slowed_amount;
	slowed_duration -= 1;
}

if (weird_movement_duration > 0) {
	x_speed += random_range(-weird_movement_amount/2, weird_movement_amount/2);
	y_speed += random_range(-weird_movement_amount/2, weird_movement_amount/2);
	weird_movement_duration -= 1;
}

if (blinded_duration > 0) {
	blinded = true;
	blinded_duration-= 1;
} else {
	blinded = false;
}

if (stopped_duration > 0) {
	x_speed = 0;
	y_speed = 0;
	stopped_duration -=1;
}

move_and_collide(x_speed, y_speed, oCollision);

