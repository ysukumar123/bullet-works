if (!invincible) {
    lives -= 1;

    // Move player to starting position
    x = start_x;
    y = start_y;

    invincible = true;
    invincibility_timer = invincibility_duration;
}


audio_play_sound(snd_kill, 1, false);


