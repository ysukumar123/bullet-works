move_speed = 4;
jump_speed = 20;

move_x = 0;
move_y = 0;
facing_left = false;

// Slow-mo jump variables
slowmo_jump = false;
slowmo_timer = 0;
slowmo_duration = 90;
slowmo_power = 12;
slowmo_gravity = 0.2;
normal_gravity = 0.6;
jump_apex_time = 30;

invincible = false;
invincibility_duration = 60;
invincibility_timer = 0;

// Save starting position
start_x = x;
start_y = y;
// Boost variables
boost_active = false;
boost_timer = 0;
boost_duration = 10 * room_speed; // 10 seconds
original_move_speed = move_speed;
original_jump_speed = jump_speed;
kill_count = 0;
