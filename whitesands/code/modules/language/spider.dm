/datum/language/spider
	name = "Rachnidian"
	desc = "A language that exploits the multiple limbs of spiders to do subtle dance like movements to communicate.\
	A proper speaker's movements are quick and sharp enough to make audible whiffs and thumps however, which are intelligible over the radio."
	key = "r"
	flags = NO_STUTTER
	icon = 'whitesands/icons/effects/language.dmi'
	icon_state = "spider"

/datum/language/spider/scramble(input)
	. = prob(65) ? "<i>wiff</i>" : "<i>thump</i>"
	. += (copytext(input, length(input)) == "?") ? "?" : "!"
