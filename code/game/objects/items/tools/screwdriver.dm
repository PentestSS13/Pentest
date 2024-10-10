/obj/item/screwdriver
	name = "screwdriver"
	desc = "You can be totally screwy with this."
	icon = 'icons/obj/tools.dmi'
	icon_state = "screwdriver_map"
	item_state = "screwdriver"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	custom_materials = list(/datum/material/iron=75)
	attack_verb = list("stabbed")
	hitsound = 'sound/weapons/bladeslice.ogg'
	usesound = list('sound/items/screwdriver.ogg', 'sound/items/screwdriver2.ogg')
	tool_behaviour = TOOL_SCREWDRIVER
	toolspeed = 1
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	drop_sound = 'sound/items/handling/screwdriver_drop.ogg'
	pickup_sound =  'sound/items/handling/screwdriver_pickup.ogg'
	item_flags = SURGICAL_TOOL | EYE_STAB //WS - Fix IPC surgery
	var/random_color = TRUE //if the screwdriver uses random coloring
	var/static/list/screwdriver_colors = list(
		"blue" = "#8080ff",
		"red" = "#ff666e",
		"pink" = "#fd99ff",
		"brown" = "#b38459",
		"green" = "#9fe3a9",
		"cyan" = "#96ffef",
		"yellow" = "#ffe366"
	)

/obj/item/screwdriver/Initialize()
	. = ..()
	if(random_color) //random colors!
		icon_state = "screwdriver"
		var/our_color = pick(screwdriver_colors)
		add_atom_colour(screwdriver_colors[our_color], FIXED_COLOUR_PRIORITY)
		update_appearance()
	if(prob(75))
		pixel_y = rand(0, 16)

/obj/item/screwdriver/update_overlays()
	. = ..()
	if(!random_color) //icon override
		return
	var/mutable_appearance/base_overlay = mutable_appearance(icon, "screwdriver_screwybits")
	base_overlay.appearance_flags = RESET_COLOR
	. += base_overlay

/obj/item/screwdriver/worn_overlays(isinhands = FALSE, icon_file)
	. = ..()
	if(isinhands && random_color)
		var/mutable_appearance/M = mutable_appearance(icon_file, "screwdriver_head")
		M.appearance_flags = RESET_COLOR
		. += M

/obj/item/screwdriver/get_belt_overlay()
	if(random_color)
		var/mutable_appearance/body = mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "screwdriver")
		var/mutable_appearance/head = mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "screwdriver_head")
		body.color = color
		head.add_overlay(body)
		return head
	else
		return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', icon_state)

/obj/item/screwdriver/abductor
	name = "alien screwdriver"
	desc = "An ultrasonic screwdriver."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "screwdriver_a"
	item_state = "screwdriver_nuke"
	usesound = 'sound/items/pshoom.ogg'
	toolspeed = 0.1
	random_color = FALSE

/obj/item/screwdriver/abductor/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "screwdriver_nuke")

/obj/item/screwdriver/power
	name = "hand drill"
	desc = "A simple powered hand drill."
	icon_state = "drill_screw"
	item_state = "drill"
	custom_materials = list(/datum/material/iron=150,/datum/material/silver=50,/datum/material/titanium=25) //done for balance reasons, making them high value for research, but harder to get
	force = 8 //might or might not be too high, subject to change
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 8
	throw_speed = 2
	throw_range = 3//it's heavier than a screw driver/wrench, so it does more damage, but can't be thrown as far
	attack_verb = list("drilled", "screwed", "jabbed","whacked")
	hitsound = 'sound/items/drill_hit.ogg'
	usesound = 'sound/items/drill_use.ogg'
	toolspeed = 0.7
	random_color = FALSE

/obj/item/screwdriver/power/examine()
	. = ..()
	. += " It's fitted with a [tool_behaviour == TOOL_SCREWDRIVER ? "screw" : "bolt"] bit."

/obj/item/screwdriver/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_drill.ogg', 50, TRUE)
	if(tool_behaviour == TOOL_SCREWDRIVER)
		tool_behaviour = TOOL_WRENCH
		to_chat(user, "<span class='notice'>You attach the bolt bit to [src].</span>")
		icon_state = "drill_bolt"
		update_appearance()
	else
		tool_behaviour = TOOL_SCREWDRIVER
		to_chat(user, "<span class='notice'>You attach the screw bit to [src].</span>")
		icon_state = "drill_screw"
		update_appearance()

/obj/item/screwdriver/power/attack_hand(mob/user)
	. = ..()
	update_appearance()

/obj/item/screwdriver/power/pickup(mob/user)
	. = ..()
	update_appearance()

/obj/item/screwdriver/power/dropped(mob/user)
	. = ..()
	update_appearance()

/obj/item/screwdriver/power/update_overlays()
	. = ..()
	if(ismob(loc))
		var/mode_ovelay
		switch(tool_behaviour)
			if (TOOL_SCREWDRIVER)
				mode_ovelay = "bit_screw"
			if (TOOL_WRENCH)
				mode_ovelay = "bit_bolt"
		. += mode_ovelay

/obj/item/screwdriver/cyborg
	name = "automated screwdriver"
	desc = "A powerful automated screwdriver, designed to be both precise and quick."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "screwdriver_cyborg"
	hitsound = 'sound/items/drill_hit.ogg'
	usesound = 'sound/items/drill_use.ogg'
	toolspeed = 0.5
	random_color = FALSE

/obj/item/screwdriver/old
	desc = "You can be totally screwy with this. Well, if the end wasn't so rusty."
	icon = 'icons/obj/tools.dmi'
	icon_state = "oldscrewdriver"
