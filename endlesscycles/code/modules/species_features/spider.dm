/datum/preference/choiced/spider_spinneret
	savefile_key = "feature_spider_spinneret"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Spinneret"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/spider/spinneret

/datum/preference/choiced/spider_spinneret/init_possible_values()
	return assoc_to_keys_features(GLOB.spider_spinneret_list)

/datum/preference/choiced/spider_spinneret/apply_to_human(mob/living/carbon/human/target, value)
    target.dna.features["spider_spinneret"] = value

/datum/preference/choiced/spider_spinneret/icon_for(value)
	var/datum/sprite_accessory/spider_spinneret = GLOB.spider_spinneret_list[value]
	var/icon/final_icon = icon(
		spider_spinneret.icon,
		"m_spider_spinneret_[spider_spinneret.icon_state]_FRONT",
		NORTH
		)
	return final_icon

/datum/preference/choiced/spider_mandibles
	savefile_key = "feature_spider_mandibles"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Mandibles"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/spider/mandibles

/datum/preference/choiced/spider_mandibles/init_possible_values()
	return assoc_to_keys_features(GLOB.spider_mandibles_list)

/datum/preference/choiced/spider_mandibles/apply_to_human(mob/living/carbon/human/target, value)
    target.dna.features["spider_mandibles"] = value

/datum/preference/choiced/spider_mandibles/icon_for(value)
	var/static/icon/spider_head

	if (isnull(spider_head))
		spider_head = icon('whitesands/icons/mob/spider_parts.dmi', "rachnid_head")

	var/datum/sprite_accessory/mandible = GLOB.spider_mandibles_list[value]

	var/icon/icon_with_mandible = new(spider_head)
	icon_with_mandible.Blend(icon(mandible.icon, "m_spider_mandibles_[mandible.icon_state]_FRONT"), ICON_OVERLAY)
	icon_with_mandible.Scale(64, 64)
	icon_with_mandible.Crop(15, 64, 15 + 31, 64 - 31)

	return icon_with_mandible

/datum/preference/choiced/spider_legs
	savefile_key = "feature_spider_legs"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Legs"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/spider/legs

/datum/preference/choiced/spider_legs/init_possible_values()
	return assoc_to_keys_features(GLOB.spider_legs_list)

/datum/preference/choiced/spider_legs/apply_to_human(mob/living/carbon/human/target, value)
    target.dna.features["spider_legs"] = value

/datum/preference/choiced/spider_legs/icon_for(value)
	var/datum/sprite_accessory/spider_legs = GLOB.spider_legs_list[value]
	var/icon/final_icon = icon(spider_legs.icon, "m_spider_legs_[spider_legs.icon_state]_BEHIND")
	return final_icon
