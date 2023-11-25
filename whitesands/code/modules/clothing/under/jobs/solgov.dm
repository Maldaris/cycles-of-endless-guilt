/datum/armor/under_solgov
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 5
	fire = 30
	acid = 30

/obj/item/clothing/under/solgov
	icon = 'whitesands/icons/obj/clothing/under/solgov.dmi'
	worn_icon = 'whitesands/icons/mob/clothing/under/solgov.dmi'
	icon_state = "fatigues"
	inhand_icon_state = "fatigues"
	name = "\improper SolGov fatigues"
	desc = "Standard combat uniform for SolGov's officers."
	armor_type = /datum/armor/under_solgov
	strip_delay = 50
	can_adjust = FALSE

/obj/item/clothing/under/solgov/elite
	name = "\improper SolGov elite jumpsuit"
	desc = "It's a jumpsuit for SolGov's elite officers. Designed to be comfortable in heavy armor."
	icon_state = "elite"
	inhand_icon_state = "elite"

/obj/item/clothing/under/solgov/formal
	name = "\improper SolGov formal uniform"
	desc = "A formal SolGov uniform, for special occasions."
	icon_state = "formal_solgov"
	inhand_icon_state = "formal_solgov"
	can_adjust = TRUE

/obj/item/clothing/under/solgov/formal/terragov
	name = "\improper TerraGov formal uniform"
	desc = "A formal SolGov uniform, for special occasions. This one is still colored in original TerraGov green."
	icon_state = "formal_terragov"
	inhand_icon_state = "formal_terragov"
	can_adjust = FALSE

/obj/item/clothing/under/plasmaman/solgov
	name = "SolGov envirosuit"
	desc = "Why the human centric government sent the science-fiction equivalent of a leper to this station is beyond me."
	icon_state = "plasma_solgov"
	inhand_icon_state = "plasma_solgov"
	can_adjust = FALSE
