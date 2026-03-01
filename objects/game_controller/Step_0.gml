if game_lost {
	room_goto(Room_gameOver);
} else if game_won {
	room_goto(Room_gameWon);
} else {
	if(tasks >= 15){
		room_goto_next();
	}
}