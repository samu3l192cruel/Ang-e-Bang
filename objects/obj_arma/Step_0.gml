if (pegue == true) {
    // 1. DISTÂNCIA DO PLAYER: Ajuste o '15' para afastar ou aproximar a arma do corpo
    var direcao_mouse = point_direction(obj_ang.x, obj_ang.y, mouse_x, mouse_y);
    
    // Calcula a posição ao lado do player baseada na direção do mouse
    // lengthdir_x e y garantem que a arma circule o player corretamente
    x = obj_ang.x + lengthdir_x(15, direcao_mouse);
    y = obj_ang.y + lengthdir_y(15, direcao_mouse);
    
    // 2. Mira
    image_angle = direcao_mouse;
    
    // 3. Inverte o sprite para não ficar de ponta-cabeça
    if (mouse_x < x) image_yscale = -1; else image_yscale = 1;

    // 4. Atira
    if (mouse_check_button_pressed(mb_left)) {
        var _bala = instance_create_layer(x, y, "Instances", obj_bala);
        _bala.direction = image_angle;
        _bala.image_angle = image_angle;
        _bala.speed = 10;
    }
} else {
    // CÓDIGO PARA QUANDO ESTÁ NO CHÃO
    // Apenas flutua se ainda NÃO foi pega
    tempo += 0.05;
    y = base_y + sin(tempo) * 5; // Diminuí o 20 para 5 para não voar tanto
}
