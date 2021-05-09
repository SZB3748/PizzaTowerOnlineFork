if room == rm_editor exit;
if ds_list_find_index(global.saveroom, id) = -1 && global.snickchallenge = false
{
	if global.gameplay != 0
	{
		instance_activate_object(obj_baddie);
		with obj_baddie
		{
			if escape
			{
				visible = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		
		instance_activate_object(obj_collectescape);
		with obj_collectescape
		{
			visible = true;
			instance_create(x, y, obj_genericpoofeffect);
		}
	}
	
	if global.musicvolume == 0
		scr_soundeffect(sfx_escaperumble)
	
	obj_camera.alarm[1] = 60
	instance_create(x,y,obj_bangeffect)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_baddiegibs)
	instance_create(x,y,obj_baddiegibs)
	instance_create(x,y,obj_baddiegibs)

	with (obj_camera) {

	    shake_mag=3;
	    shake_mag_acc=3/room_speed;
	}

	with instance_create(x,y,obj_sausageman_dead)
	sprite_index = spr_hungrypillar_dead

	scr_soundeffect(sfx_killenemy)

	if !instance_exists(obj_endlevelfade)
	{
		instance_create(x,y+ 600, obj_itspizzatime)
		global.panic = true
		
		var roomname = room_get_name(room);
		if string_endswith(roomname, "_NEW")
			roomname = string_replace(roomname, "_NEW", "");
		
		//DDP Set global timer based on current stage
		switch roomname
		{
			case "entrance_10":
				global.minutes = 2
				global.seconds = 30
				break
			
			case "medieval_10":
				global.minutes = 2
				global.seconds = 15
				break
			
			case "ruin_11":
				global.minutes = 3
				global.seconds = 59
				break
	
			case "dungeon_10":
				global.minutes = 4
				global.seconds = 30
				break
	
			case "chateau_6":
				global.minutes = 3
				global.seconds = 15
				break
	
			case "strongcold_1":
				global.minutes = 3
				global.seconds = 59
				break
	
			case "dragonlair_1":
				global.minutes = 0
				global.seconds = 59
				break
	
			case "floor1_room11":
				global.minutes = 2
				global.seconds = 59
				break
	
			case "graveyard_6":
				global.minutes = 3
				global.seconds = 59
				break
	
			case "farm_11":
				global.minutes = 3
				global.seconds = 59
				break
			
			case "ufo_12":
				global.minutes = 2
				global.seconds = 30
				break
			
			case "beach_13":
				global.minutes = 3
				global.seconds = 30
				break
			
			case "forest_5":
				global.minutes = 3
				global.seconds = 30
				break
			
			case "kungfu_10":
				global.minutes = 6
				global.seconds = 30
				break
			
			case "minigolf_8":
				global.minutes = 7
				global.seconds = 30
				break
			
			case "space_9":
				global.minutes = 5
				global.seconds = 30
				break
			
			case "mansion_7":
				global.minutes = 5
				global.seconds = 30
				break
			
			case "factory_10":
				global.minutes = 6
				global.seconds = 30
				break
			
			case "freezer_3":
				global.minutes = 5
				global.seconds = 30
				break
			
			case "war_1":
				global.minutes = 8
				global.seconds = 59
				break
			
			case "exit_1":
				global.minutes = 9
				global.seconds = 59
				break
			
			case "kidsparty_lastroom":
				global.minutes = 3
				global.seconds = 30
				break
			
			case "floor4_roomtreasure":
				global.minutes = 2
				global.seconds = 30
				break


			case "floor3_roomtreasure":
				global.minutes = 2
				global.seconds = 30
				break


			case "floor2_roomtreasure":
				global.minutes = 2
				global.seconds = 30
				break

			case "floor5_roomtreasure":
				global.minutes = 1
				global.seconds = 59
				break
			
			case "golf_roomtreasure":
				global.minutes = 1
				global.seconds = 59
				break
			
			case "etb_8":
				global.minutes = 2
				global.seconds = 59
				break
			
			case "custom_lvl_room":
				with obj_destroyableescape
			        alarm[0] = 1
			    with obj_destroyable2escape
			        alarm[0] = 1
			    with obj_destroyable3escape
			        alarm[0] = 1
			    with obj_destroyable2_bigescape
			        alarm[0] = 1
			    global.minutes = global.editorminutes
			    global.seconds = global.editorseconds
			    break
		}

		// Start up panicbg effects if option is enabled
		if global.panicbg {
			scr_panicbg_init()
		}
		global.wave = 0
		global.maxwave = (global.minutes * 60 + global.seconds) * 60
	}

	ds_list_add(global.saveroom, id)

	with obj_panicdebris
		event_perform(ev_other, ev_room_start);
}

if song != -1
{
	audio_sound_gain(global.music, global.musicvolume, 0);
	audio_stop_sound(song);
}

with obj_checkpoint
{
	if sprite_index == spr_checkpoint
		instance_destroy();
}