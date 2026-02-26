// 1. Obter Inputs
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_jump  = keyboard_check_pressed(vk_space);
var _key_dash  = keyboard_check_pressed(vk_shift);
var _mouse_atk = mouse_check_button_pressed(mb_left);

var _move = _key_right - _key_left;
var _on_ground = place_meeting(x, y + 1, obj_bloco);

// Reset do Dash ao tocar no chão
if (_on_ground) can_dash = true;

// ==========================
// LÓGICA DE ATAQUE
// ==========================
if (_mouse_atk && !is_dashing && !is_attacking) {
    is_attacking = true;
    sprite_index = spr_BANGATK;
    image_index = 0; 
}

// ==========================
// ESTADOS PRINCIPAIS (DASH vs ATAQUE vs MOVIMENTO)
// ==========================

if (is_attacking) {
    // ESTADO DE ATAQUE
    hspd = 0; 
    vspd += grv; // Mantém gravidade se quiseres cair enquanto ataca
    
    // Termina o ataque quando a animação chega ao fim
    if (image_index >= image_number - 1) {
        is_attacking = false;
    }
} 
else if (is_dashing) {
    // ESTADO DE DASH
    dash_timer--;
    vspd = 0; 

    // Rastro
    var t = instance_create_layer(x, y, layer, obj_trail);
    t.sprite_index = sprite_index;
    t.image_xscale = image_xscale;

    if (dash_timer <= 0) is_dashing = false;
} 
else {
    // ESTADO DE MOVIMENTO NORMAL
    hspd = _move * walk_spd;
    vspd += grv;

    // Pulo
    if (_on_ground && _key_jump) {
        vspd = jump_spd;
    }

    // Ativação do Dash
    if (_key_dash && can_dash) {
        is_dashing = true;
        dash_timer = dash_time;
        can_dash = false;
        audio_play_sound(sn_dash, 0, false);
        
        var _dir = (_move != 0) ? _move : image_xscale;
        hspd = _dir * dash_spd;
        vspd = 0;
    }

    // ANIMAÇÕES (Apenas se não estiver atacando nem em dash)
    if (hspd != 0) {
        sprite_index = spr_BANGWALK;
        image_xscale = sign(hspd);
    } else {
        sprite_index = spr_BANGIDLE;
    }
}

// ==========================
// COLISÕES E MOVIMENTO (Sempre executados)
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
// TROCA DE SALA
// ==========================
var _change_room = keyboard_check_pressed(ord("E"));

if (_change_room) {

    // Salva posição atual
    global.spawn_x = x;
    global.spawn_y = y;

    if (room == Room2) room_goto(Room1);
    if (room == Room3) room_goto(Room4) {
	if (room ==Room8) room_goto(Room5);
    if (room == Room9) room_goto(Room7) ; 
	if (room = Room13) room_goto(Room12)
	if (room = Room15) room_goto(Room14)
    if (room = Room17) room_goto(Room16)
    if (room == Room19) room_goto(Room20);
	}
}
    
if (!_on_ground) {
    sprite_index = spr_BANGJUMP;
}
if (keyboard_check_pressed(ord("R"))) {

    global.spawn_x = 128;
    global.spawn_y = 224;

    room_restart();
}
if _key_jump {
  audio_play_sound(sn_pularbang,10,false)	
}
if instance_destroy(obj_ang) {
   instance_destroy()	
 	
	
}