// Horizontal movement
if (!slowmo_jump) {
    move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
    move_x *= move_speed;
}

// Ground check
var on_ground = place_meeting(x, y+1, obj_ground) || place_meeting(x, y+1, obj_elevator);

if (on_ground) {
    move_y = 0;
    
    // Start controlled slow-mo jump
    if (keyboard_check_pressed(vk_space) && !slowmo_jump) {
        slowmo_jump = true;
        slowmo_timer = 0;
        
        // Gentle upward push (reduced power)
        move_y = -slowmo_power;
        
        // Slow down horizontal movement during jump
        move_x *= 0.7;
        
        image_angle = 0;
    }
} else {
    // Apply gravity (super low during slow-mo)
    move_y += slowmo_jump ? slowmo_gravity : normal_gravity;
    move_y = min(move_y, 10);
}

// Slow-mo jump control
if (slowmo_jump) {
    slowmo_timer++;
    
    // Gradually reduce upward force as we reach apex
    if (slowmo_timer < jump_apex_time) {
        move_y = lerp(move_y, 0, 0.05);
    }
    
    // End slow-mo when duration ends or we land
    if (slowmo_timer >= slowmo_duration || place_meeting(x, y+move_y, obj_ground)) {
        slowmo_jump = false;
    }
}

// Visual handling
if (!slowmo_jump) {
    image_angle = 0;
    if (move_x != 0) {
        image_xscale = sign(move_x);
        facing_left = (move_x < 0);
    }
}

// Your original collision system remains unchanged below
move_and_collide(move_x, move_y, obj_ground);
move_and_collide(move_x, move_y, obj_elevator);

if (!place_meeting(x+move_x, y+2, obj_ground) && place_meeting(x+move_x, y+10, obj_ground)) {
    move_y = abs(move_x);
    move_x = 0;
}

if (place_meeting(x, y+2, obj_elevator)) {
    var elevator = instance_place(x, y+2, obj_elevator);
    if (elevator) move_y = elevator.vspeed;
}

move_and_collide(move_x, move_y, obj_ground, 4, 0, 0, move_speed, -1);
move_and_collide(move_x, move_y, obj_elevator, 4, 0, 0, move_speed, -1);