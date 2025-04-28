var log_x = 20;
var log_y = 400;
var line_spacing = 10;
var padding = 8;
var typing_speed = 2;
var is_typing = true;

draw_sprite_stretched(spr_ui_back, 0, log_box_x, log_box_y, log_box_width, log_box_height);

// Set up drawing
draw_set_font(fDefault);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var text_x = log_box_x + padding;
var text_y = log_box_y + padding;

var current_y = text_y;

for (var i = 0; i < array_length(logText); i++) {
    var entry = logText[i];
    
    // Handle typing
    if (entry.current < string_length(entry.msg) && is_typing) {
        entry.timer += 1;
        if (entry.timer >= typing_speed) {
            entry.current += 1;
            entry.timer = 0;
        }
        is_typing = false;
    } else if (entry.current >= string_length(entry.msg)) {
        entry.current = string_length(entry.msg);
    }
    
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
            draw_set_color(c_gray);
    }
    
    var visibleText = string_copy(entry.msg, 1, entry.current);

    // ✨ Here's the manual word-wrapping
    var words = string_split(visibleText, " ");
    var line = "";
    for (var w = 0; w < array_length(words); w++) {
        var test_line = line;
        if (string_length(test_line) > 0) {
            test_line += " ";
        }
        test_line += words[w];
        
        if (string_width(test_line) > (log_box_width - padding * 2)) {
            // Too wide: draw current line and start new one
            draw_text(text_x, current_y, line);
            current_y += string_height("A") + line_spacing;
            line = words[w];
        } else {
            // Add word to line
            line = test_line;
        }
    }
    
    // Draw last line
    if (string_length(line) > 0) {
        draw_text(text_x, current_y, line);
        current_y += string_height("A") + line_spacing;
    }

    logText[i] = entry;
	

}

	// --- Draw "Press SPACE to Skip" prompt ---
if (isLogTyping()) {	

    var prompt_text = "Press [SPACE] to skip";
	
	var prompt_x = (log_box_x - 60) + (log_box_width / 2); // Center horizontally on the log box
    var prompt_y = log_box_y - 30; // Slightly above the top of the log box (adjust -20 if needed)
	
    draw_text(prompt_x, prompt_y, prompt_text);
}
