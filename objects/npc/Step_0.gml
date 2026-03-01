
randint = irandom(move_chance);

up_free = true;
down_free = true;
left_free = true;
right_free = true;

true_x = (bbox_left + bbox_right) / 2;
true_y  = (bbox_top + bbox_bottom) / 2;

if (randint == 1) {
	switch_movement = true;
} else {
	switch_movement = false;
}

if (place_meeting(x, y-2, oCollision)) {
	up_free = false;
	if (y_speed < 0) {
		switch_movement = true;
	}
}
if (place_meeting(x, y+2, oCollision)) {
	down_free = false;
	if (y_speed > 0) {
		switch_movement = true;
	}
}
if (place_meeting(x-2, y, oCollision)) {
	left_free = false;
	if (x_speed < 0) {
		switch_movement = true;
	}
}
if (place_meeting(x+2, y, oCollision)) {
	right_free = false;
	if (x_speed > 0) {
		switch_movement = true;
	}
}

if (bbox_top-1 < 0) {
	up_free = false;
	switch_movement = true;
}
if (bbox_bottom+1 > room_height) {
	down_free = false;
	switch_movement = true;
}
if (bbox_left-1 < 0) {
	left_free = false;
	switch_movement = true;
}
if (bbox_right+1 > room_width) {
	right_free = false;
	switch_movement = true;
}

while (switch_movement){
	randint = irandom_range(1,5);
	if ((randint == 1) && up_free) {
		x_speed = 0;
		y_speed = -movement_speed;
		move_chance = 80;
		next_sprite = sSheepBackward;
		switch_movement = false;
	} else if ((randint == 2) && down_free) {
		x_speed = 0;
		y_speed = movement_speed;
		move_chance = 80;
		next_sprite = sSheepForward;
		switch_movement = false;
	} else if ((randint == 3) && left_free) {
		x_speed = -movement_speed;
		y_speed = 0;
		move_chance = 80;
		next_sprite = sSheepLeft;
		switch_movement = false;
	} else  if ((randint == 4) && right_free) {
		x_speed = movement_speed;
		y_speed = 0;
		move_chance = 120;
		next_sprite = sSheepRight;
		switch_movement = false;
	} else if (randint == 5) {
		x_speed = 0;
		y_speed = 0;
		move_chance = 120;
	}
}

if ((x_speed == 0) && (y_speed == 0)){
	sprite_index = next_sprite;
} else if (abs(x_speed) >= abs(y_speed)){
	if(x_speed > 0) {
		sprite_index = sSheepRightWalk;
	} else {
		sprite_index = sSheepLeftWalk;
	}
} else if (abs(y_speed) > abs(x_speed)){
	if(y_speed > 0) {
		sprite_index = sSheepForwardWalk;
	} else {
		sprite_index = sSheepBackwardWalk
	}
}

move_and_collide(x_speed, y_speed, oCollision);