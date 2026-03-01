// No evento Room Start do seu objeto controlador
if (room == Room1) {
    audio_stop_sound(sn_cutsceneinicio);
} else if (room == Room_cutsceneinicial) { 
    // Só toca se não estiver já a tocar para evitar sobreposição
    if (!audio_is_playing(sn_cutsceneinicio)) {
        audio_play_sound(sn_cutsceneinicio, 10, true);
    }
}
// No evento Room Start do seu objeto controlador
if (room == Room_cutsceneinicial) {
    audio_stop_sound(sn_musicamenu);
} else if (room == Roommenu) { 
    // Só toca se não estiver já a tocar para evitar sobreposição
    if (!audio_is_playing(sn_musicamenu)) {
        audio_play_sound(sn_musicamenu, 10, true);
    }
}
