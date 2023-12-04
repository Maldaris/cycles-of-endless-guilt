GLOBAL_LIST_INIT(spider_first, world.file2list("strings/names/spider_first.txt"))
GLOBAL_LIST_INIT(spider_last, world.file2list("strings/names/spider_last.txt"))

/obj/item/organ/internal/eyes/night_vision/spider
	name = "spider eyes"
	desc = "These eyes seem to have increased sensitivity to bright light, offset by basic night vision."
	low_light_cutoff = list(35, 20, 35)
	flash_protect = FLASH_PROTECTION_SENSITIVE

// These eyes should only have setting so we can treat it as an on/off toggle instead of 3-stage.
/obj/item/organ/internal/eyes/night_vision/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(light_level)
		if (FALSE)
			color_cutoffs = low_light_cutoff.Copy()
			light_level = TRUE
		else
			color_cutoffs = null
			light_level = FALSE
	owner.update_sight()


/obj/item/organ/internal/tongue/spider
	name = "inner mandible"
	desc = "A set of soft, spoon-esque mandibles closer to the mouth opening, that allow for basic speech, and the ability to speak Rachnidian."
	say_mod = "chitters"
	liked_foodtypes = MEAT | RAW
	disliked_foodtypes = FRUIT | GROSS
	toxic_foodtypes = VEGETABLES | DAIRY | CLOTH

/obj/item/organ/internal/tongue/spider/get_possible_languages()
	. = ..()
	. += /datum/language/spider
	. += /datum/language/buzzwords

/obj/item/food/meat/slab/human/mutant/spider
	icon_state = "spidermeat"
	desc = "The stringy meat jokes have been done to death, just like this Arachnid."
	food_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("meat" = 3, "stringy" = 1)
	foodtypes = MEAT | RAW | TOXIC

/obj/item/food/meat/slab/human/mutant/spider/Initialize()
	. = .. ()
	var/mutable_appearance/filling = mutable_appearance(icon, "rawcutlet_coloration")
	filling.color = "#00FFFF"
	add_overlay(filling)

/datum/language_holder/spider/arachnid
	understood_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/buzzwords = list(LANGUAGE_SPECIES),
		/datum/language/spider = list(LANGUAGE_SPECIES)
	)
	spoken_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/buzzwords = list(LANGUAGE_SPECIES),
		/datum/language/spider = list(LANGUAGE_SPECIES)
	)
	blocked_languages = null

/datum/species/spider
	name = "Arachnid"
	id = "rachnid"
	sexes = FALSE
	inherent_traits  = list(TRAIT_NO_UNDERWEAR, TRAIT_WEB_SURFER)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BUG
	external_organs = list(
		/obj/item/organ/external/spider/mandibles = "Plain",
		/obj/item/organ/external/spider/spinneret = "Plain",
		/obj/item/organ/external/spider/legs = "Plain"
	)
	meat = /obj/item/food/meat/slab/human/mutant/spider

	mutanteyes = /obj/item/organ/internal/eyes/night_vision/spider
	mutanttongue =	/obj/item/organ/internal/tongue/spider
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/spider/arachnid

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/spider,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/spider,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/spider,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/spider,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/spider,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/spider,
	)

	var/web_cooldown = 30
	var/web_ready = TRUE
	var/spinner_rate = 75

/proc/random_unique_spider_name(attempts_to_find_unique_name=10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(pick(GLOB.spider_first)) + " " + capitalize(pick(GLOB.spider_last))

		if(!findname(.))
			break

/proc/spider_name()
	return "[pick(GLOB.spider_first)] [pick(GLOB.spider_last)]"

/datum/species/spider/get_species_description()
	return "A competitive species, evolved to enjoy working, Arachnids make up a small yet rapidly growing space in Nanotrasen’s workforce. \
		Seen as valued assets due to their hard working tendencies, they are commonly found on stations near independent Arachnid civilizations."

/datum/species/spider/get_species_lore()
	return list(
		"While their males are well integrated into NT's station crews, the females are voracious and dominant, and some have willfully resisted integration (with deadly consequences).",
		"Arachnnid nests are fiercely hierarchical, and thus Arachnids carefully mind their station and status compared to other Arachnids. Competition is \
		not only common, but encouraged, as it tends to bring wealth and opportunity to the nest. On the flip side, Arachnids will hunt down and \
		punish those in their nest who violate their trust, and put the nest in danger.",
		"The last few decades of Arachnid presence on NT stations has created a fracturing of Arachnid culture, between those who want to integrate completely with human culture,\
		and those who want to keep to themselves and the old ways. The debate rages hotly and likely won't be resolved without some strong leader to galvanize them one way or the other."
	)

/datum/species/spider/get_physical_attributes()
	return "Arachnids have a large spinneret capable of creating webs and cocooning objects (or people). \
	Their eyes are very sensitive, but have basic night vision capabilities."

/datum/species/spider/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "spider",
			SPECIES_PERK_NAME = "Web-making Spinneret",
			SPECIES_PERK_DESC = "Arachnids have a large spinneret that can create webs and cocoon objects (or people!)."
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
            SPECIES_PERK_ICON = "eye",
            SPECIES_PERK_NAME = "Natural Night-vision",
			SPECIES_PERK_DESC = "Arachnids have natural night-vision capabilities, though weaker than most technical forms."
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
            SPECIES_PERK_ICON = "lightbulb",
            SPECIES_PERK_NAME = "Strong Light Sensitivity",
			SPECIES_PERK_DESC = "Arachnid night vision makes being flashed or blinded a much more painful and dangerous prospect."
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
            SPECIES_PERK_ICON = "bone",
            SPECIES_PERK_NAME = "Dietary Restrictions (Carnivore)",
			SPECIES_PERK_DESC = "Arachnids haven't adapted to the diets of the other omnivores on the station, still prefering meat.\
			What qualifies as edible meat is broader than most however."
		)
	)

	return to_add

/datum/species/spider/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_spider_name()

	var/randname = spider_name()

	if(lastname)
		randname += " [lastname]"

	return randname

/datum/species/spider/proc/damage_weakness(datum/source, list/damage_mods, damage_amount, damagetype, def_zone, sharpness, attack_direction, obj/item/attacking_item)
	SIGNAL_HANDLER

	if(istype(attacking_item, /obj/item/melee/flyswatter))
		damage_mods += 10 // Yes, a 10x damage modifier


/datum/species/spider/handle_chemical(datum/reagent/chem, mob/living/carbon/human/H)
	. = ..()
	if(chem.type == /datum/reagent/toxin/pestkiller)
		H.adjustToxLoss(3)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM)

/mob/living/carbon/human/species/spider
	race = /datum/species/spider

/datum/species/spider/on_species_gain(mob/living/carbon/human/H, datum/species/old_species)
	. = ..()
	var/datum/action/innate/spin_web/SW = new
	var/datum/action/innate/spin_cocoon/SC = new
	SC.Grant(H)
	SW.Grant(H)
	RegisterSignal(H, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS, PROC_REF(damage_weakness))

/datum/species/spider/on_species_loss(mob/living/carbon/human/H)
	. = ..()
	var/datum/action/innate/spin_web/SW = locate(/datum/action/innate/spin_web) in H.actions
	var/datum/action/innate/spin_cocoon/SC = locate(/datum/action/innate/spin_cocoon) in H.actions
	SC?.Remove(H)
	SW?.Remove(H)
	UnregisterSignal(H, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS)

/datum/action/innate/spin_web
    name = "Spin Web"
    check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_CONSCIOUS
    button_icon = 'icons/mob/actions/actions_animal.dmi'
    button_icon_state = "lay_web"

/datum/action/innate/spin_cocoon
	name = "Spin Cocoon"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_CONSCIOUS
	button_icon = 'icons/mob/actions/actions_animal.dmi'
	button_icon_state = "wrap_0"

/datum/action/innate/spin_web/Activate()
	var/mob/living/carbon/human/species/spider/H = owner
	var/datum/species/spider/E = H.dna.species
	if(H.stat == "DEAD")
		return
	if(E.web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
		return
	var/turf/T = get_turf(H)
	if(!T)
		to_chat(H, "<span class='warning'>There's no room to spin your web here!</span>")
		return
	var/obj/structure/spider/stickyweb/W = locate() in T
	var/obj/structure/spider_player/W2 = locate() in T
	if(W || W2)
		to_chat(H, "<span class='warning'>There's already a web here!</span>")
		return
	 // Should have some minimum amount of food before trying to activate
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition >= nutrition_threshold)
		to_chat(H, "<i>You begin spinning some web...</i>")
		if(!do_after(H, 10 SECONDS, T, progress = TRUE))
			to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
			return
		if(prob(75))
			H.adjust_nutrition(-E.spinner_rate)
			addtimer(VARSET_CALLBACK(E, web_ready, TRUE), E.web_cooldown)
			to_chat(H, "<i>You use up a fair amount of energy spinning the web.</i>")
		new /obj/structure/spider_player(T, owner)
		to_chat(H, "<i>You weave a web on the ground with your spinneret!</i>")

	else
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return
/*
	This took me far too long to figure out so I'm gonna document it here.
	1) Create an innate action for the species
	2) Have that action trigger a RegisterSignal for mob clicking
	3) Trigger the cocoonAtom proc on that signal
	4) Validate the target then start spinning
	5) if you're not interrupted, force move the target to the cocoon created at their location.
*/
/datum/action/innate/spin_cocoon/Activate()
	var/mob/living/carbon/human/species/spider/H = owner
	var/datum/species/spider/E = H.dna.species
	if(H.stat == "DEAD")
		return
	if(E.web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
		return
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition >= nutrition_threshold)
		to_chat(H, "<span class='warning'>You pull out a strand from your spinneret, ready to wrap a target. <BR>\
		 (Press ALT+CLICK or MMB on the target to start wrapping.)</span>")
		H.adjust_nutrition(E.spinner_rate * -0.5)
		addtimer(VARSET_CALLBACK(E, web_ready, TRUE), E.web_cooldown)
		RegisterSignals(H, list(COMSIG_MOB_MIDDLECLICKON, COMSIG_MOB_ALTCLICKON), .proc/cocoonAtom)
		return
	else
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return

/datum/action/innate/spin_cocoon/proc/cocoonAtom(mob/living/carbon/human/species/spider/H, atom/movable/A)
	UnregisterSignal(H, list(COMSIG_MOB_MIDDLECLICKON, COMSIG_MOB_ALTCLICKON))
	var/datum/species/spider/E = H.dna.species
	if (!H || !isspiderperson(H))
		return COMSIG_MOB_CANCEL_CLICKON
	else
		if(E.web_ready == FALSE)
			to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
			return
		if(!H.Adjacent(A))	//No.
			return
		if(!isliving(A) && A.anchored)
			to_chat(H, "<span class='warning'>[A] is bolted to the floor!</span>")
			return
		if(istype(A, /obj/structure/spider_player))
			to_chat(H, "<span class='warning'>No double wrapping.</span>")
			return
		if(istype(A, /obj/effect))
			to_chat(H, "<span class='warning'>You cannot wrap this.</span>")
			return
		H.visible_message("<span class='danger'>[H] starts to wrap [A] into a cocoon!</span>","<span class='warning'>You start to wrap [A] into a cocoon.</span>")
		if(!do_after(H, 10 SECONDS, A, progress = TRUE))
			to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
			return
		H.adjust_nutrition(E.spinner_rate * -3)
		var/obj/structure/spider_player/cocoon/C = new(A.loc)
		if(isliving(A))
			C.icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a large cocoon!</span>")
			return
		else
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a cocoon!</span>")
			return

/datum/reagent/mutationtoxin/arachnid
	name = "Arachnid Mutation Toxin"
	description = "A glowing toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/spider
	taste_description = "silk"

/datum/chemical_reaction/mutationtoxin/arachnid
	results = list(/datum/reagent/mutationtoxin/arachnid = 1)
	required_reagents = list(
		/datum/reagent/mutationtoxin/unstable = 1,
		/datum/reagent/toxin/heparin = 10
	)
