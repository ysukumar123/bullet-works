// Step Event:

// Movement X - only when not leaping
if (!slowmo_jump) {
    move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
    move_x *= move_speed;
}

// Check if standing on ground or elevator
var on_ground = place_meeting(x, y+2, obj_ground);
var on_elevator = place_meeting(x, y+2, obj_elevator);

if (on_ground || on_elevator) {
    move_y = 0;

    // Start slow-mo leap
    if (keyboard_check_pressed(vk_space) && !slowmo_jump) {
        slowmo_jump = true;
        slowmo_timer = 0;

        // Store mouse position at jump start
        leap_target_x = mouse_x;
        leap_target_y = mouse_y;

        image_angle = 0; // reset rotation
    }
} else if (move_y < 10) {
    move_y += 1;
}

// Handle slow-mo jumping
if (slowmo_jump) {
    slowmo_timer++;

    // Calculate direction toward stored leap target
    var dir = point_direction(x, y, leap_target_x, leap_target_y);
    var rad = degtorad(dir);

    // Apply jump velocity (slow and smooth)
    move_x = slowmo_power * cos(rad) * 0.5;  
    move_y = slowmo_power * sin(rad) * 0.5 * -1; 

    // Rotate player to face the direction of the mouse
    image_angle = point_direction(x, y, mouse_x, mouse_y);

    // End leap after duration
    if (slowmo_timer >= slowmo_duration) {
        slowmo_jump = false;
        image_angle = 0;
    }
} else {
    // Normal flip and rotation reset
    image_angle = 0;

    if (move_x != 0) {
        image_xscale = sign(move_x);
        facing_left = (move_x < 0);
    }
}

// Move and collide
move_and_collide(move_x, move_y, obj_ground);
move_and_collide(move_x, move_y, obj_elevator);

// Additional collision fix for ground
if (!place_meeting(x+move_x, y+2, obj_ground) && place_meeting(x+move_x, y+10, obj_ground)) {
    move_y = abs(move_x);
    move_x = 0;
}

// Ensure movement with elevator
if (on_elevator) {
    var elevator = instance_place(x, y+2, obj_elevator);
    if (elevator) move_y = elevator.vspeed;
}

// Final movement resolution
move_and_collide(move_x, move_y, obj_ground, 4, 0, 0, move_speed, -1);
move_and_collide(move_x, move_y, obj_elevator, 4, 0, 0, move_speed, -1);
