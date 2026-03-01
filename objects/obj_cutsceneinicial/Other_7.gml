// Só troca de fase se a imagem já estiver totalmente visível
if (image_alpha >= 1) {
    if (fase == 1) {
        sprite_index = spr_cutsceneinicial2;
        fase = 2;
    }
    else if (fase == 2) {
        sprite_index = spr_cutsceneinicial3;
        fase = 3;
    }
    else if (fase == 3) {
        sprite_index = spr_cutsceneinicial4;
        fase = 4;
    }
    else if (fase == 4) {
        room_goto(Room1);
    }
    
    // Reseta para a nova sprite começar do início e invisível (fade in)
    image_index = 0;
    image_alpha = 0; 
}
