draw_set_color(c_white);
draw_set_font(fpixelify_md);

// Draw the spoon icon in the top-left
draw_sprite(spr_ui_icon_spoon, 0, icon_x, icon_y);

// Define the width and height you want
panelWidth = 150;  // adjust this as needed
panelHeight = sprite_get_height(spr_ui_spoon_text);

// Draw the UI panel next to it
draw_sprite_stretched(spr_ui_spoon_text, 0, panel_x, panel_y, panelWidth, panelHeight);

// Draw the text inside the panel
var spoon_text = "Spoons: " + string(obj_gameController.playerSpoons);
draw_text(panel_x + textOffset_x + 4, panel_y + textOffset_y + 2, spoon_text);