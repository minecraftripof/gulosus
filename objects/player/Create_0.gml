game_set_speed(30,gamespeed_fps);

x_speed = 0; 

y_speed = 0; 

movement_speed = 1.5; 

true_x = (bbox_left + bbox_right) / 2;
true_y  = (bbox_top + bbox_bottom) / 2;

next_sprite = noone;

weird_movement_amount = 4;

weird_movement_duration = 0;

slowed_amount = 0.5;

slowed_duration = 0;

blinded_duration = 0;

blinded = false;

stopped_duration = 0;