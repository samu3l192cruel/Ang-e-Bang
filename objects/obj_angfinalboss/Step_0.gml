// ==========================
// 1. OBTER INPUTS
// ==========================
var _key_left   = keyboard_check(ord("A"));
var _key_right  = keyboard_check(ord("D"));
var _key_jump   = keyboard_check_pressed(vk_space);
var _key_dash   = keyboard_check_pressed(vk_shift);


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
if (place_meeting(x + hspd, y, obj_bloco)) {
    while (!place_meeting(x + sign(hspd), y, obj_bloco)) x += sign(hspd);
    hspd = 0;
}
x += hspd;

// Vertical
if (place_meeting(x, y + vspd, obj_bloco)) {
    while (!place_meeting(x, y + sign(vspd), obj_bloco)) y += sign(vspd);
    vspd = 0;
}
y += vspd;
// ==========================
// 6. ANIMAÇÕES E PARTÍCULAS
// ==========================
if (!is_attacking) {
    if (hspd != 0) image_xscale = sign(hspd);

    if (is_dashing) {
        // aqui você pode colocar sprite de dash
    } else if (hspd != 0) {
        sprite_index = spr_ANGWALK;
        
        // --- ADIÇÃO: SISTEMA DE POEIRA ---
        // Cria poeira se estiver no chão e no frame 0 ou 4 da animação de andar
        if (_on_ground && (floor(image_index) == 0 || floor(image_index) == 4)) {
            // Garante que cria apenas uma vez por frame de animação
            if (!variable_instance_exists(id, "dust_spawned") || dust_spawned != floor(image_index)) {
               var _p = instance_create_layer(x, bbox_bottom, "Instances", Object28);

                _p.hspeed = -hspd * 0.1; // Poeira vai levemente para trás
                dust_spawned = floor(image_index);
            }
        }
    } else {
        sprite_index = spr_ANGIDLE;
        dust_spawned = -1; // Reseta ao parar
    }
} else {
    dust_spawned = -1;
}

if (!_on_ground) {
    sprite_index = spr_ANGJUMP;
    dust_spawned = -1;
}




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