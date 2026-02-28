
//Checando se existe mais uma room depois dessa

if (room_next(room) != -1)

{

//Se a próxima room é diferente de 1 (ou se
room_goto_next();

}

//Caso contrário, se eu estou na ultima room, eu

else

{

room_goto(Room3);

}


if (room ==Room10) {
room_goto(Room11)

}
if (room ==Room11) {
room_goto(Room12)

}
if (room ==Room13) {
room_goto(Room14)

}
if (room ==Room17) {
	room_goto(Room19)
	
}
if (room ==Room19) {
	room_goto(Room18)
	
}
if (room ==Room24) {
    room = Room25cutscene	
	
}