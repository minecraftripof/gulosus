time++;
true_x = (bbox_left + bbox_right) / 2;
true_y  = (bbox_top + bbox_bottom) / 2;
if (game_controller.current_tasks < 3) && (irandom(1000) == 1) {
	instance_create_layer(true_x, true_y, "Instances", task);
	game_controller.current_tasks++;
}