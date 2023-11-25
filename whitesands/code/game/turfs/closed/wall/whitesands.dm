
/turf/closed/mineral/iron/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/iron/whitesands/update_icon()
	. = ..()
	if(smoothing_flags & (SMOOTH_CORNERS|SMOOTH_BITMASK))
		QUEUE_SMOOTH(src)
		QUEUE_SMOOTH_NEIGHBORS(src)

/turf/closed/mineral/uranium/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/uranium/whitesands/update_icon()
	. = ..()
	if(smoothing_flags & (SMOOTH_CORNERS|SMOOTH_BITMASK))
		QUEUE_SMOOTH(src)
		QUEUE_SMOOTH_NEIGHBORS(src)

/turf/closed/mineral/diamond/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/plasma/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/bscrystal/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/gibtonite/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/random/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/random/whitesands/mineral_chances()
	return list(/obj/item/stack/ore/uranium = 5, /obj/item/stack/ore/diamond = 1, /obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/silver = 12, /obj/item/stack/ore/plasma = 20, /obj/item/stack/ore/iron = 40, /obj/item/stack/ore/titanium = 11,
		/turf/closed/mineral/gibtonite/whitesands = 4, /turf/open/misc/asteroid/whitesands = 2, /obj/item/stack/ore/bluespace_crystal = 1)

/turf/closed/mineral/random/whitesands/high_chance
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/random/labormineral/whitesands
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE

/turf/closed/mineral/random/low_chance
	icon = 'whitesands/icons/turf/walls/whitesands/ws_walls.dmi'
	turf_type = /turf/open/misc/asteroid/whitesands
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	initial_gas_mix = WHITESANDS_ATMOS
	defer_change = TRUE
