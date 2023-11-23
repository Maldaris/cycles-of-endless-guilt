//-----------------------------------------------
//--------------Engine Heaters-------------------
//This uses atmospherics, much like a thermomachine,
//but instead of changing temp, it stores plasma and uses
//it for the engine.
//-----------------------------------------------
/datum/armor/shuttle_heater_armor
	energy = 100
	bio = 100
	fire = 100
	acid = 50

/obj/machinery/atmospherics/components/unary/shuttle
	name = "shuttle atmospherics device"
	desc = "This does something to do with shuttle atmospherics"
	icon_state = "heater"
	icon = 'whitesands/icons/obj/shuttle.dmi'

/obj/machinery/atmospherics/components/unary/shuttle/heater
	name = "engine heater"
	desc = "Directs energy into compressed particles in order to power an attached thruster."
	icon_state = "heater_pipe"
	var/icon_state_closed = "heater_pipe"
	var/icon_state_open = "heater_pipe_open"
	idle_power_usage = 50
	circuit = /obj/item/circuitboard/machine/shuttle/heater

	density = TRUE
	max_integrity = 400
	armor_type = /datum/armor/shuttle_heater_armor
	layer = OBJ_LAYER
	showpipe = TRUE

	pipe_flags = PIPING_ONE_PER_TURF | PIPING_DEFAULT_LAYER_ONLY

	var/efficiency_multiplier = 1
	var/gas_capacity = 0
	///Whether or not to draw from the attached internals tank
	var/use_tank = FALSE
	///The internals tank to draw from
	var/obj/item/tank/fuel_tank

/obj/machinery/atmospherics/components/unary/shuttle/heater/New()
	. = ..()
	GLOB.custom_shuttle_machines += src
	set_init_directions()
	update_adjacent_engines()
	update_gas_stats()

/obj/machinery/atmospherics/components/unary/shuttle/heater/Destroy()
	. = ..()
	update_adjacent_engines()
	GLOB.custom_shuttle_machines -= src

/obj/machinery/atmospherics/components/unary/shuttle/heater/on_construction()
	..(dir, dir)
	set_init_directions()
	update_adjacent_engines()

/obj/machinery/atmospherics/components/unary/shuttle/heater/default_change_direction_wrench(mob/user, obj/item/I)
	if(!..())
		return FALSE
	set_init_directions()
	var/obj/machinery/atmospherics/node = nodes[1]
	if(node)
		node.disconnect(src)
		nodes[1] = null
	if(!parents[1])
		return
	nullify_pipenet(parents[1])

	atmos_init()
	node = nodes[1]
	if(node)
		node.atmos_init()
		node.add_member(src)
	SSair.add_to_rebuild_queue(src)
	return TRUE

/obj/machinery/atmospherics/components/unary/shuttle/heater/refresh_parts()
	var/cap = 0
	var/eff = 0
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		cap += M.rating
	for(var/obj/item/stock_parts/micro_laser/L in component_parts)
		eff += L.rating
	gas_capacity = 5000 * ((cap - 1) ** 2) + 1000
	efficiency_multiplier = round(((eff / 2) / 2.8) ** 2, 0.1)
	update_gas_stats()

/obj/machinery/atmospherics/components/unary/shuttle/heater/examine(mob/user)
	. = ..()
	. += "It looks like the fuel source can be toggled with an alt-click."
	. += "The engine heater's gas dial reads [return_gas()] moles of gas.<br>"

/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/return_gas(datum/gas/gas_type)
	var/datum/gas_mixture/air_contents = use_tank ? fuel_tank?.air_contents : airs[1]
	if(!air_contents)
		return
	if(gas_type)
		return air_contents.gases[gas_type][MOLES]
	else
		return air_contents.total_moles()

/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/return_gas_capacity()
	var/datum/gas_mixture/air_contents = use_tank ? fuel_tank?.air_contents : airs[1]
	if(!air_contents)
		return
	return air_contents.return_volume()

/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/update_gas_stats()
	var/datum/gas_mixture/air_contents = use_tank ? fuel_tank?.air_contents : airs[1]
	if(!air_contents)
		return
	air_contents.volume = gas_capacity;
	air_contents.temperature = T20C;

/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/has_fuel(required, datum/gas/gas_type)
	var/datum/gas_mixture/air_contents = use_tank ? fuel_tank?.air_contents : airs[1]
	if(!air_contents)
		return
	return air_contents.gases[gas_type][MOLES] >= required

/**
  * Burns a specific amount of one type of gas. Returns how much was actually used.
  * * amount - The amount of mols of fuel to burn.
  * * gas_type - The gas type to burn.
  */
/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/consume_fuel(amount, datum/gas/gas_type)
	var/datum/gas_mixture/air_contents = use_tank ? fuel_tank?.air_contents : airs[1]
	if(!air_contents)
		return
	if(!gas_type)
		var/datum/gas_mixture/removed = air_contents.remove(amount)
		return removed.return_volume()
	else
		var/starting_amt = air_contents.gases[gas_type][MOLES]
		air_contents.gases[gas_type][MOLES] -= amount
		return min(starting_amt, amount)

/obj/machinery/atmospherics/components/unary/shuttle/heater/attackby(obj/item/I, mob/living/user, params)
	update_adjacent_engines()
	if(default_deconstruction_screwdriver(user, icon_state_open, icon_state_closed, I))
		return
	if(default_pry_open(I))
		return
	if(panel_open)
		if(default_change_direction_wrench(user, I))
			return
	if(default_deconstruction_crowbar(I))
		return
	if(istype(I, /obj/item/tank/internals))
		user.transferItemToLoc(I, src)
		fuel_tank = I
	return ..()

/obj/machinery/atmospherics/components/unary/shuttle/heater/AltClick(mob/living/L)
	. = ..()
	if(panel_open)
		return
	use_tank = !use_tank
	to_chat(L, "<span class='notice'>You switch [src] to draw fuel from [use_tank ? "the attached tank" : "the atmospherics system"].")
	icon_state_closed = use_tank ? "heater" : initial(icon_state)
	icon_state_open = use_tank ? "heater_open" : "[initial(icon_state)]_open"

/obj/machinery/atmospherics/components/unary/shuttle/heater/proc/update_adjacent_engines()
	var/engine_turf
	switch(dir)
		if(NORTH)
			engine_turf = get_offset_target_turf(src, 0, -1)
		if(SOUTH)
			engine_turf = get_offset_target_turf(src, 0, 1)
		if(EAST)
			engine_turf = get_offset_target_turf(src, -1, 0)
		if(WEST)
			engine_turf = get_offset_target_turf(src, 1, 0)
	if(!engine_turf)
		return
	for(var/obj/machinery/power/shuttle/engine/E in engine_turf)
		E.update_icon_state()

/obj/machinery/atmospherics/components/unary/shuttle/heater/tank/Initialize()
	. = ..()
	fuel_tank = new /obj/item/tank/internals/plasma/full(src)
	use_tank = TRUE
