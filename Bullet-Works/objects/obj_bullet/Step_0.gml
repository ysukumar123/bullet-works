life_timer -= 1;

if (life_timer <= 0) {
    instance_destroy(); // Despawn bullet after timer runs out
}
