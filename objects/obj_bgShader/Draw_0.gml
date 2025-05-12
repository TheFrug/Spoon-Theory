shader_set(shd_wavyGradient);
var t = current_time * 0.001; // Pass time to shader
shader_set_uniform_f(shader_get_uniform(shd_wavyGradient, "u_time"), t);
draw_sprite_stretched(spr_background, 0, 0, 0, display_get_width(), display_get_height());
shader_reset();
