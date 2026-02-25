// 1. Detetar o clique no Shift (ativa o tremor)
if (keyboard_check_pressed(vk_shift)) {
    shake = true;
    shake_time = 15;        // Quantos frames dura o tremor
    shake_magnitude = 3;   // Força do tremor (em pixels)
    shake_fade = 0.5;       // Quanto diminui por frame
}
// 1. Detetar o clique no Shift (ativ
// 2. Processar o tremor
if (shake) {
    if (shake_time > 0) {
        shake_time -= 1;
        
        // Calcula um desvio aleatório
        var _x_offset = random_range(-shake_magnitude, shake_magnitude);
        var _y_offset = random_range(-shake_magnitude, shake_magnitude);
        
        // Aplica o tremor somando à posição atual
        camera_set_view_pos(view_camera[0], cam_x_original + _x_offset, cam_y_original + _y_offset);
    } else {
        // Reduz a força gradualmente (smooth fade out)
        shake_magnitude -= shake_fade;
        
        if (shake_magnitude <= 0) {
            shake = false;
            shake_magnitude = 0;
            // Repõe a câmara na posição correta
            camera_set_view_pos(view_camera[0], cam_x_original, cam_y_original);
        }
    }
}
