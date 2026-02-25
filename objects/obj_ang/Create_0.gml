// Movimento
walk_spd = 4;
jump_spd = -12;
grv = 0.6;

hspd = 0;
vspd = 0;

// Dash
dash_spd = 14;      // velocidade do dash
dash_time = 8;       // duração em frames
dash_timer = 0;
can_dash = true;
is_dashing = false;
is_attacking = false;

if (variable_global_exists("spawn_x")) {
    x = global.spawn_x;
    y = global.spawn_y;
}
