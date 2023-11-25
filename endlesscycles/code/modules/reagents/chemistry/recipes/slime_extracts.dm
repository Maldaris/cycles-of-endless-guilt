/// Readds the Unstable Mutation toxin for Arachnid mutation

/datum/chemical_reaction/slime/unstabletoxin
	results = list(/datum/reagent/mutationtoxin/unstable = 1)
	required_reagents = list(/datum/reagent/uranium/radium = 1)
	required_other = TRUE
	required_container = /obj/item/slime_extract/green
