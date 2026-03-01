draw_self();

if (hp > 0) {
    var pc = (hp / hp_max) * 100;
    draw_healthbar(x - 20, y - 30, x + 20, y - 25, pc, c_black, c_red, c_green, 0, true, true);
}
