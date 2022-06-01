mylayers = ["Tiles_Secret", "Tiles_Secret1", "Tiles_Secret2"];
for(var i = 0; i < array_length(mylayers); i++)
{
	var mylayer = mylayers[i];
	if layer_exists(mylayer)
	{
		layer_depth(mylayer, 90 - i);
		layer_shader(mylayer, shd_layeralpha);
	}
}

if place_meeting(x, y, obj_player)
{
	alpha = 0;
	done = true;
}
else if oneway
{
	with instance_create(x, y, obj_solid)
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}

