draw_set_font(fpixelify_md);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var dayText = "Day " + string(global.currentDay);
draw_text(x, y, dayText);