// Horizontal input (locked during slow-mo jump)
if (!slowmo_jump) {
    move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
    move_x *= move_speed;
}

// Ground check
var on_ground = place_meeting(x, y + 1, obj_ground) || place_meeting(x, y + 1, obj_elevator);

if (on_ground) {
    move_y = 0;

    // Start slow-mo jump toward cursor
    if (keyboard_check_pressed(vk_space)) {
        slowmo_jump = true;
        slowmo_timer = 0;

        // Direction to cursor
        var dx = mouse_x - x;
        var dy = mouse_y - y;
        var dist = point_distance(x, y, mouse_x, mouse_y);

        var dir_x = dx / dist;
        var dir_y = dy / dist;

        // Clamp to ensure upward jump
        dir_y = clamp(dir_y, -1, -0.25);

        // Re-normalize the direction
        var len = sqrt(dir_x * dir_x + dir_y * dir_y);
        dir_x /= len;
        dir_y /= len;

        // Apply directional velocity
        move_x = dir_x * move_speed * 1.5;
        move_y = dir_y * jump_speed;

        image_angle = 0;
    }
} else {
    // Gravity
    move_y += slowmo_jump ? slowmo_gravity : normal_gravity;
    move_y = min(move_y, 10);
}

// Slow-mo jump handling
if (slowmo_jump) {
    slowmo_timer++;

    // Smooth vertical arc near apex
    if (slowmo_timer < jump_apex_time) {
        move_y = lerp(move_y, 0, 0.05);
    }

    // End slow-mo on timeout or landing
    if (slowmo_timer >= slowmo_duration || place_meeting(x, y + move_y, obj_ground)) {
        slowmo_jump = false;
    }
}

// Visuals
if (!slowmo_jump) {
    image_angle = 0;
    if (move_x != 0) {
        image_xscale = sign(move_x);
        facing_left = (move_x < 0);
    }
}

// === SOLID COLLISION ===

// Horizontal movement + collision
if (move_x != 0) {
    var sign_x = sign(move_x);
    for (var i = 0; i < abs(move_x); i++) {
        if (!place_meeting(x + sign_x, y, obj_ground) && !place_meeting(x + sign_x, y, obj_elevator)) {
            x += sign_x;
        } else {
            move_x = 0;
            break;
        }
    }
}

// Vertical movement + collision
if (move_y != 0) {
    var sign_y = sign(move_y);
    for (var i = 0; i < abs(move_y); i++) {
        if (!place_meeting(x, y + sign_y, obj_ground) && !place_meeting(x, y + sign_y, obj_elevator)) {
            y += sign_y;
        } else {
            move_y = 0;
            break;
        }
    }
}

// Elevator riding support
if (place_meeting(x, y + 1, obj_elevator)) {
    var elevator = instance_place(x, y + 1, obj_elevator);
    if (elevator) {
        y += elevator.vspeed; // match elevator speed
    }
}
