/// @description Check if player is colliding, extra checks for ladders
function scr_solid_player(argument0, argument1)
{
	/// @param x
	/// @param y
	/// @param extra_checks
	
	// Store old position
	var old_x = x
	var old_y = y
	var collide = false;
	
	x = argument0
	y = argument1
	
	// Check if I'm over a tile
	if place_meeting(x, y, obj_solid)
	or (place_meeting(x, y, obj_ghostwall) && state != states.ghost)
		collide = true;
	
	// Check if I crossed a tile boundary and landed on a platform
	if place_meeting(x, y, obj_platform)
	{
		var instlist = ds_list_create();
		var numplat = instance_place_list(x, y, obj_platform, instlist, true);
	
		if y > old_y && bbox_bottom % 16 == 0 && state != states.ladder
		{
			for(var i = numplat - 1; i >= 0; i--)
			{
				if !place_meeting(x, old_y, instlist[| i]) && place_meeting(x, y, instlist[| i])
				{
					collide = true;
					break;
				}
			}
		}
		ds_list_destroy(instlist);
	}
		
	// Check if I'm on a grindrail
	if y > old_y && bbox_bottom % 16 == 0
	&& !place_meeting(x, old_y, obj_grindrail) && place_meeting(x, y, obj_grindrail)
	{
		if state == states.mach2 or state == states.grind
			collide = true;
	}

	// Check if I'm over a slope
	var slope = instance_place(x, y, obj_slope);
	if slope
	{
		with slope
		{
			var object_side = 0
			var slope_start = 0
			var slope_end = 0
	
			if image_xscale > 0
			{
				// Slope is facing /|
				object_side = other.bbox_right
				slope_start = bbox_bottom
				slope_end = bbox_top
			}
			else
			{
				// Slope is facing |\
				object_side = other.bbox_left
				slope_start = bbox_top
				slope_end = bbox_bottom
			}
		
			// Calculate steepness of slope
			var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
			var slope = slope_start - round(m * (object_side - bbox_left))
		
			if other.bbox_bottom >= slope
			{
				// Object is inside slope
				collide = true;
			}
		}
	}

	x = old_x
	y = old_y
	return collide;
}