//Kill
if (other.state = states.handstandjump or other.state = states.punch or other.instakillmove = true) && other.character == "N"
{
	with (other)
	{
		sprite_index = choose(spr_suplexmash1,spr_suplexmash2,spr_suplexmash3, spr_suplexmash4, spr_punch)
		image_index = 0
		state = states.tackle
		movespeed = 3
		vsp = -3
		instance_destroy(other)	
	}

	scr_soundeffect(sfx_killenemy)
	scr_sleep(50)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_slapstar)
	instance_create(x,y,obj_baddiegibs)
	instance_create(x,y,obj_baddiegibs)
	instance_create(x,y,obj_baddiegibs)
	instance_create(x,y,obj_bangeffect)

	with instance_create(x,y,obj_sausageman_dead)
		sprite_index = spr_gustavopresentdead
	instance_destroy()
}