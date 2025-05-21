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
