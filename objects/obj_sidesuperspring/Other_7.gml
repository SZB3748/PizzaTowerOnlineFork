if global.gameplay == 0
{
	image_speed = 0;
	image_index = 0;
}
else
{
	if sprite_index == spr_sidespringblock_bounce
		sprite_index = spr_sidespringblock_idle;
}