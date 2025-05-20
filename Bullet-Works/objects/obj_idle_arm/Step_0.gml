var px = obj_player.x;
var py = obj_player.y;
var flip = obj_player.facing_left;

// Set arm offset - tweak as needed
var offset_x = 8;
var offset_y = 0;

if (!flip) {
    x = px + offset_x;
    y = py + offset_y;
    image_xscale = 1;
    image_angle = 0;
} else {
    x = px - offset_x;
    y = py + offset_y;
    image_xscale = -1;
    image_angle = 0;
}
