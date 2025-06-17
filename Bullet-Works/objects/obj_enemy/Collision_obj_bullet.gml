// Play death sound
audio_play_sound(snd_kill, 1, false);

// Destroy the bullet
with (other) {
    instance_destroy();
}

// Destroy the enemy
instance_destroy();
