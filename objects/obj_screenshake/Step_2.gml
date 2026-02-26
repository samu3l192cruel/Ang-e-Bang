// ... (dentro do if do clique do mouse no obj_arma)
if (mouse_check_button_pressed(mb_left)) {
 

    // 2. ATIVA O TREMOR NO OBJ_SCREENSHAKE
    with(obj_screenshake) {
        shake = true;
        shake_time = 10;        // Duração curta para um tiro
        shake_magnitude = 4;   // Força do coice da arma
        shake_fade = 0.4;
    }
}
