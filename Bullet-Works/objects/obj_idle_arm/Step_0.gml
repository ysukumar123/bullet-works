// === FOLLOW PLAYER ===
var px = obj_player.x;
var py = obj_player.y;
var flip = obj_player.facing_left;

var offset_x = 20;
var offset_y = 2;

if (!flip) {
    x = px - offset_x;
    y = py + offset_y;
    image_xscale = 1;
    image_angle = point_direction(x, y, mouse_x, mouse_y);
} else {
    x = px + offset_x;
    y = py + offset_y;
    image_xscale = -1;
    image_angle = point_direction(x, y, mouse_x, mouse_y);
}

// === SWITCH TO SHOOTING ARM ===
if (keyboard_check_pressed(ord("X"))) {
    var new_arm = instance_create_layer(x, y, layer, obj_shooting_arm);
    if (object_exists(obj_player)) {
        new_arm.facing_left = obj_player.facing_left;
    }
    instance_destroy();
}
