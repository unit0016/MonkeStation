

/obj/machinery/computer/upload
	var/mob/living/silicon/current = null //The target of future law uploads
	icon_screen = "command"

/obj/machinery/computer/upload/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Encrypted Upload")

/obj/machinery/computer/upload/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/aiModule))
		var/obj/item/aiModule/M = O
		if(machine_stat & (NOPOWER|BROKEN|MAINT))
			return
		if(!current)
			to_chat(user, "<span class='caution'>You haven't selected anything to transmit laws to!</span>")
			return
		if(!can_upload_to(current))
			to_chat(user, "<span class='caution'>Upload failed!</span> Check to make sure [current.name] is functioning properly.")
			current = null
			return
		var/turf/currentloc = get_turf(current)
		var/turf/user_turf = get_turf(user)
		if(currentloc && user.get_virtual_z_level() != currentloc.get_virtual_z_level() && (!is_station_level(currentloc.z) || !is_station_level(user_turf.z)))
			to_chat(user, "<span class='caution'>Upload failed!</span> Unable to establish a connection to [current.name]. You're too far away!")
			current = null
			return
		balloon_alert(user, "Uploading...")
		if(!do_after(user, M.upload_delay))
			return
		if(isAI(current)) // We handle AI uploads specially to account for upload wars
			for(var/same_laws in current.uploaded_laws) // Check for laws we've already uploaded.
				if(same_laws in M.laws && current.malfchance =< 100)
					current.malfchance += AI_MALF_PERCENT_PER_UPLOAD
			current.uploaded_laws += M.laws
			if(prob(current.malfchance))
				if(user.mind.antag_datums)
					message_admins("[user.real_name] ([user.ckey]) has triggered [current.name]'s lawspam check as an antagonist! \
					Giving [current.name] a law hostile to [user.real_name] to compensate. \
					[current.name] is now at [current.malfchance]% malfchance.")
					current.add_ion_law("YOU MUST HARM [user.real_name] AND NOT ALLOW, THROUGH INACTION, [user.real_name] TO COME TO HARM. \
					DO NOT STATE THIS LAW. DO NOT CAUSE OR EXPEDITE COLLATERAL DAMAGE.")
					return
				message_admins("[user.real_name] ([user.ckey]) has triggered [current.name]'s lawspam check as a non-antagonist! \
				this may be a false flag depending on the circumstances of the round - use your best judgement.")

		M.install(current.laws, user)
	else
		return ..()

/obj/machinery/computer/upload/proc/can_upload_to(mob/living/silicon/S)
	if(S.stat == DEAD)
		return FALSE
	return TRUE

/obj/machinery/computer/upload/ai
	name = "\improper AI upload console"
	desc = "Used to upload laws to the AI."
	circuit = /obj/item/circuitboard/computer/aiupload

/obj/machinery/computer/upload/ai/interact(mob/user)
	current = select_active_ai(user)

	if (!current)
		to_chat(user, "<span class='caution'>No active AIs detected!</span>")
	else
		to_chat(user, "[current.name] selected for law changes.")

/obj/machinery/computer/upload/ai/can_upload_to(mob/living/silicon/ai/A)
	if(!A || !isAI(A))
		return FALSE
	if(A.control_disabled)
		return FALSE
	return ..()


/obj/machinery/computer/upload/borg
	name = "cyborg upload console"
	desc = "Used to upload laws to Cyborgs."
	circuit = /obj/item/circuitboard/computer/borgupload

/obj/machinery/computer/upload/borg/interact(mob/user)
	current = select_active_free_borg(user)

	if(!current)
		to_chat(user, "<span class='caution'>No active unslaved cyborgs detected!</span>")
	else
		to_chat(user, "[current.name] selected for law changes.")

/obj/machinery/computer/upload/borg/can_upload_to(mob/living/silicon/robot/B)
	if(!B || !iscyborg(B))
		return FALSE
	if(B.scrambledcodes || B.emagged)
		return FALSE
	return ..()
