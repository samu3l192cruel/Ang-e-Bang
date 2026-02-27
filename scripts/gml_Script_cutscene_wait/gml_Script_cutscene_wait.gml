function cutscene_wait(_segundos){
    timer++;
	if timer >= room_speed *_segundos{
		timer = 0
		action++
}
}
function cutscene_walk_right(_segundos){
    obj_bang.x++;
	timer++;
	if timer >= room_speed *_segundos{
		timer = 0
		action++
}
}
function cutscene_walk_left(_segundos){
    obj_bang.x--;
	timer++;
	if timer >= room_speed *_segundos{
		timer = 0
		action++
}
}
