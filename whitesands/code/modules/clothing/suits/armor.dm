/obj/item/clothing/suit/armor/vest/solgov
	name = "\improper SolGov armor vest"
	desc = "A standard armor vest fielded for SolGov's infantry."
	icon_state = "armor_solgov"
	inhand_icon_state = "armor_solgov"
	icon = 'whitesands/icons/obj/clothing/suits.dmi'
	worn_icon = 'whitesands/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/solgov/Initialize()
	. = ..()
	allowed |= list(/obj/item/gun/energy/laser/terra, /obj/item/gun/energy/pulse/terra)

/obj/item/clothing/suit/armor/vest/solgov/rep
	name = "\improper SolGov Inspector armor vest"
	desc = "A type I armor vest emblazoned with the SolGov logo."
	icon_state = "armor_alt_solgov"

/obj/item/clothing/suit/armor/vest/hop
	name = "head of personnel's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon = 'whitesands/icons/obj/clothing/suits.dmi'
	worn_icon = 'whitesands/icons/mob/clothing/suits.dmi'
	icon_state = "hopformal"
	inhand_icon_state = "capspacesuit"
