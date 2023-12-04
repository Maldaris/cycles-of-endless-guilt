/obj/item/organ/external/spider/spinneret
	name = "spider spinneret"
	desc = "Junk in the trunk, used to make webs"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_SPINNERET

	preference = "feature_spider_spinneret"

	bodypart_overlay = /datum/bodypart_overlay/mutant/spider/spinneret

	dna_block = DNA_SPIDER_SPINNERET_BLOCK

/datum/bodypart_overlay/mutant/spider/spinneret
	feature_key = "spider_spinneret"
	layers = EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/spider/spinneret/get_global_feature_list()
	return GLOB.spider_spinneret_list

/obj/item/organ/external/spider/legs
	name = "spider legs"
	desc = "All the better to skitter with"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_EXTRA_LEGS

	preference = "feature_spider_legs"

	bodypart_overlay = /datum/bodypart_overlay/mutant/spider/legs

	dna_block = DNA_SPIDER_LEG_BLOCK

/datum/bodypart_overlay/mutant/spider/legs
	feature_key = "spider_legs"
	layers = EXTERNAL_BEHIND | EXTERNAL_ADJACENT

/datum/bodypart_overlay/mutant/spider/legs/get_global_feature_list()
	return GLOB.spider_legs_list

/obj/item/organ/external/spider/mandibles
	name = "spider mandibles"
	desc = "For when jaws aren't an option"

	preference = "feature_spider_mandibles"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_MANDIBLES

	bodypart_overlay = /datum/bodypart_overlay/mutant/spider/mandibles

	dna_block = DNA_SPIDER_MANDIBLE_BLOCK

/datum/bodypart_overlay/mutant/spider/mandibles
	feature_key = "spider_mandibles"
	layers = EXTERNAL_FRONT // We've got front in the sprites, but snouts are adjacent?

/datum/bodypart_overlay/mutant/spider/mandibles/get_global_feature_list()
	return GLOB.spider_mandibles_list
