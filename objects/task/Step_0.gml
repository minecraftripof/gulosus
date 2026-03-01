if ((abs(player.x - x) + abs(player.y - y)) < 20) {
	game_controller.tasks++;
	game_controller.current_tasks--;
	instance_destroy(self);
}