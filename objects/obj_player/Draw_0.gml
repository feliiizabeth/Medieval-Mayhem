// obj_player draw

draw_self();

draw_text(50,400, spr_up)

// draw charging bar
if (charge_width_curr > 0) {
	draw_set_alpha(0.25);
	draw_rectangle_color(x-charge_width_target/2, y+35, x-charge_width_target/2+charge_width_target, y+50, c_gray, c_gray, c_gray, c_gray, true);
	draw_set_alpha(1);
	draw_rectangle_color(x-charge_width_target/2, y+35, x-charge_width_target/2+charge_width_curr, y+50, charge_bar_color, charge_bar_color, charge_bar_color, charge_bar_color, false);
}