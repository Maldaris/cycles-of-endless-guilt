/datum/id_trim/job/brig_phys
	assignment = "Brig Physician"
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_MEDICAL_DOCTOR
	minimal_access = list(
		ACCESS_SECURITY,
		ACCESS_BRIG,
		ACCESS_COURT,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MORGUE,
		ACCESS_WEAPONS,
		ACCESS_MEDICAL
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOS,
		)
	job = /datum/job/brig_phys

/datum/job/brig_phys
	title = "Brig Physician"
	department_head = list("Head of Security", "Chief Medical Officer")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security and chief medical officer"
	minimal_player_age = 7
	exp_requirements = 300
	exp_granted_type = EXP_TYPE_CREW
	description = "Tends to the medical needs of officers and prisoners. You are not a security officer, do not do their job for them. However, you can help them if they need immediate assistance."

	outfit = /datum/outfit/job/brig_phys

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BRIG_PHYS

/datum/outfit/job/brig_phys
	name = "Brig Physician"
	jobtype = /datum/job/brig_phys

	belt = /obj/item/modular_computer/pda/medical
	ears = /obj/item/radio/headset/headset_medsec/alt
	uniform = /obj/item/clothing/under/rank/security/brig_phys
	alt_uniform = /obj/item/clothing/under/rank/medical/doctor/red
	shoes = /obj/item/clothing/shoes/sneakers/white
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	suit = /obj/item/clothing/suit/toggle/labcoat/brig_phys
	alt_suit = /obj/item/clothing/suit/armor/vest/security/brig_phys
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	suit_store = /obj/item/flashlight/pen
	l_hand = /obj/item/storage/medkit/regular
	head = /obj/item/clothing/head/soft/sec/brig_phys
	implants = list(/obj/item/implant/mindshield)


/datum/outfit/job/brig_phys/securitymedic
	name = "Brig Physician (Security Medic)"

	uniform = /obj/item/clothing/under/rank/security/brig_phys/security_medic
	suit = /obj/item/clothing/suit/toggle/labcoat/brig_phys
	suit_store = /obj/item/flashlight/pen
	alt_suit = null

/datum/outfit/job/brig_phys/executionsupervisor
	name = "Brig Physician (Execution Supervisor)"

	uniform = /obj/item/clothing/under/rank/security/brig_phys/security_medic
	suit = /obj/item/clothing/suit/toggle/labcoat/brig_phys
	l_pocket = /obj/item/reagent_containers/syringe
	alt_suit = null
