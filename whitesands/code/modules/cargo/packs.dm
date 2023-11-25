//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Deepcore /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/materials/deepcore_drill
	name = "Deep Core Mining Drill Crate"
	desc = "Contains three Deep Core Mining Drills to boost your productivity."
	cost = 3000
	contains = list(/obj/item/deepcorecapsule,
					/obj/item/deepcorecapsule,
					/obj/item/deepcorecapsule)
	crate_name = "deep core drill crate"

/datum/supply_pack/materials/deepcore_logi
	name = "Deep Core Mining Logistics Crate"
	desc = "Contains the logistics systems needed to run your Deep Core Mining Drills. Some assembly required."
	cost = 5000
	contains = list(/obj/machinery/deepcore/hopper,
					/obj/item/multitool,
					/obj/item/circuitboard/machine/deepcore/hub,
					/obj/item/stock_parts/capacitor,
					/obj/item/stock_parts/micro_laser,
					/obj/item/stock_parts/micro_laser,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/servo,
					/obj/item/stock_parts/servo)
	crate_name = "deep core logi crate"

//////////////////////////////////////////////////////////////////////////////
/////////////////////////// Overmap Shuttles /////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/engineering/shuttle_in_a_box
	name = "Shuttle in a Box"
	desc = "The bare minimum amount of machine and computer boards required to create a working spacecraft."
	cost = 8000
	contains = list(
		/obj/item/circuitboard/computer/shuttle/docker,
		/obj/item/circuitboard/computer/shuttle/helm,
		/obj/item/circuitboard/machine/shuttle/smes,
		/obj/item/circuitboard/machine/shuttle/engine/electric
	)
	crate_name = "Shuttle in a Box"

/datum/supply_pack/engineering/shuttle_designator
	name = "Shuttle Designator"
	desc = "A tool used to create spacecraft from scratch, used for defining areas and linking consoles."
	cost = 5000
	contains = list(/obj/item/shuttle_creator)
	crate_name = "Shuttle Designator"
