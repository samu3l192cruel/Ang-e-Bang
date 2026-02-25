shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;

// Guarda a posição original da câmara para evitar que ela saia do sítio
cam_x_original = camera_get_view_x(view_camera[0]);
cam_y_original = camera_get_view_y(view_camera[0]);
