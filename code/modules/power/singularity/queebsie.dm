/obj/singularity/narsie/queebsie
	name = "Queeb'Sie's Avatar"
	icon = 'icons/obj/queebsie.dmi'
	desc = "Your mind begins to bubble and ooze as it tries to comprehend what it sees. You realize for some reason you want to buy Skyrim."
	pixel_x = -236
	pixel_y = -256
	current_size = 12
	grav_pull = 10
	consume_range = 12 //How many tiles out do we eat

/obj/singularity/narsie/queebsie/Initialize()
	. = ..()
	send_to_playing_players("<span class='narsie'>QUEEB'SIE HAS RISEN. BUY. SKYRIM.</span>")
	sound_to_playing_players('sound/creatures/narsie_rises.ogg')

	var/area/A = get_area(src)
	if(A)
		var/mutable_appearance/alert_overlay = mutable_appearance('icons/effects/cult_effects.dmi', "ghostalertsie")
		notify_ghosts("Queeb'Sie has risen in \the [A.name]. Reach out to the Geometer to be given a new shell for your soul.", source = src, alert_overlay = alert_overlay, action=NOTIFY_ATTACK)
	INVOKE_ASYNC(src, .proc/narsie_spawn_animation)

/obj/singularity/narsie/queebsie/acquire(atom/food)
	if(food == target)
		return
	to_chat(target, "<span class='cultsmall'>QUEEB'SIE HAS LOST INTEREST IN YOU.</span>")
	target = food
	if(ishuman(target))
		to_chat(target, "<span class ='cult'>QUEEB'SIE HUNGERS FOR YOUR SOUL.</span>")
	else
		to_chat(target, "<span class ='cult'>QUEEB'SIE HAS CHOSEN YOU TO LEAD HIM TO HIS NEXT MEAL.</span>")
