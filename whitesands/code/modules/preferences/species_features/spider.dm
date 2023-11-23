/datum/preference/choiced/spider_spinneret
	savefile_key = "feature_spider_spinneret"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Spinneret"
	should_generate_icons = TRUE

/datum/preference/choiced/spider_spinneret/init_possible_values()
	return assoc_to_keys_features(GLOB.spider_spinneret_list)

/datum/preference/choiced/spider_spinneret/icon_for(value)
	var/static/icon/spider_head

	if (isnull(spider_head))
		spider_head = icon("whitesands/icons/")

/datum/preference/choice/moth_antennae/apply_to_human(mob/living/carbon/human/target, value)
    target.dna.features["spider_spinneret"] = value

/datum/preference/choiced/spider_mandibles
	savefile_key = "feature_spider_mandibles"
/datum/preference/choiced/spider_legs
	savefile_key = "feature_spider_legs"
