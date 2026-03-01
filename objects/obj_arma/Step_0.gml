if (pegue == true) {
    // Verifica se o objeto de referência (player/ângulo) existe antes de rodar o código
    if (instance_exists(obj_ang)) {
        
        // 1. DISTÂNCIA DO PLAYER
        var direcao_mouse = point_direction(obj_ang.x, obj_ang.y, mouse_x, mouse_y);
        
        x = obj_ang.x + lengthdir_x(15, direcao_mouse);
        y = obj_ang.y + lengthdir_y(15, direcao_mouse);
        
        // 2. Mira
        image_angle = direcao_mouse;
        
        // 3. Inverte o sprite
        if (mouse_x < x) image_yscale = -1; else image_yscale = 1;

        // 4. Atira
        if (mouse_check_button_pressed(mb_left)) {
            var _bala = instance_create_layer(x, y, "Instances", obj_bala);
            _bala.direction = image_angle;
            _bala.image_angle = image_angle;
            _bala.speed = 10;
        }
    }
}
if (pegue == true) {
    // Verifica se o objeto de referência (player/ângulo) existe antes de rodar o código
    if (instance_exists(obj_angfinalboss)) {
        
        // 1. DISTÂNCIA DO PLAYER
        var direcao_mouse = point_direction(obj_angfinalboss.x, obj_angfinalboss.y, mouse_x, mouse_y);
        
        x = obj_angfinalboss.x + lengthdir_x(15, direcao_mouse);
        y = obj_angfinalboss.y + lengthdir_y(15, direcao_mouse);
        
        // 2. Mira
        image_angle = direcao_mouse;
        
        // 3. Inverte o sprite
        if (mouse_x < x) image_yscale = -1; else image_yscale = 1;

        // 4. Atira
        if (mouse_check_button_pressed(mb_left)) {
            var _bala = instance_create_layer(x, y, "Instances", obj_bala);
            _bala.direction = image_angle;
            _bala.image_angle = image_angle;
            _bala.speed = 10;
        }
    }
}

