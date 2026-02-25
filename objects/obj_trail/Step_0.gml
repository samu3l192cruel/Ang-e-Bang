life--;

image_alpha -= fade_speed;

if (life <= 0) {
    instance_destroy();
}