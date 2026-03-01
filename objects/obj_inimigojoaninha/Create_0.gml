// Atributos de vida
hp = 100;
hp_max = 100;

// Atributos de movimento e combate
velocidade = 2;
pode_atirar = true;

// Define a sprite inicial (parada/andando)
sprite_index = spr_joaninhafogo; 
// ... teus outros códigos (hp, velocidade, etc) ...

pode_agir = false; // Começa parado
alarm[1] = 180;    // 3 segundos (3 * 60 fps) para começar a agir
