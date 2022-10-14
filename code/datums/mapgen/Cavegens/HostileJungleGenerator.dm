/// Based on cavegen instead of junglegenerator
/datum/map_generator/cave_generator/hostile_jungle
	open_turf_types = list(/turf/open/floor/plating/grass/jungle = 1, /turf/open/floor/plating/dirt/jungle = 15, /turf/open/floor/plating/dirt/jungle/dark = 10)
	closed_turf_types =  list(/turf/closed/mineral/random/jungle = 1)
	blacklisted_turf_types = list(/turf/open/water/jungle) // Don't override rivers


	feature_spawn_list = list(/obj/structure/geyser/random = 1)
	/// All of these mobs are overpowered as shitballs, being deadcode holdovers. I'm so sorry.
	mob_spawn_list = list(/mob/living/simple_animal/hostile/jungle/leaper = 5, \
	/mob/living/simple_animal/hostile/jungle/mega_arachnid = 10, \
	/mob/living/simple_animal/hostile/jungle/mook = 50, \
	/mob/living/simple_animal/hostile/jungle/seedling = 1\
	)
	flora_spawn_list = list(/obj/structure/flora/grass/jungle = 2 , \
		/obj/structure/flora/grass/jungle/b = 2 , \
		/obj/structure/flora/tree/jungle = 2 , \
		/obj/structure/flora/rock/jungle = 1, \
		/obj/structure/flora/junglebush = 2, \
		/obj/structure/flora/junglebush/b = 1 , \
		/obj/structure/flora/junglebush/c = 2, \
		/obj/structure/flora/junglebush/large = 1, \
		/obj/structure/flora/rock/pile/largejungle = 1 \
		)

	flora_spawn_chance = 15
	initial_closed_chance = 45
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3
