if (visible) {
    draw_self(); // Use a sprite like spr_ui_next or draw a rectangle
    draw_set_font(fpixelify_md);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(x + sprite_width / 2, y + sprite_height / 2, "Next");
}