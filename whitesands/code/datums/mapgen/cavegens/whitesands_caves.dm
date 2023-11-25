/datum/map_generator/cave_generator/whitesands
	open_turf_types = list(/turf/open/misc/asteroid/whitesands = 5, /turf/open/misc/asteroid/whitesands/dried = 1)
	closed_turf_types =  list(/turf/closed/mineral/random/whitesands = 1)


	feature_spawn_list = list(/obj/structure/geyser/random = 1, /obj/effect/landmark/ore_vein = 9)
	mob_spawn_list = list(/obj/structure/spawner/lavaland/goliath = 3, \
		/obj/effect/spawner/random/lavaland_mob/goliath = 40, /obj/structure/spawner/lavaland = 2, \
		/obj/effect/spawner/random/lavaland_mob/watcher = 30, /obj/structure/spawner/lavaland/legion = 3, \
		SPAWN_MEGAFAUNA = 4,  /mob/living/basic/mining/goldgrub = 10)
	flora_spawn_list = list(/obj/structure/flora/ash/leaf_shroom = 4 , /obj/structure/flora/ash/cap_shroom = 4 , /obj/structure/flora/ash/stem_shroom = 4 , /obj/structure/flora/ash/cacti = 2, /obj/structure/flora/ash/tall_shroom = 4)

	initial_closed_chance = 45
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3
