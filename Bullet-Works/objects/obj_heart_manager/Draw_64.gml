var l6DD47C1B_0 = sprite_get_width(spr_heartt);
var l6DD47C1B_1 = 0;
for(var l6DD47C1B_2 = lives; l6DD47C1B_2 > 0; --l6DD47C1B_2) {
	draw_sprite(spr_heartt, 0, 0 + l6DD47C1B_1, 0);
	l6DD47C1B_1 += l6DD47C1B_0;
}