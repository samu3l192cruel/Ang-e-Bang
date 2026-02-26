// ==========================
// 1. OBTER INPUTS
// ==========================
var _key_left   = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_right  = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_jump   = keyboard_check_pressed(vk_space);
var _key_dash   = keyboard_check_pressed(vk_shift);
var _key_attack = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("Z"));

// ==========================
// 2. CALCULAR MOVIMENTO HORIZONTAL
// ==========================
var _move = _key_right - _key_left;

// ==========================
// 3. VERIFICAR CHÃO
// ==========================
var _on_ground = place_meeting(x, y + 1, obj_bloco)
               || place_meeting(x, y + 1, obj_ponte)
               || place_meeting(x, y + 1, obj_colisao);

if (_on_ground) {
    can_dash = true;
}

// ==========================
// 4. LÓGICA DE ESTADOS (ATAQUE, DASH OU MOVIMENTO)
// ==========================
if (is_attacking) {
    hspd = 0;
    vspd += grv;

    if (image_index >= image_number - 1) {
        is_attacking = false;
    }

} else if (is_dashing) {
    var t = instance_create_layer(x, y, layer, obj_trail);
    t.sprite_index = sprite_index;
    t.image_index = image_index;
    t.image_xscale = image_xscale;

    vspd = 0;
    dash_timer--;

    if (dash_timer <= 0) is_dashing = false;

} else {
    // Movimento normal
    hspd = _move * walk_spd;
    vspd += grv;

    // Pulo
    if (_on_ground && _key_jump) {
        vspd = jump_spd;
    }

    // Ataque
    if (_key_attack) {
        is_attacking = true;
        sprite_index = spr_ANGATK;
        image_index = 0;
    }

    // Dash
    if (_key_dash && can_dash) {
        is_dashing = true;
        dash_timer = dash_time;
        can_dash = false;
        vspd = 0;
        hspd = (_move != 0) ? _move * dash_spd : image_xscale * dash_spd;
        audio_play_sound(sn_dash, 0, false);
    }
}

// ==========================
// 5. COLISÕES UNIFICADAS
// ==========================

// Horizontal
if (place_meeting(x + hspd, y, obj_bloco) 
 || place_meeting(x + hspd, y, obj_ponte)
 || place_meeting(x + hspd, y, obj_colisao)) {
     
    while (!place_meeting(x + sign(hspd), y, obj_bloco)
        && !place_meeting(x + sign(hspd), y, obj_ponte)
        && !place_meeting(x + sign(hspd), y, obj_colisao)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// Vertical
if (place_meeting(x, y + vspd, obj_bloco)
 || place_meeting(x, y + vspd, obj_ponte)
 || place_meeting(x, y + vspd, obj_colisao)) {

    while (!place_meeting(x, y + sign(vspd), obj_bloco)
        && !place_meeting(x, y + sign(vspd), obj_ponte)
        && !place_meeting(x, y + sign(vspd), obj_colisao)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

// ==========================
// 6. ANIMAÇÕES
// ==========================
if (!is_attacking) {
    if (hspd != 0) image_xscale = sign(hspd);

    if (is_dashing) {
        // aqui você pode colocar sprite de dash
    } else if (hspd != 0) {
        sprite_index = spr_ANGWALK;
    } else {
        sprite_index = spr_ANGIDLE;
    }
}

if (!_on_ground) {
    sprite_index = spr_ANGJUMP;
}

// ==========================
// 7. TROCA DE SALA
// ==========================
if (keyboard_check_pressed(ord("E"))) {
    global.spawn_x = x;
    global.spawn_y = y;

    if (room == Room1) room_goto(Room2);
    if (room == Room4) room_goto(Room3);
    if (room == Room5) room_goto(Room8);
    if (room == Room7) room_goto(Room9);
    if (room == Room12) room_goto(Room13);
    if (room == Room14) room_goto(Room15);
    if (room == Room16) room_goto(Room17);
	 if (room == Room18) room_goto(Room19);
}

// ==========================
// 8. REINICIAR SALA
// ==========================
if (keyboard_check_pressed(ord("R"))) {
    global.spawn_x = 128;
    global.spawn_y = 224;
    room_restart();
}

if (room == Room7) {
    global.spawn_x = 128;
    global.spawn_y = 224;
}

// ==========================
// 9. COLISÃO COM INIMIGO
// ==========================
if (place_meeting(x, y, obj_inimigoseguranca)) {
    instance_destroy();
}

// ==========================
// 10. SOM DO PULO
// ==========================
if (_key_jump) {
    audio_play_sound(sn_pular, 10, false);
}