// 1. Verifica se o rato está sobre este botão específico
var mouse_over = position_meeting(mouse_x, mouse_y, id);

// 2. Define o tamanho alvo (com um pequeno "bounce" ao clicar se quiseres)
var target_scale = mouse_over ? 1.2 : 1.0;

// Se o botão for pressionado, faz um feedback visual de "aperto" (opcional)
if (mouse_over && mouse_check_button(mb_left)) {
    target_scale = 1.1; 
}

// 3. Aplica a suavização
image_xscale = lerp(image_xscale, target_scale, 0.1);
image_yscale = lerp(image_yscale, target_scale, 0.1);

// 4. Lógica do Som (Trigger de entrada)
if (mouse_over) {
    if (!mouse_ja_estava_aqui) {
        audio_play_sound(sn_select, 10, false);
        mouse_ja_estava_aqui = true;
    }
    
    // 5. Verificação do Clique para mudar de sala
    if (mouse_check_button_pressed(mb_left)) {
        // Podes tocar um som de clique aqui também!
        room_goto(Room_cutsceneinicial);
    }
} else {
    mouse_ja_estava_aqui = false;
}
