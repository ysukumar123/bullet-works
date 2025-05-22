// Declare these variables in the Create event of obj_player:
/// slowmo_jump = false;
/// slowmo_timer = 0;
/// slowmo_duration = 60; // frames duration of leap
/// slowmo_power = 20;    // jump strength
/// leap_target_x = 0;
/// leap_target_y = 0;

// Step Event:

// Movement X - only when not leaping
if (!slowmo_jump) {
    move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
    move_x *= move_speed;
}

if (place_meeting(x, y+2, obj_ground)) {
    move_y = 0;

    if (keyboard_check_pressed(vk_space) && !slowmo_jump) {
        // Start slow-mo leap
        slowmo_jump = true;
        slowmo_timer = 0;

        // Store mouse position at jump start
        leap_target_x = mouse_x;
        leap_target_y = mouse_y;

        image_angle = 0; // reset rotation
    }
} else if (move_y < 10) move_y += 1;

if (slowmo_jump) {
    slowmo_timer++;

    // Calculate direction toward stored leap target
    var dir = point_direction(x, y, leap_target_x, leap_target_y);
    var rad = degtorad(dir);

    // Apply jump velocity (slow and smooth)
    move_x = slowmo_power * cos(rad) * 0.5;  // Adjust 0.5 for horizontal speed scale
    move_y = slowmo_power * sin(rad) * 0.5 * -1; // Negative for upward

    // Rotate player smoothly during leap
    var rotation_speed = 360 / slowmo_duration;
    image_angle += rotation_speed;
    if (image_angle >= 360) image_angle -= 360;

    // End leap after duration
    if (slowmo_timer >= slowmo_duration) {
        slowmo_jump = false;
        image_angle = 0; // Reset rotation
    }
} else {
    // Normal flip and rotation reset
    image_angle = 0;

    if (move_x != 0) {
        image_xscale = sign(move_x);
        facing_left = (move_x < 0);
    }
}

// Move and collide (keep your collision logic intact)
move_and_collide(move_x, move_y, obj_ground);

// Your existing extra collision fix
if (!place_meeting(x+move_x, y+2, obj_ground) && place_meeting(x+move_x, y+10, obj_ground)) {
    move_y = abs(move_x);
    move_x = 0;
}

move_and_collide(move_x, move_y, obj_ground, 4, 0, 0, move_speed, -1);
