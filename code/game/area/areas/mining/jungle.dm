/// Basetype both for Station and Mining levels.
/area/jungle
	name = "Jungle Planetoid"
	icon_state = "explored"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	sound_environment = SOUND_AREA_JUNGLE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED
	outdoors = TRUE

/// Station-Side Jungle Areas ///
/// Ruins and Monsters begin spawning here
/area/jungle/station/generated
	icon_state = "unexplored"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED
	map_generator = /datum/map_generator/jungle_generator

/// Ditto, but megafauna can spawn here too. Use VERY sparingly, if at all, since this generator isn't meant for the mining level.
/area/jungle/station/generated/megafauna
	icon_state = "danger"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED

/// Mining Jungle Areas ///
/// Ruins and Monsters begin spawning here
/area/jungle/mining/generated
	icon_state = "unexplored"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/hostile_jungle

/// Ditto, but megafauna can spawn here too.
/area/jungle/mining/generated/megafauna
	icon_state = "danger"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
