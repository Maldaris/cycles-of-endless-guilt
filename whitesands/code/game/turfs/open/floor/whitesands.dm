/turf/open/misc/asteroid/whitesands
	name = "salted sand"
	baseturfs = /turf/open/misc/asteroid/whitesands
	icon = 'whitesands/icons/turf/floors/whitesands/ws_planet.dmi'
	icon_state = "sand"
	base_icon_state = "sand"
	planetary_atmos = TRUE
	initial_gas_mix = WHITESANDS_ATMOS //Fallback, and used to tell the AACs that this is the exterior
	dig_result = /obj/item/stack/ore/glass
	light_range = 2
	light_power = 0.6
	light_color = COLOR_VERY_LIGHT_GRAY

/turf/open/misc/asteroid/broken_states()
	if(initial(dug))
		return list(icon_state)
	return list("[base_icon_state]_dug")

/turf/open/misc/asteroid/whitesands/dried
	name = "dried sand"
	baseturfs = /turf/open/misc/asteroid/whitesands/dried
	icon_state = "dried_up"
	base_icon_state = "dried_up"
	dig_result = /obj/item/stack/ore/glass

/turf/open/misc/asteroid/whitesands/remove_air(amount)
	return return_air()

/turf/open/misc/grass/whitesands
	initial_gas_mix = WHITESANDS_ATMOS
