// obj_player step

if collision_circle(x,y,1, obj_danger_zone, false, false ){ 
		fallen = true
	}

if fallen {
	can_move = false
	image_xscale -= 0.04
	image_yscale -= 0.04
	if image_xscale <= 0  or image_yscale <= 0 {
		image_xscale = 0.01
		image_yscale = 0.01
	}
	fall_timer += 1
	//fall_timer += 1
	if fall_timer == fall_timer_max {
		
		//audio_play_sound(snd_respawn, 0, false)
		x = start_x
		y = start_y
		image_angle = 0
		image_xscale = 1
		image_yscale = 1
		fallen = false
		fall_timer = 0
		can_move = true
	}
}

// Player must stay within bounds
x = clamp(x, left_bound, right_bound);
y = clamp(y, upper_bound, lower_bound);

// Move player
// Player cannot move if stunned or if they JUST hit
if (!stun and !hit and can_move) {
		 if (move_up)    { y-=spd; }
	else if (move_down)  { y+=spd; } 
		 if (move_left)  { x-=spd; }
	else if (move_right) { x+=spd; }
}

// A defense can be a block
// Player cannot block if stunned
if (block && !defend && !stun) {
	defend = true;
	defend_timer = defend_duration;
}

// A hit lasts 0.5 seconds
if (hit) {
	hit_timer--;
	if (hit_timer <= 0) {
		hit = false;
		hit_timer = hit_duration;
	}
}

// A defense lasts 2 seconds
if (defend) {
	defend_timer--;
	if (defend_timer <= 0) {
		defend = false;
		defend_timer = defend_duration;
	}
}

// A stun lasts 2 seconds
if (stun) {
	stun_timer--;
	if (stun_timer <= 0) {
		stun = false;
		stun_timer = stun_duration;
	}
}

// Note: Player might not be able to charge if stunned?
//if (charge) {
//	charge_timer--
//	if charge_timer <= 0 {
//		charge = false
//		charge_att = true
//		charge_timer = 60*2
//	}
//	else {
//		charge_att = false
//	}
//}

//change move angle 
//and change sprite
if move_up {
	move_dir = 90
	sprite_index = spr_up
	image_speed = 1;
	if move_left {
		move_dir += 45
	}
	else if move_right {
		move_dir -= 45
	}
}
else if move_down {
	move_dir = 270
	if move_left {
		move_dir -= 45
	}
	else if move_right {
		move_dir += 45
	}
}
else {
	if move_left {
		move_dir = 180
	}
	else if move_right {
		move_dir = 0
	}
}

// Reset movement booleans
move_up = false
move_down = false
move_left = false
move_right = false

// Reset combat booleans
slap = false;
trip = false;
push = false;
block = false;
