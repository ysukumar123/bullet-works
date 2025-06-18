instance_persistent = true;

if (!variable_global_exists("global.kill_count")) {
    global.kill_count = 0;
}

kill_count = global.kill_count;
