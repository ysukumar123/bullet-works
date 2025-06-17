if (instance_exists(other)) {
    instance_destroy(); // Destroy bullet
    with (other) {
        instance_destroy(); // Destroy enemy
    }
}
