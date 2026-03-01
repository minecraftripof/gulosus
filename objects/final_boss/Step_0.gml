
randint = irandom(move_chance);

up_free = true;
down_free = true;
left_free = true;
right_free = true;

true_x = (bbox_left + bbox_right) / 2;
true_y  = (bbox_top + bbox_bottom) / 2;

p_dist_x = true_x - player.true_x;
p_dist_y = true_y - player.true_y;

p_dir_x = p_dist_x / abs(p_dist_x);
p_dir_y = p_dist_y / abs(p_dist_y);

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


if (
(point_distance(true_x, true_y, player.true_x, player.true_y) < sight_range) && 
(point_distance(true_x, true_y, player.true_x, player.true_y) > 5) &&
(collision_line(bbox_right, bbox_top, player.bbox_right, player.bbox_top, oCollision, false, true) == noone) &&
(collision_line(bbox_left, bbox_top, player.bbox_left, player.bbox_top, oCollision, false, true) == noone) &&
(collision_line(bbox_right, bbox_bottom, player.bbox_right, player.bbox_bottom, oCollision, false, true) == noone) &&
(collision_line(bbox_left, bbox_bottom, player.bbox_left, player.bbox_bottom, oCollision, false, true) == noone)
) {
	x_speed = -p_dir_x * movement_speed * (sqrt((p_dist_x * p_dist_x) / ((p_dist_x * p_dist_x) + (p_dist_y * p_dist_y))));
	y_speed = -p_dir_y * movement_speed * (sqrt((p_dist_y * p_dist_y) / ((p_dist_x * p_dist_x) + (p_dist_y * p_dist_y))));
	switch_movement = false;
	has_los = true;
} else if (has_los) {
	switch_movement = true;
	has_los = false;
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
		move_chance = 120;
		next_sprite = sFinalBossBackward;
		switch_movement = false;
	} else if ((randint == 2) && down_free) {
		x_speed = 0;
		y_speed = movement_speed;
		move_chance = 120;
		next_sprite = sFinalBossForward;
		switch_movement = false;
	} else if ((randint == 3) && left_free) {
		x_speed = -movement_speed;
		y_speed = 0;
		move_chance = 120;
		next_sprite = sFinalBossLeft;
		switch_movement = false;
	} else  if ((randint == 4) && right_free) {
		x_speed = movement_speed;
		y_speed = 0;
		move_chance = 120;
		next_sprite = sFinalBossRight;
		switch_movement = false;
	} else if (randint == 5) {
		x_speed = 0;
		y_speed = 0;
		move_chance = 60;
	}
}

if ((x_speed == 0) && (y_speed == 0)){
	sprite_index = next_sprite;
} else if (abs(x_speed) >= abs(y_speed)){
	if(x_speed > 0) {
		sprite_index = sFinalBossRightWalk;
	} else {
		sprite_index = sFinalBossLeftWalk;
	}
} else if (abs(y_speed) > abs(x_speed)){
	if(y_speed > 0) {
		sprite_index = sFinalBossForwardWalk;
	} else {
		sprite_index = sFinalBossBackwardWalk;
	}
}

move_and_collide(x_speed, y_speed, oCollision);