if (pode_agir && instance_exists(obj_angfinalboss)) {
    
    // --- MOVIMENTO ---
    var dir = point_direction(x, y, obj_angfinalboss.x, obj_angfinalboss.y);
    x += lengthdir_x(velocidade, dir);
    y += lengthdir_y(velocidade, dir);
    
    if (obj_angfinalboss.x > x) image_xscale = 3.5; else image_xscale = 3.5;
        if (obj_angfinalboss.y > y) image_yscale = 3.5; else image_yscale = 3.5;
    // --- ATAQUE (A CADA 5 SEGUNDOS) ---
    if (distance_to_object(obj_angfinalboss) < 300 && pode_atirar) {
        sprite_index = spr_joaninhafogoatk;
        image_index = 0;

        var tiro = instance_create_layer(x, y, "Instances", obj_fogo);
        tiro.direction = dir;
        tiro.speed = 4;
        
        pode_atirar = false;
        alarm = 300; // 5 segundos de recarga
    }
}
