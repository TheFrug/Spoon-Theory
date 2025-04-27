var log_x = 20;
var log_y = 400;
var line_height = 30;
var padding = 8;

draw_sprite_stretched(spr_ui_back, 0, log_box_x, log_box_y, log_box_width, log_box_height);

// draw_set_color(c_white); //Set text color
// Set up drawing
draw_set_font(fDefault);
draw_set_halign(fa_left); //Reset alignment for the log
draw_set_valign(fa_top);

// Coordinates for log text
var text_x = log_box_x + padding;
var text_y = log_box_y + padding;

for (var i = 0; i < array_length(logText); i++) {
	var entry = logText[i];
	
	// Set color based on type
	switch (entry.type) {
		case "scenario":
			draw_set_color(c_yellow);
			break;
		case "result":
			draw_set_color(c_lime);
			break;
		case "other":
			draw_set_color(c_red);
			break;
		default:
			draw_set_color(c_gray); // fallback color
	}
	
	// Draw the log message
	draw_text(text_x, text_y + i * line_height, entry.msg);
}
