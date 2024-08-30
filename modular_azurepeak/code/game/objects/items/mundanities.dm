obj/item/mundane/puzzlebox/easy
	name = "wooden puzzle-box"
	desc = "A puzzle box."
	icon = 'modular_azurepeak/icons/obj/items/mundanities.dmi'
	icon_state = "wood_box"
	var/fluff_desc = pick("It, frankly, looks rather depressing.","I can see an engraving of Psydon sending the Comet Syon on the side.","Without doubt, this is rather befuddling.","It's dusty and boring.","Why do I want to play with this for hours?","I could probably sell this to a bored wizard.","It looks...sufficient.")

obj/item/mundane/puzzlebox/easy/Initialize()
	. = ..()
	desc += " [fluff_desc]"


obj/item/mundane/puzzlebox/attack_self(mob/user)
	var/alert = alert(user, "My fingers trace the outside of this box. It looks easy. Do I try to solve it? \n[usage_prompt]", "wooden puzzle-box", "Yes", "No")
		if(alert != "Yes")
			return
		if(do_after(user,20, target = src))
			if(user.STAINT > 9)
				to_chat(user, span_warning("I solve \the [src] fairly easily. It falls apart in my hands."))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "weak_puzzle", /datum/mood_event/puzzle_weak
				qdel(src)
			else
				to_chat(user, span_warning("I can't solve \the [src]. Befuddlingly, it falls apart before my eyes...!"))
				qdel(src)

obj/item/mundane/puzzlebox/medium
	name = "ebony puzzle-box"
	icon = 'modular_azurepeak/icons/obj/items/mundanities.dmi'
	icon_state = "ebon_box"

obj/item/mundane/puzzlebox/attack_self(mob/user)
	var/alert = alert(user, "My fingers trace the outside of this box. It looks easy. Do I try to solve it? \n[usage_prompt]", "wooden puzzle-box", "Yes", "No")
		if(alert != "Yes")
			return
		if(do_after(user,20, target = src))
			if(user.STAINT > 11)
				to_chat(user, span_warning("I solve \the [src] fairly easily. It falls apart in my hands. Junk."))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "medium_puzzle", /datum/mood_event/puzzle_medium
				qdel(src)
			else
				to_chat(user, span_warning("I can't solve \the [src]. Befuddlingly, it falls apart before my eyes...!"))
				qdel(src)


