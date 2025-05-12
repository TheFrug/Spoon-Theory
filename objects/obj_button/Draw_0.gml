//draw button background
draw_self();

//Set up drawing
draw_set_color(c_white);
draw_set_font(fpixelify_md);
draw_set_halign(fa_center); // Center the text horizontally
draw_set_valign(fa_middle); // Center the text vertically

if (isUnknownCost) {
	formattedAction = actionName + "\nSpoon Cost: " + string(actionCost);
} else if (!isUnknownCost) {
	formattedAction = actionName + "\nCost: ???";
}

draw_text(x + sprite_width / 2, y + sprite_height / 2, formattedAction);
