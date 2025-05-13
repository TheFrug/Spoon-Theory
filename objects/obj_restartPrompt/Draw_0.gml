if (visible) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fpixelify);
    draw_set_color(c_white);

    var restart_text = "Press [ENTER] to Restart";
    draw_text(x, y, restart_text);
}