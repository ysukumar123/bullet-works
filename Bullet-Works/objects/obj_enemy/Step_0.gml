// Speed at which enemy moves toward player
var follow_speed = 3;

// Check player's position relative to enemy
if (obj_player.x > x) {
    x += follow_speed;  // Move right
} else if (obj_player.x < x) {
    x -= follow_speed;  // Move left
}





