function scr_player_handstandjump()
{
	var predir = dir;
	if character == "SP"
	{
		#region pizzelle golf grab
		
		landAnim = false;
		
		mach2 = 35;
		hsp = xscale * movespeed;
		vsp = 0;
		momentum = true;
		dir = xscale;
		
		move = key_left + key_right;
		movespeed = 10;
		
		if move != xscale && move != 0
		{
			state = states.normal
			if global.gameplay != 0 && !grounded
			{
				image_index = 0;
				sprite_index = spr_suplexcancel;
				jumpAnim = true;
				grav = basegrav;
				state = states.jump;
			}
		}
		
		if floor(image_index) >= image_number - 1
		{
			if key_attack
				state = states.mach2;
			else
				state = states.normal;
			dir = predir;
			
			image_speed = 0.35
			grav = basegrav
		}
	
		//Crouchslide
		if key_down && grounded && vsp >= 0
		{
			grav = basegrav
			sprite_index = spr_crouchslip
				
			scr_soundeffect(sfx_suplexdashSP);
			machhitAnim = false
			state = states.crouchslide
			movespeed = 16
			dir = predir;
		}
		
		// Jump
		if key_jump && grounded
		{
			scr_soundeffect(sfx_jump)
		    movespeed = 10
		    sprite_index = spr_mach2jump
		    instance_create(x, y, obj_jumpdust)
		    state = states.mach2
		    vsp = -11
			dir = predir;
		}
		
		image_speed = 0.35
	
		//Effects
		if !(instance_exists(obj_slidecloud)) && grounded && movespeed > 5
		with instance_create(x,y,obj_slidecloud)
			image_xscale = other.xscale
	
		#endregion
	}
	else
	{
		landAnim = false
		
		hsp = xscale * movespeed
		move = key_left + key_right;

		momentum = true
		dir = xscale
		
		if movespeed < 10 && grounded
			movespeed += 0.5
		else if !grounded
			movespeed = 10
		
		if global.gameplay != 0 && character != "S"
			movespeed = 10;
		
		//Jump Stop
		if !key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim
		{
			vsp /= 10
			jumpstop = true
		}

		if move != xscale && move != 0 && character != "S"
		&& state == states.handstandjump // dont remove this its not pointless i swear
		{
			xscale = move;
			state = states.normal;
			
			if global.gameplay != 0 && !grounded
			{
				image_index = 0;
				sprite_index = spr_suplexcancel;
				jumpAnim = true;
				grav = basegrav;
				state = states.jump;
				suplexmove = false;
			}
			exit;
		}
		
		if (floor(image_index) >= image_number - 1 or ((sprite_index == spr_suplexdashjump or sprite_index == spr_suplexdashjumpstart) && !scr_slope())) && (grounded && vsp >= 0)
		{
			if (!key_attack or character == "N") && vsp >= 0
			{
				image_speed = 0.35
				state = states.normal
				grav = basegrav
			}

			if key_attack && (!(character == "N" && noisetype == 0) && character != "S")
			{
				image_speed = 0.35
				state = states.mach2
				grav = basegrav
			}
		}

		if floor(image_index) >= image_number - 1 && sprite_index == spr_suplexdashjumpstart
			sprite_index = spr_suplexdashjump
		
		//Crouchslide
		if key_down && grounded && vsp >= 0 && character != "S"
		{
			grav = basegrav
			if character == "P" && scr_stylecheck(1)
				sprite_index = spr_player_breakdancesuper
			else
				sprite_index = spr_crouchslip
			
			machhitAnim = false
			state = states.crouchslide
			movespeed = 16
			dir = predir;
		}
		
		//Input jumping
		if !grounded && (sprite_index == spr_suplexdash or sprite_index == spr_shotgunsuplexdash)
		{
			image_index = 0
			sprite_index = spr_suplexdashjumpstart	
		}
		
		//Input buffer jumping
		if key_jump && character != "S"
			input_buffer_jump = 0
		
		if (grounded && input_buffer_jump < 8) && character != "S"
		{
			input_buffer_jump = 8;
			
			image_index = 0
			if state == states.crouchslide
			{
				if character == "P"
					sprite_index = spr_player_jumpdive1
				else
					sprite_index = spr_crouchslip
			}
			else
				sprite_index = spr_suplexdashjumpstart
			
			jumpstop = 0
			vsp = -11
			
			if global.gameplay != 0 && !(obj_player1.character == "N" && obj_player1.noisetype == 0)
			{
				if state == states.crouchslide
					movespeed = 8;
				
				state = states.mach2;
				sprite_index = spr_mach2jump;
			}
			else
			{
				scr_soundeffect(sfx_jump)
				instance_create(x,y,obj_highjumpcloud2)
			}
			dir = predir;
		}
		
		//Effects
		if !(instance_exists(obj_slidecloud)) && grounded && movespeed > 5
		with instance_create(x,y,obj_slidecloud)
			image_xscale = other.xscale
		
		//Noise Bomb
		if key_shoot2 && character == "N" && global.gameplay == 0
		{
			scr_soundeffect(sfx_noisewoah)
			state = states._throw
			sprite_index = spr_playerN_noisebombthrow
			image_index = 0
			
			with instance_create(x,y,obj_playerbomb)
			{
				movespeed = 7
				vsp = -7
				image_xscale = other.xscale
			}
		}

		if character == "S"
		{
			if vsp < 0
				vsp = 10;
			if key_attack 
			{
				hsp = 0
				if movespeed < 20
					movespeed += 0.5

				if movespeed >= 20
					sprite_index = spr_snick_superpeelout
				else if movespeed < 20 && movespeed >= 12
					sprite_index = spr_snick_mach3
				else if movespeed < 12 && movespeed >= 8
					sprite_index = spr_snick_mach2
				else
					sprite_index = spr_snick_walk
			}
			else if movespeed >= 12
				state = states.mach3
			else 
			{
				state = states.normal
				movespeed = 0
			}
			
			//Effects
			if !(instance_exists(obj_dashcloud2)) && grounded && movespeed > 5
			with instance_create(x,y,obj_dashcloud2)
				image_xscale = other.xscale
		}

		image_speed = 0.35	
	}
	
	//Faceplant roll
	if key_slap2 && global.gameplay == 0 && (character == "P" or character == "N" or character == "SP")
	{
		movespeed = 8
		if !grounded
			vsp = -5
		
		image_index = 0
		sprite_index = spr_faceplant
			
		if character == "N"
			scr_soundeffect(sfx_Nspin)
			
		state = states.faceplant
		image_speed = 0.5
		with instance_create(x, y, obj_jumpdust)
			image_xscale = other.xscale
			
		if !(instance_exists(crazyruneffectid))
		with instance_create(x,y,obj_crazyrunothereffect)
		{
			playerid = other.object_index	
			other.crazyruneffectid = id
		}
	}
	
	// Bump
	if !place_meeting(x + xscale, y, obj_destructibles) && character != "S"
	{
		ledge_bump();
		if scr_solid(x + xscale, y) && (!place_meeting(x + xscale, y, obj_slope) or scr_solidwall(x + xscale, y) or scr_solidwall(x, y - 1))
		{
			grav = basegrav
			movespeed = 0
			vsp = -3
			mach2 = 0
			image_index = 0
			machslideAnim = true
			machhitAnim = false
			
			scr_soundeffect(sfx_bumpwall);
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
			
			if global.gameplay == 0
			{
				state = states.bump;
				hsp = 2.5 * -xscale;
			}
			else
			{
				grounded = false;
				state = states.jump;
				jumpAnim = true;
				sprite_index = spr_suplexbump;
				jumpstop = true;
			}
		}
	}
}
