if (place_meeting(x, y, obj_botao))
{
    var inst = instance_place(x, y, obj_botao);
    if (inst != noone)
    {
        inst.sprite_index = spr_botaopressionado;
    }
}