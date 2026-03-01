// 1. Define o tamanho alvo
var mouse_over = position_meeting(mouse_x, mouse_y, id);
var target_scale = mouse_over ? 1.2 : 1.0; // Mudei para 1.2 porque 1.5 pode ser muito grande, ajusta como preferires

// 2. Aplica a suavização
image_xscale = lerp(image_xscale, target_scale, 0.1);
image_yscale = lerp(image_yscale, target_scale, 0.1);

// 3. Lógica do Som (Tocar apenas no "trigger")
if (mouse_over) {
    if (!variable_instance_exists(id, "mouse_ja_estava_aqui") || !mouse_ja_estava_aqui) {
        audio_play_sound(sn_select, 10, false);
        mouse_ja_estava_aqui = true; // Marca que o som já tocou
    }
} else {
    mouse_ja_estava_aqui = false; // Reseta quando o rato sai
}
