// 1. Obter Inputs
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_jump  = keyboard_check_pressed(vk_space);
var _key_dash  = keyboard_check_pressed(vk_shift);
var _key_attack = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("Z")); // Input de ataque

// 2. Calcular Movimento Horizontal
var _move = _key_right - _key_left;

// 3. Verifica chão
var _on_ground = place_meeting(x, y + 1, obj_bloco) || place_meeting(x, y + 1, obj_ponte);

if (_on_ground) {
    can_dash = true;
}

// ==========================
// LÓGICA DE ESTADOS (ATAQUE, DASH OU MOVIMENTO)
// ==========================

if (is_attacking) {
    hspd = 0; // Para o personagem ao atacar (opcional)
    vspd += grv; // Mantém a gravidade
    
    // Quando a animação de ataque chegar ao fim, volta ao normal
    if (image_index >= image_number - 1) {
        is_attacking = false;
    }
} 
else if (is_dashing) {
    var t = instance_create_layer(x, y, layer, obj_trail);
    t.sprite_index = sprite_index;
    t.image_index = image_index;
    t.image_xscale = image_xscale;
    
    vspd = 0;
    dash_timer--;
    
    if (dash_timer <= 0) is_dashing = false;
} 
else {
    // Movimento Normal
    hspd = _move * walk_spd;
    vspd += grv;

    // Pulo
    if (_on_ground && _key_jump) {
        vspd = jump_spd;
    }

    // Ativar Ataque
    if (_key_attack) {
        is_attacking = true;
        sprite_index = spr_ANGATK; // Certifique-se de ter essa sprite
        image_index = 0;
      
    }

    // Ativar Dash
    if (_key_dash && can_dash) {
        is_dashing = true;
        dash_timer = dash_time;
        can_dash = false;
        vspd = 0;
        if (_move != 0) hspd = _move * dash_spd;
        else hspd = image_xscale * dash_spd;
        audio_play_sound(sn_dash, 0, false);
    }
}

// ==========================
// COLISÕES (UNIFICADAS)
// ==========================
if (place_meeting(x + hspd, y, obj_bloco) || place_meeting(x + hspd, y, obj_ponte)) {
    while (!(place_meeting(x + sign(hspd), y, obj_bloco) || place_meeting(x + sign(hspd), y, obj_ponte))) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

if (place_meeting(x, y + vspd, obj_bloco) || place_meeting(x, y + vspd, obj_ponte)) {
    while (!(place_meeting(x, y + sign(vspd), obj_bloco) || place_meeting(x, y + sign(vspd), obj_ponte))) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

// ==========================
// ANIMAÇÕES
// ==========================
if (!is_attacking) { // Só muda animação de andar/idle se não estiver atacando
    if (hspd != 0) image_xscale = sign(hspd);

    if (is_dashing) {
        // Sprite de dash
    } else if (hspd != 0) {
        sprite_index = spr_ANGWALK;
    } else {
        sprite_index = spr_ANGIDLE;
    }
}

// ==========================
// TROCA DE SALA
// ==========================
var _change_room = keyboard_check_pressed(ord("E"));

if (_change_room) {

    // Salva posição atual
    global.spawn_x = x;
    global.spawn_y = y;

    if (room == Room1) room_goto(Room2);
    if (room == Room4) room_goto(Room3);
	if (room ==Room5) room_goto(Room8);
    if (room == Room7) room_goto(Room9) ;
    if (room = Room12) room_goto(Room13)
	if (room = Room14) room_goto(Room15)
}


// ==========================
// REINICIAR SALA
// ==========================
if (keyboard_check_pressed(ord("R"))) {

    global.spawn_x = 128;
    global.spawn_y = 224;

    room_restart();
}
if room = Room7 {

    global.spawn_x = 128;
    global.spawn_y = 224;

 
}
if (!_on_ground) {
    sprite_index = spr_ANGJUMP;
}

// COLISÃO COM INIMIGO
if (place_meeting(x, y, obj_inimigoseguranca))
{
   instance_destroy()
}
if _key_jump {
  audio_play_sound(sn_pular,10,false)	
}
