image_speed = 0.35
sprgot = spr_treasure1pick
spridle = spr_treasure1
spr = 1

if obj_player1.character == "S"
{
	if global.gameplay == 0
		instance_destroy()
	else
	{
		instance_change(obj_snicklevelend, true);
		y += 14;
	}
}

player = 0