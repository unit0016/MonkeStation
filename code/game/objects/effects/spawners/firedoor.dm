//Set of directional border_only firelocks

/obj/machinery/door/firedoor/border_only/spawner/east
	dir = EAST

/obj/machinery/door/firedoor/border_only/spawner/west
	dir = WEST

/obj/machinery/door/firedoor/border_only/spawner/north
	dir = NORTH

/obj/machinery/door/firedoor/border_only/spawner/south
	dir = SOUTH

//Directional firelock spawners

/obj/effect/spawner/structure/directional_firelock
	icon = 'monkestation/icons/obj/firedoor_spawner.dmi'

/obj/effect/spawner/structure/directional_firelock/east_west
	spawn_list = list(/obj/machinery/door/firedoor/border_only/spawner/east, /obj/machinery/door/firedoor/border_only/spawner/west)
	icon_state = "east_west"

/obj/effect/spawner/structure/directional_firelock/north_south
	spawn_list = list(/obj/machinery/door/firedoor/border_only/spawner/north, /obj/machinery/door/firedoor/border_only/spawner/south)
	icon_state = "north_south"
