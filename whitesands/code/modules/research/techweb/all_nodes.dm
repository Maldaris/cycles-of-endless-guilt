/////////////////////////shuttle tech/////////////////////////
/datum/techweb_node/basic_shuttle_tech
	id = "basic_shuttle"
	display_name = "Basic Shuttle Research"
	description = "Research the technology required to create and use basic shuttles."
	prereq_ids = list("bluespace_travel", "adv_engi")
	design_ids = list("shuttle_creator", "engine_plasma", "engine_ion", "engine_heater", "engine_smes", "shuttle_docker", "shuttle_helm")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)

/datum/techweb_node/exp_shuttle_tech
	id = "exp_shuttle"
	display_name = "Experimental Shuttle Research"
	description = "A bunch of engines and related shuttle parts that are likely not really that useful, but could be in strange situations."
	prereq_ids = list("basic_shuttle")
	design_ids = list("engine_expulsion")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)


////////////////////// Deepcore ///////////////////////

/datum/techweb_node/deepcore
	id = "deepcore"
	display_name = "Deepcore Mining"
	description = "Mining, but automated."
	prereq_ids = list("basic_mining")
	design_ids = list("deepcore_drill", "deepcore_hopper", "deepcore_hub")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
