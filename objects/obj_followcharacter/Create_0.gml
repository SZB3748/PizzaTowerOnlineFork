image_speed = 0.35;
xoffsetmax = 25;
xoffset = 25;
yoffset = 2;

LAG_STEPS = 20;
followqueue = ds_queue_create();
ds_list_add(global.followerlist, id);
pos = ds_list_find_index(global.followerlist, id);
followid = (pos > 0 ? ds_list_find_value(global.followerlist, pos - 1) : noone);
instakilled = 0;
xscale = obj_player1.xscale;

yslope = 0;
moveback = false;