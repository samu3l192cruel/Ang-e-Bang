instance_destroy(obj_inimigoseguranca)
if place_meeting(x,y,obj_ang) {
  instance_create_layer(y ,x ,"instancestrasincao",obj_transicao)
}
if place_meeting(x,y,obj_ang) && (room == Room14) {
    instance_create_layer(x,y,"instancestrasincao",obj_transicao)	
	
}