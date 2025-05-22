var px = obj_player.x;
var py = obj_player.y;
var flip = obj_player.facing_left;

// Set arm offset (move it further back by adjusting offset_x)
var offset_x = 20;  // Move further back (negative when facing right)
var offset_y = 0;   // Vertical adjustment (if necessary)

if (!flip) {
    // If facing right, move the arm further back (decrease x position)
    x = px - offset_x;  // Decrease to move backward
    y = py + offset_y;
    image_xscale = 1;    // Normal scale (facing right)
    image_angle = point_direction(x, y, mouse_x, mouse_y);
} else {
    // If facing left, move the arm further back (increase x position)
    x = px + offset_x;  // Increase to move backward
    y = py + offset_y;
    image_xscale = -1;   // Flip scale (facing left)
    image_angle = point_direction(x, y, mouse_x, mouse_y);
}

if (keyboard_check_pressed(ord("X"))) {
    // Create new shooting arm at the same position and layer
    var new_arm = instance_create_layer(x, y, layer, obj_shooting_arm);
    
    // Optional: pass facing direction if needed
    if (object_exists(obj_player)) {
        new_arm.facing_left = obj_player.facing_left;
    }

    // Destroy current (idle) arm
    instance_destroy();
}

if (keyboard_check_pressed(ord("X"))) {
    var new_arm = instance_create_layer(x, y, layer, obj_shooting_arm);
    if (object_exists(obj_player)) {
        new_arm.facing_left = obj_player.facing_left;
    }
    instance_destroy();
}

var px = obj_player.x;
var py = obj_player.y;
var flip = obj_player.facing_left;

var offset_x = 20;
var offset_y = 0;

if (!flip) {
    // Facing right
    x = px + offset_x;
    y = py + offset_y;
    image_xscale = 1;

    var angle = point_direction(x, y, mouse_x, mouse_y);

    // Clamp angle so it stays between -90 and 90 degrees (which is 270° to 90° in 0-360 range)
    if (angle > 90 && angle < 180) angle = 90;
    else if (angle >= 180 && angle < 270) angle = 270;

    image_angle = angle;

} else {
    // Facing left
    x = px - offset_x;
    y = py + offset_y;
    image_xscale = -1;

    var angle = point_direction(x, y, mouse_x, mouse_y);
    if (angle < 0) angle += 360;

    // Clamp angle so it stays between 90 and 270 degrees
    if (angle < 90) angle = 90;
    else if (angle > 270) angle = 270;

    image_angle = angle;
}
