// Play death sound
audio_play_sound(snd_kill, 1, false);

// Destroy the bullet
with (other) {
    instance_destroy();
}

// Destroy the enemy
instance_destroy();
 // Increase the player's kill count
if (instance_exists(obj_player)) {
    obj_player.kill_count += 1;
}

// Destroy both bullet and enemy
with (other) instance_destroy(); // destroy bullet
instance_destroy();              // destroy self (enemy)
