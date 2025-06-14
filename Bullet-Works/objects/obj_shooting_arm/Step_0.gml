// Arm Positioning Based on Player
var px = obj_player.x;
var py = obj_player.y;
var flip = obj_player.facing_left;

var offset_x = 20;
var offset_y = 40;

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

// Switching Arms When Pressing X
if (keyboard_check_pressed(ord("X"))) {
    var new_arm = instance_create_layer(x, y, layer, obj_idle_arm);
    if (object_exists(obj_player)) {
        new_arm.facing_left = obj_player.facing_left;
    }
    instance_destroy();
}

// Shooting Bullets Toward the Cursor
if (mouse_check_button_pressed(mb_left)) {
    var bullet_offset = 16;
    var spawn_x = x + lengthdir_x(bullet_offset, image_angle);
    var spawn_y = y + lengthdir_y(bullet_offset, image_angle);

    var bullet = instance_create_layer(spawn_x, spawn_y, layer, obj_bullet);
    bullet.direction = point_direction(spawn_x, spawn_y, mouse_x, mouse_y);
    bullet.speed = 10;
}

// Ensure Bullet Movement is in obj_bullet's Step Event
if (object_index == obj_bullet) {
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
}
