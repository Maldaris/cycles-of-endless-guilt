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

	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	// req_admin_notify = 1
	minimal_player_age = 10
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SERVICE
	exp_granted_type = EXP_TYPE_CREW
	faction = FACTION_STATION
	config_tag = "SOLGOV_REPRESENTATIVE"

	outfit = /datum/outfit/job/solgov
	plasmaman_outfit = /datum/outfit/plasmaman/solgov
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SOLGOV)
	departments_list = list(
		/datum/job_department/service,
		/datum/job_department/command,
	)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SRV
	bounty_types = CIV_JOB_RANDOM

	display_order = JOB_DISPLAY_ORDER_SOLGOV

	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS

/datum/outfit/job/solgov
	name = "SolGov Representative"
	jobtype = /datum/job/solgov

	id = /obj/item/card/id/advanced/silver
	id_trim = /datum/id_trim/job/solgov
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

/datum/outfit/plasmaman/solgov //WS edit sgr
	name = "Plasmasolgov"
	head = /obj/item/clothing/head/helmet/space/plasmaman/solgov
	uniform = /obj/item/clothing/under/plasmaman/solgov
	gloves = /obj/item/clothing/gloves/color/plasmaman/white

/datum/id_trim/job/solgov
	job = /datum/job/solgov
	assignment = "SolGov Representative"
	intern_alt_name = "SolGov Bureaucratic Intern"
	trim_state = "trim_securityofficer" // TODO: Make a Solgov Trim
	department_color = COLOR_SOLGOV
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_SOLGOV_REPRESENTATIVE
	minimal_access = list(
		ACCESS_SOLGOV,
		ACCESS_COMMAND,
		ACCESS_COURT,
		ACCESS_RC_ANNOUNCE
	)
	extra_access = list(
		ACCESS_AI_UPLOAD,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_TELEPORTER,
		ACCESS_MAINT_TUNNELS,
	)
	// Nobody should be able to make a SolGov Rep
	template_access = list()
