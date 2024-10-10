

///////////////////////////////////////////////Alchohol bottles! -Agouri //////////////////////////
//Functionally identical to regular drinks. The only difference is that the default bottle size is 100. - Darem
//Bottles now knockdown and break when smashed on people's heads. - Giacom

/obj/item/reagent_containers/food/drinks/bottle
	name = "glass bottle"
	desc = "This blank bottle is unyieldingly anonymous, offering no clues to its contents."
	icon_state = "glassbottle"
	fill_icon_thresholds = list(0, 10, 20, 30, 40, 50, 60, 70, 80, 90)
	custom_price = 65
	amount_per_transfer_from_this = 10
	volume = 100
	force = 15 //Smashing bottles over someone's head hurts.
	throwforce = 15
	item_state = "broken_beer" //Generic held-item sprite until unique ones are made.
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	pickup_sound =  'sound/items/handling/bottle_pickup.ogg'
	drop_sound = 'sound/items/handling/bottle_drop.ogg'
	var/const/duration = 13 //Directly relates to the 'knockdown' duration. Lowered by armor (i.e. helmets)
	isGlass = TRUE
	foodtype = ALCOHOL

/obj/item/reagent_containers/food/drinks/bottle/update_overlays()
	. = ..()
	. += "[initial(icon_state)]shine"

/obj/item/reagent_containers/food/drinks/bottle/small
	name = "small glass bottle"
	desc = "This blank bottle is unyieldingly anonymous, offering no clues to its contents."
	icon_state = "glassbottlesmall"
	volume = 50
	custom_price = 55

/obj/item/reagent_containers/food/drinks/bottle/attack(mob/living/target, mob/living/user)
	if(!target)
		return

	if(user.a_intent != INTENT_HARM || !isGlass)
		return ..()

	if(HAS_TRAIT(user, TRAIT_PACIFISM))
		to_chat(user, "<span class='warning'>You don't want to harm [target]!</span>")
		return

	var/obj/item/bodypart/affecting = user.zone_selected //Find what the player is aiming at

	var/armor_block = 0 //Get the target's armor values for normal attack damage.
	var/armor_duration = 0 //The more force the bottle has, the longer the duration.

	//Calculating duration and calculating damage.
	if(ishuman(target))

		var/mob/living/carbon/human/H = target
		var/headarmor = 0 // Target's head armor
		armor_block = H.run_armor_check(affecting, "melee", armour_penetration, silent = TRUE) // For normal attack damage

		//If they have a hat/helmet and the user is targeting their head.
		if(istype(H.head, /obj/item/clothing/head) && affecting == BODY_ZONE_HEAD)
			headarmor = H.head.armor.melee
		else
			headarmor = 0

		//Calculate the knockdown duration for the target.
		armor_duration = (duration - headarmor) + force

	else
		//Only humans can have armor, right?
		armor_block = target.run_armor_check(affecting, "melee")
		if(affecting == BODY_ZONE_HEAD)
			armor_duration = duration + force

	//Apply the damage!
	armor_block = min(90,armor_block)
	target.apply_damage(force, BRUTE, affecting, armor_block)

	// You are going to knock someone down for longer if they are not wearing a helmet.
	var/head_attack_message = ""
	if(affecting == BODY_ZONE_HEAD && istype(target, /mob/living/carbon/))
		head_attack_message = " on the head"
		if(armor_duration)
			target.apply_effect(min(armor_duration, 200) , EFFECT_KNOCKDOWN)

	//Display an attack message.
	if(target != user)
		target.visible_message("<span class='danger'>[user] hits [target][head_attack_message] with a bottle of [src.name]!</span>", \
				"<span class='userdanger'>[user] hits you [head_attack_message] with a bottle of [src.name]!</span>")
	else
		target.visible_message("<span class='danger'>[target] hits [target.p_them()]self with a bottle of [src.name][head_attack_message]!</span>", \
				"<span class='userdanger'>You hit yourself with a bottle of [src.name][head_attack_message]!</span>")

	//Attack logs
	log_combat(user, target, "attacked", src)

	//The reagents in the bottle splash all over the target, thanks for the idea Nodrak
	SplashReagents(target)

	//Finally, smash the bottle. This kills (del) the bottle.
	smash(target, user)

	return

//Keeping this here for now, I'll ask if I should keep it here.
/obj/item/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks/drinks.dmi'
	icon_state = "broken_bottle"
	force = 9
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY
	item_state = "beer"
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("stabbed", "slashed", "attacked")
	sharpness = IS_SHARP
	var/static/icon/broken_outline = icon('icons/obj/drinks/drinks.dmi', "broken")

/obj/item/broken_bottle/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 200, 55)

/obj/item/reagent_containers/food/drinks/bottle/gin
	name = "Griffeater gin"
	desc = "A bottle of high quality gin, produced in the New London Space Station."
	icon_state = "ginbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/gin = 100)

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	name = "Uncle Git's special reserve"
	desc = "A premium single-malt whiskey, gently matured inside the tunnels of a nuclear shelter. TUNNEL WHISKEY RULES."
	icon_state = "whiskeybottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 100)

/obj/item/reagent_containers/food/drinks/bottle/kong
	name = "Kong"
	desc = "Makes You Go Ape!&#174;"
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey/kong = 100)

/obj/item/reagent_containers/food/drinks/bottle/candycornliquor
	name = "candy corn liquor"
	desc = "Like they drank in 2D speakeasies."
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey/candycorn = 100)

/obj/item/reagent_containers/food/drinks/bottle/vodka
	name = "Tunguska triple distilled"
	desc = "Vodka, prime choice of drink and fuel."
	icon_state = "vodkabottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/vodka = 100)

/obj/item/reagent_containers/food/drinks/bottle/vodka/badminka
	name = "Badminka vodka"
	desc = "The label's written in some unknown language. All you can make out is the name and a word that looks vaguely like 'Vodka'."
	icon_state = "badminka"
	list_reagents = list(/datum/reagent/consumable/ethanol/vodka = 100)

/obj/item/reagent_containers/food/drinks/bottle/tequila
	name = "Caccavo guaranteed quality tequila"
	desc = "Made from premium petroleum distillates, pure thalidomide and other fine quality ingredients!"
	icon_state = "tequilabottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/tequila = 100)

/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
	name = "bottle of nothing"
	desc = "A bottle filled with nothing."
	icon_state = "bottleofnothing"
	list_reagents = list(/datum/reagent/consumable/nothing = 100)
	foodtype = NONE


/obj/item/reagent_containers/food/drinks/bottle/patron
	name = "Wrapp Artiste Patron"
	desc = "Silver laced tequila, served in space night clubs across the galaxy."
	icon_state = "patronbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/patron = 100)

/obj/item/reagent_containers/food/drinks/bottle/rum
	name = "Captain Pete's Cuban spiced rum"
	desc = "This isn't just rum, oh no. It's practically GRIFF in a bottle."
	icon_state = "rumbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/rum = 100)

/obj/item/reagent_containers/food/drinks/bottle/holywater
	name = "flask of holy water"
	desc = "A flask of the chaplain's holy water."
	icon_state = "holyflask"
	list_reagents = list(/datum/reagent/water/holywater = 100)
	foodtype = NONE

/obj/item/reagent_containers/food/drinks/bottle/holywater/hell
	desc = "A flask of holy water...it's been sitting in the Necropolis a while though."
	list_reagents = list(/datum/reagent/hellwater = 100)

/obj/item/reagent_containers/food/drinks/bottle/vermouth
	name = "Goldeneye vermouth"
	desc = "Sweet, sweet dryness~"
	icon_state = "vermouthbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/vermouth = 100)

/obj/item/reagent_containers/food/drinks/bottle/kahlua
	name = "Robert Robust's coffee liqueur"
	desc = "A widely known, Mexican coffee-flavoured liqueur. In production since 1936, HONK."
	icon_state = "kahluabottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/kahlua = 100)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/drinks/bottle/goldschlager
	name = "College Girl goldschlager"
	desc = "Because they are the only ones who will drink 100 proof cinnamon schnapps."
	icon_state = "goldschlagerbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/goldschlager = 100)

/obj/item/reagent_containers/food/drinks/bottle/cognac
	name = "Chateau de Baton premium cognac"
	desc = "A sweet and strongly alchoholic drink, made after numerous distillations and years of maturing. You might as well not scream 'SHITCURITY' this time."
	icon_state = "cognacbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/cognac = 100)

/obj/item/reagent_containers/food/drinks/bottle/wine
	name = "Doublebeard's bearded special wine"
	desc = "A faint aura of unease and asspainery surrounds the bottle."
	icon_state = "winebottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/wine = 100)
	foodtype = FRUIT | ALCOHOL

/obj/item/reagent_containers/food/drinks/bottle/absinthe
	name = "extra-strong absinthe"
	desc = "An strong alcoholic drink brewed and distributed by"
	icon_state = "absinthebottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/absinthe = 100)

/obj/item/reagent_containers/food/drinks/bottle/absinthe/Initialize()
	. = ..()
	redact()

/obj/item/reagent_containers/food/drinks/bottle/absinthe/proc/redact()
	// There was a large fight in the coderbus about a player reference
	// in absinthe. Ergo, this is why the name generation is now so
	// complicated. Judge us kindly.
	var/shortname = pickweight(
		list("T&T" = 1, "A&A" = 1, "Generic" = 1))
	var/fullname
	switch(shortname)
		if("T&T")
			fullname = "Teal and Tealer"
		if("A&A")
			fullname = "Ash and Asher"
		if("Generic")
			fullname = "Nanotrasen Cheap Imitations"
	var/removals = list("\[REDACTED\]", "\[EXPLETIVE DELETED\]",
		"\[EXPUNGED\]", "\[INFORMATION ABOVE YOUR SECURITY CLEARANCE\]",
		"\[MOVE ALONG CITIZEN\]", "\[NOTHING TO SEE HERE\]")
	var/chance = 50

	if(prob(chance))
		shortname = pick_n_take(removals)

	var/list/final_fullname = list()
	for(var/word in splittext(fullname, " "))
		if(prob(chance))
			word = pick_n_take(removals)
		final_fullname += word

	fullname = jointext(final_fullname, " ")

	// Actually finally setting the new name and desc
	name = "[shortname] [name]"
	desc = "[desc] [fullname] Inc."


/obj/item/reagent_containers/food/drinks/bottle/absinthe/premium
	name = "Gwyn's premium absinthe"
	desc = "A potent alcoholic beverage, almost makes you forget the ash in your lungs."
	icon_state = "absinthepremium"

/obj/item/reagent_containers/food/drinks/bottle/absinthe/premium/redact()
	return

/obj/item/reagent_containers/food/drinks/bottle/lizardwine
	name = "bottle of 'kalixcis' wine"
	desc = "An alcoholic beverage of sarathi origin, now so widespread that knock-offs can be found everywhere. Check the label for point of origin."
	icon_state = "lizardwine"
	list_reagents = list(/datum/reagent/consumable/ethanol/lizardwine = 100)
	foodtype = FRUIT | ALCOHOL

/obj/item/reagent_containers/food/drinks/bottle/hcider
	name = "Jian Hard Cider"
	desc = "Apple juice for adults."
	icon_state = "hcider"
	volume = 50
	list_reagents = list(/datum/reagent/consumable/ethanol/hcider = 50)

/obj/item/reagent_containers/food/drinks/bottle/amaretto
	name = "Luini Amaretto"
	desc = "A gentle and syrup like drink, tastes of almonds and apricots"
	icon_state = "disaronno"
	list_reagents = list(/datum/reagent/consumable/ethanol/amaretto = 100)

/obj/item/reagent_containers/food/drinks/bottle/grappa
	name = "Phillipes well-aged Grappa"
	desc = "Bottle of Grappa."
	icon_state = "grappabottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/grappa = 100)

/obj/item/reagent_containers/food/drinks/bottle/sake
	name = "Ryo's traditional sake"
	desc = "Sweet as can be, and burns like fire going down."
	icon_state = "sakebottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/sake = 100)

/obj/item/reagent_containers/food/drinks/bottle/sake/Initialize()
	. = ..()
	if(prob(10))
		name = "Fluffy Tail Sake"
		desc += " On the bottle is a picture of a kitsune with nine touchable tails."
		icon_state = "sakebottle_k"
	else if(prob(10))
		name = "Inubashiri's Home Brew"
		desc += " Awoo."
		icon_state = "sakebottle_i"

/obj/item/reagent_containers/food/drinks/bottle/fernet
	name = "Fernet Bronca"
	desc = "A bottle of pure Fernet Bronca, produced in Cordoba Space Station"
	icon_state = "fernetbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/fernet = 100)

/obj/item/reagent_containers/food/drinks/bottle/triplesec
	name = "Teeka-Gih's triple sec liqueur"
	desc = "A bottle of triple sec originating from Bezuts."
	icon_state = "triplesecbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/triple_sec = 100)

//////////////////////////JUICES AND STUFF ///////////////////////

/obj/item/reagent_containers/food/drinks/bottle/orangejuice
	name = "orange juice"
	desc = "Full of vitamins and deliciousness!"
	custom_price = 100
	icon_state = "orangejuice"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/orangejuice = 100)
	foodtype = FRUIT | BREAKFAST

/obj/item/reagent_containers/food/drinks/bottle/lemonjuice
	name = "lemon juice"
	desc = "Lemonade for everyone!"
	custom_price = 100
	icon_state = "lemonjuice"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/lemonjuice = 100)
	foodtype = FRUIT

/obj/item/reagent_containers/food/drinks/bottle/cream
	name = "milk cream"
	desc = "It's cream. Made from milk. What else did you think you'd find in there?"
	custom_price = 100
	icon_state = "cream"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/cream = 100)
	foodtype = DAIRY

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice
	name = "tomato juice"
	desc = "Well, at least it LOOKS like tomato juice. You can't tell with all that redness."
	custom_price = 100
	icon_state = "tomatojuice"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/tomatojuice = 100)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/drinks/bottle/limejuice
	name = "lime juice"
	desc = "Sweet-sour goodness."
	custom_price = 100
	icon_state = "limejuice"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/limejuice = 100)
	foodtype = FRUIT

/obj/item/reagent_containers/food/drinks/bottle/pineapplejuice
	name = "pineapple juice"
	desc = "Extremely tart, yellow juice."
	custom_price = 100
	icon_state = "pineapplejuice"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/pineapplejuice = 100)
	foodtype = FRUIT | PINEAPPLE


/obj/item/reagent_containers/food/drinks/bottle/menthol
	name = "menthol"
	desc = "Tastes naturally minty, and imparts a very mild numbing sensation."
	custom_price = 100
	icon_state = "mentholbox"
	item_state = "carton"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/menthol = 100)

/obj/item/reagent_containers/food/drinks/bottle/grenadine
	name = "Jester Grenadine"
	desc = "Contains 0% real cherries!"
	custom_price = 100
	icon_state = "grenadine"
	isGlass = TRUE
	list_reagents = list(/datum/reagent/consumable/grenadine = 100)
	foodtype = FRUIT


/obj/item/reagent_containers/food/drinks/bottle/applejack
	name = "Buckin' Bronco's Applejack"
	desc = "Kicks like a horse, tastes like an apple!"
	custom_price = 100
	icon_state = "applejack_bottle"
	isGlass = TRUE
	list_reagents = list(/datum/reagent/consumable/ethanol/applejack = 100)
	foodtype = FRUIT

/obj/item/reagent_containers/food/drinks/bottle/champagne
	name = "Eau d' Dandy Brut Champagne"
	desc = "Finely sourced from only the most pretentious French vineyards."
	custom_premium_price = 250
	icon_state = "champagne_bottle"
	isGlass = TRUE
	list_reagents = list(/datum/reagent/consumable/ethanol/champagne = 100)

/obj/item/reagent_containers/food/drinks/bottle/blazaam
	name = "Ginbad's Blazaam"
	desc = "You feel like you should give the bottle a good rub before opening."
	icon_state = "blazaambottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/blazaam = 100)

/obj/item/reagent_containers/food/drinks/bottle/trappist
	name = "Mont de Requin Trappistes Bleu"
	desc = "Brewed in space-Belgium. Fancy!"
	custom_premium_price = 170
	icon_state = "trappistbottle"
	volume = 50
	list_reagents = list(/datum/reagent/consumable/ethanol/trappist = 50)

/obj/item/reagent_containers/food/drinks/bottle/hooch
	name = "hooch bottle"
	desc = "A bottle of rotgut. Its owner has applied some street wisdom to cleverly disguise it as a brown paper bag."
	icon_state = "hoochbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/hooch = 100)

/obj/item/reagent_containers/food/drinks/bottle/moonshine
	name = "moonshine jug"
	desc = "It is said that the ancient Applalacians used these stoneware jugs to capture lightning in a bottle."
	icon_state = "moonshinebottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/moonshine = 100)

/obj/item/reagent_containers/food/drinks/bottle/coconut
	name = "Tali's Pure Coconut Delight"
	desc = "Seems to be some promotional product for a Teceti video game. You're pretty certain this stuff is synthetic."
	icon_state = "coconutbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/creme_de_coconut = 100)
	isGlass = TRUE

/obj/item/reagent_containers/food/drinks/bottle/cacao
	name = "Sharai's Pure Cacao Delight"
	desc = "Seems to be some promotional product for a Teceti video game. You're pretty certain this stuff is synthetic."
	icon_state = "cacaobottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/creme_de_cacao = 100)
	isGlass = TRUE

/obj/item/reagent_containers/food/drinks/bottle/menthe
	name = "Mora's Pure Mint Delight"
	desc = "Seems to be some promotional product for a Teceti video game. You're pretty certain this stuff is synthetic."
	icon_state = "mintbottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/creme_de_menthe = 100)
	isGlass = TRUE

////////////////////////// MOLOTOV ///////////////////////
/obj/item/reagent_containers/food/drinks/bottle/molotov
	name = "molotov cocktail"
	desc = "A throwing weapon used to ignite things, typically filled with an accelerant. Recommended highly by rioters and revolutionaries. Light and toss."
	icon_state = "vodkabottle"
	list_reagents = list()
	var/active = 0

/obj/item/reagent_containers/food/drinks/bottle/molotov/CheckParts(list/parts_list)
	..()
	var/obj/item/reagent_containers/food/drinks/bottle/B = locate() in contents
	if(B)
		icon_state = B.icon_state
		B.reagents.copy_to(src,100)
		if(!B.isGlass)
			desc += " You're not sure if making this out of a carton was the brightest idea."
			isGlass = FALSE
	return

/obj/item/reagent_containers/food/drinks/bottle/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/firestarter = FALSE
	for(var/datum/reagent/reagent as anything in reagents.reagent_list)
		if(reagent.accelerant_quality)
			firestarter = TRUE
			break
	if(firestarter && active)
		hit_atom.fire_act()
		var/turf/T = get_turf(hit_atom)
		T.IgniteTurf(30)
		var/turf/otherT
		for(var/direction in GLOB.cardinals)
			otherT = get_step(T, direction)
			otherT.IgniteTurf(30)
			new /obj/effect/hotspot(otherT)
	..()

/obj/item/reagent_containers/food/drinks/bottle/molotov/attackby(obj/item/I, mob/user, params)
	if(I.get_temperature() && !active)
		active = TRUE
		log_bomber(user, "has primed a", src, "for detonation")

		to_chat(user, "<span class='info'>You light [src] on fire.</span>")
		add_overlay(custom_fire_overlay ? custom_fire_overlay : GLOB.fire_overlay)
		if(!isGlass)
			addtimer(CALLBACK(src, PROC_REF(explode)), 5 SECONDS)

/obj/item/reagent_containers/food/drinks/bottle/molotov/proc/explode()
	if(!active)
		return
	if(get_turf(src))
		var/atom/target = loc
		for(var/i in 1 to 2)
			if(istype(target, /obj/item/storage))
				target = target.loc
		SplashReagents(target)
		target.fire_act()
	qdel(src)

/obj/item/reagent_containers/food/drinks/bottle/molotov/attack_self(mob/user)
	if(active)
		if(!isGlass)
			to_chat(user, "<span class='danger'>The flame's spread too far on it!</span>")
			return
		to_chat(user, "<span class='info'>You snuff out the flame on [src].</span>")
		cut_overlay(custom_fire_overlay ? custom_fire_overlay : GLOB.fire_overlay)
		active = 0

/obj/item/reagent_containers/food/drinks/bottle/pruno
	name = "pruno mix"
	desc = "A trash bag filled with fruit, sugar, yeast, and water, pulped together into a pungent slurry to be fermented in an enclosed space, traditionally the toilet. Security would love to confiscate this, one of the many things wrong with them."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "trashbag"
	list_reagents = list(/datum/reagent/consumable/prunomix = 50)
	var/fermentation_time = 30 SECONDS /// time it takes to ferment
	var/fermentation_time_remaining /// for partial fermentation
	var/fermentation_timer 	/// store the timer id of fermentation

/obj/item/reagent_containers/food/drinks/bottle/pruno/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(check_fermentation))

/obj/item/reagent_containers/food/drinks/bottle/pruno/Destroy()
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	return ..()

// Checks to see if the pruno can ferment, i.e. is it inside a structure (e.g. toilet), or a machine (e.g. washer)?
// TODO: make it so the washer spills reagents if a reagent container is in there, for now, you can wash pruno

/obj/item/reagent_containers/food/drinks/bottle/pruno/proc/check_fermentation()
	if (!(istype(loc, /obj/machinery) || istype(loc, /obj/structure)))
		if(fermentation_timer)
			fermentation_time_remaining = timeleft(fermentation_timer)
			deltimer(fermentation_timer)
			fermentation_timer = null
		return
	if(fermentation_timer)
		return
	if(!fermentation_time_remaining)
		fermentation_time_remaining = fermentation_time
	fermentation_timer = addtimer(CALLBACK(src, PROC_REF(do_fermentation)), fermentation_time_remaining, TIMER_UNIQUE|TIMER_STOPPABLE)
	fermentation_time_remaining = null

// actually ferment

/obj/item/reagent_containers/food/drinks/bottle/pruno/proc/do_fermentation()
	fermentation_time_remaining = null
	fermentation_timer = null
	if(prob(10))
		reagents.add_reagent(/datum/reagent/toxin/bad_food, 15) // closest thing we have to botulism
		reagents.add_reagent(/datum/reagent/consumable/ethanol/pruno, 35)
	else
		reagents.add_reagent(/datum/reagent/consumable/ethanol/pruno, 50)
	name = "bag of pruno"
	desc = "Fermented prison wine made from fruit, sugar, and despair. You probably shouldn't drink this around Security."
	icon_state = "trashbag1" // pruno releases air as it ferments, we don't want to simulate this in atmos, but we can make it look like it did
	for (var/mob/living/M in view(2, get_turf(src))) // letting people and/or narcs know when the pruno is done
		to_chat(M, "<span class='info'>A pungent smell emanates from [src], like fruit puking out its guts.</span>")
		playsound(get_turf(src), 'sound/effects/bubbles2.ogg', 25, TRUE)

/obj/item/reagent_containers/food/drinks/colocup/lean
	name = "lean"
	desc = "A cup of that purple drank, the stuff that makes you go WHEEZY BABY."
	icon_state = "lean"
	list_reagents = list(/datum/reagent/consumable/lean = 50)
	random_sprite = FALSE

/obj/item/reagent_containers/food/drinks/bottle/sarsaparilla
	name = "Sandblast Sarsaparilla"
	desc = "Sealed for a guaranteed fresh taste in every bottle."
	icon_state = "sandbottle"
	volume = 50
	list_reagents = list(/datum/reagent/medicine/molten_bubbles/sand = 50)
	reagent_flags = null //Cap's on

/obj/item/reagent_containers/food/drinks/bottle/sarsaparilla/attack_self(mob/user)
	if(!is_drainable()) // Uses the reagents.flags cause reagent_flags is only the init value
		playsound(src, 'sound/items/openbottle.ogg', 30, 1)
		user.visible_message("<span class='notice'>[user] takes the cap off \the [src].</span>", "<span class='notice'>You take the cap off [src].</span>")
		reagents.flags |= OPENCONTAINER //Cap's off
		if(prob(1)) //Lucky you
			var/S = new /obj/item/sandstar(src)
			user.put_in_hands(S)
			to_chat(user, "<span class='notice'>You found a Sandblast Star!</span>")
	else
		. = ..()

/obj/item/reagent_containers/food/drinks/bottle/sarsaparilla/examine(mob/user)
	. = ..()
	if(!is_drainable())
		. += "<span class='info'>The cap is still sealed.</span>"

/obj/item/sandstar
	name = "SandBlast Sarsaparilla star"
	desc = "Legend says something amazing happens when you collect enough of these."
	custom_price = 100
	custom_premium_price = 110
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "sandstar"
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/gold = 200)

/obj/item/storage/bottles
	name = "bottle crate"
	desc = "A small crate for storing bottles"
	icon = 'icons/obj/storage.dmi'
	icon_state = "bottlecrate"
	item_state = "deliverypackage"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	custom_materials = list(/datum/material/wood = 800)
	w_class = WEIGHT_CLASS_BULKY
	var/sealed = FALSE

/obj/item/storage/bottles/Initialize()
	. = ..()
	update_appearance()

/obj/item/storage/bottles/ComponentInitialize()
	. = ..()
	var/datum/component/storage/S = GetComponent(/datum/component/storage)
	S.max_w_class = WEIGHT_CLASS_NORMAL
	S.max_combined_w_class = 16
	S.max_items = 6
	S.set_holdable(list(
		/obj/item/reagent_containers/food/drinks/beer,
		/obj/item/reagent_containers/food/drinks/ale,
		/obj/item/reagent_containers/food/drinks/bottle
	))
	S.locked = sealed

/obj/item/storage/bottles/update_icon_state()
	if(sealed)
		icon_state = "[initial(icon_state)]_seal"
	else
		icon_state = "[initial(icon_state)]_[contents.len]"
	return ..()

/obj/item/storage/bottles/examine(mob/user)
	. = ..()
	if(sealed)
		. += "<span class='info'>It is sealed. You could pry it open with a <i>crowbar</i> to access its contents.</span>"

/obj/item/storage/bottles/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	if(sealed)
		var/datum/component/storage/S = GetComponent(/datum/component/storage)
		user.visible_message("<span class='notice'>[user] prys open \the [src].</span>", "You pry open \the [src]")
		playsound(src, 'sound/machines/wooden_closet_close.ogg', 20, 1)
		sealed = FALSE
		S.locked = FALSE
		new /obj/item/stack/sheet/mineral/wood(get_turf(src), 1)
		update_appearance()
		return TRUE

/obj/item/storage/bottles/sandblast
	name = "sarsaparilla bottle crate"
	desc = "Holds six bottles of the finest sarsaparilla this side of the sector."
	sealed = TRUE

/obj/item/storage/bottles/sandblast/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/drinks/bottle/sarsaparilla(src)
