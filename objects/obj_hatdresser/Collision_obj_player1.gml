if obj_player1.key_up2 && obj_player1.state == states.normal && !instance_exists(obj_hatchoice)
	instance_create(0, 0, obj_hatchoice);