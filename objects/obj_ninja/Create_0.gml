event_inherited();

attack_max = 180
attack_random = 30
attack_buffer = attack_max
movespeed = 0
dir = image_xscale
inv_timer = 0

grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 4
state = states.idle
stunned = 0
alarm[0] = 150
roaming = false
collectdrop = 5
flying = false
straightthrow = false
cigar = false
cigarcreate = false
stomped = false
shot = false
thrown = false
reset = false
hp = 2
hitboxcreate = false
grounded = true
chargereset = 0
idlespr = spr_ninja_idle
stunfallspr = spr_ninja_stun
walkspr = spr_ninja_walk
grabbedspr = spr_ninja_stun
scaredspr = spr_ninja_scared
image_xscale = sign(obj_player.x - x)
flash = false
slapped = false
birdcreated = false
boundbox = false
attack = false
sprite_index = spr_pizzaboy
important = false
spr_dead = spr_ninja_dead
heavy = false
depth = 0

if global.gameplay != 0
{
	idlespr = spr_ninjaNEW_idle;
	stunfallspr = spr_ninjaNEW_stun;
	walkspr = spr_ninjaNEW_idle;
	grabbedspr = spr_ninjaNEW_stun;
	scaredspr = spr_ninjaNEW_stun;
	spr_dead = spr_ninjaNEW_dead;
}

