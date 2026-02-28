// Lógica de Fade In (Aparecer)
if (image_alpha < 1) {
    image_alpha += fade_speed;
}

// Contagem do Timer
if (image_alpha >= 1) { // Só conta o tempo após a imagem aparecer totalmente
    timer -= 1;
}

// Troca de Imagem / Room
if (timer <= 0) {
    if (fase == 1) {
        sprite_index = spr_cutscene2;
        image_alpha = 0; // Reseta o alpha para a nova imagem aparecer suavemente
        timer = 2 * game_get_speed(gamespeed_fps);
        fase = 2;
    } 
    else if (fase == 2) {
        room_goto(Room26);
    }
}
