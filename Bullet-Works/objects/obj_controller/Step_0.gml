// Initialize game speed if not already done
if (!variable_global_exists("game_speed")) {
    global.game_speed = 1;
}

game_set_speed(60 * global.game_speed, gamespeed_fps);










