// 1. Verifica se o alvo (other) já foi transformado
if (!variable_instance_exists(other, "virou_mutante") || other.virou_mutante == false) {
    
    // 2. Cria o mutante na posição do alvo
    instance_create_layer(other.x, other.y, "Instances", obj_mutante);
    
    // 3. Marca o alvo como transformado e "esconde-o"
    other.virou_mutante = true; 
    other.image_alpha = 0;
    other.mask_index = -1; 

    // 4. Efeitos no objeto que disparou a colisão (o bang/boss)
    image_alpha = 0; 
    
    // 5. Toca o som (apenas uma vez, por estar dentro do if)
    audio_play_sound(sn_transformacaomutante, 10, false);
}
