if place_meeting(x, y, obj_player)
{
	// rematch comuter flicker
	if sprite_index == spr_snickrematchcomputer or sprite_index == spr_medievalcomputer_re
	or sprite_index == spr_ruincomputer_re or sprite_index == spr_dungeoncomputer_re
		image_index = choose(0, 0, 0, 0, 0, 0, 0, 1);
	else
		image_speed = 0.35;
}
else
{
	image_speed = 0
	image_index = 0
}
if sprite_index == spr_exitgate
	image_index = 1;

// show level name when player near
if instance_exists(obj_player)
{
	var p = instance_nearest(x, y, obj_player);
	
	if msg != "" && distance_to_object(p) < 50
	&& p.state != states.gameover && p.state != states.victory
	{
		with obj_tv
		{
			message = other.msg
			showtext = true
			alarm[2] = 2
		}
	}
}