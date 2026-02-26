// Movimento
walk_spd = 3.2;
jump_spd = -10;
grv = 0.5;

hspd = 0;
vspd = 0;

// Dash
dash_spd = 12;
dash_time = 10;
dash_timer = 0;
can_dash = true;
is_dashing = false;
is_attacking = false;
if (variable_global_exists("spawn_x")) {
    x = global.spawn_x;
    y = global.spawn_y;
}
