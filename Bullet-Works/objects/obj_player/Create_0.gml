move_speed = 4;
jump_speed = 20; // Increased from 12 → higher jump

move_x = 0;
move_y = 0;
facing_left = false;

// Slow-mo jump variables
slowmo_jump = false;
slowmo_timer = 0;
slowmo_duration = 90; // Increased duration for more slow-mo
slowmo_power = 12;    // Reduced from 20 for lower jump
slowmo_gravity = 0.2; // Very low gravity during jump
normal_gravity = 0.6; // Regular gravity
jump_apex_time = 30;  // Time to reach jump peak
