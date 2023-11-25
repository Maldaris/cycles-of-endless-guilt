/*
SolGov Representative
*/

/datum/job/solgov
	title = "SolGov Representative"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Captain, SolGov, and Space Law"
	description = "Monitor the station and ensure the security team and command staff are abiding by space law. Report any misbehaviour to SolGov."
	minimal_player_age = 7
	exp_requirements = 180

	outfit = /datum/outfit/job/solgov

	display_order = JOB_DISPLAY_ORDER_SOLGOV

/datum/outfit/job/solgov
	name = "SolGov Representative"
	jobtype = /datum/job/solgov

	id = /obj/item/card/id/advanced/silver
	head = /obj/item/clothing/head/solgov
	uniform = /obj/item/clothing/under/solgov/formal
	accessory = /obj/item/clothing/accessory/waistcoat/solgov
	suit = /obj/item/clothing/suit/toggle/solgov
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/solgov
	glasses = /obj/item/clothing/glasses/sunglasses
	belt = /obj/item/modular_computer/pda/solgov

	implants = list(/obj/item/implant/mindshield)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain

	backpack_contents = list(
		/obj/item/knife/letter_opener = 1
	)
