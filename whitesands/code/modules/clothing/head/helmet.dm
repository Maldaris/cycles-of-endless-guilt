/obj/item/clothing/head/helmet/solgov
	name = "\improper SolGov Helmet"
	desc = "A helmet manufactured by SolGov to protect craniums. Painted in green to provide some degree of camoflauge."
	icon_state = "helmet_terragov"
	inhand_icon_state = "helmet_terragov"
	// can_flashlight = FALSE // Probably fine to let this be sec-lite mountable... right?
	dog_fashion = null
	icon = 'whitesands/icons/obj/clothing/hats.dmi'
	worn_icon = 'whitesands/icons/mob/clothing/head.dmi'

/datum/armor/cap_solgov
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	fire = 30
	acid = 60

/obj/item/clothing/head/solgov
	name = "\improper SolGov officer's cap"
	desc = "A blue cap worn by high-ranking officers of SolGov."
	armor_type = /datum/armor/cap_solgov
	icon_state = "cap_solgov"
	inhand_icon_state = "cap_solgov"
	strip_delay = 80
	icon = 'whitesands/icons/obj/clothing/hats.dmi'
	worn_icon = 'whitesands/icons/mob/clothing/head.dmi'

/obj/item/clothing/head/solgov/terragov
	name = "\improper TerraGov officer's cap"
	desc = "A cap worn by high-ranking officers of SolGov. This one is still in original TerraGov green."
	armor_type = /datum/armor/cap_solgov
	icon_state = "cap_terragov"
	inhand_icon_state = "cap_terragov"

/obj/item/clothing/head/helmet/space/plasmaman/solgov
	name = "SolGov envirosuit helmet"
	desc = "A generic white envirohelmet with a secondary blue."
	icon_state = "solgov_envirohelm"
	inhand_icon_state = "solgov_envirohelm"
