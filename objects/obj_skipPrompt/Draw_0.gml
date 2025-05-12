if (alpha > 0) { // Don't draw if fully invisible
	draw_set_font(fpixelify_md);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	
	draw_text(x, y, "Press [SPACE] to skip");

	draw_set_alpha(1); // Reset alpha for safety
}