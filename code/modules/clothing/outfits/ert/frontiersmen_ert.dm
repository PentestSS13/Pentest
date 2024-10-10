/datum/outfit/job/frontiersmen/ert //most basic of grunts
	name = "ERT - Frontiersman Basic"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/rifle/illestren
	uniform = /obj/item/clothing/under/frontiersmen
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/pirate/alt
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	box = /obj/item/storage/box/survival/frontier
	id = null // lol

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/ammo_box/magazine/illestren_a850r=5, /obj/item/grenade/frag=1)

/datum/outfit/job/frontiersmen/ert/random
	name = "ERT - Frontiersman Randomized"

	head = null
	mask = null
	suit = null
	suit_store = null
	back = null
	l_pocket = null
	r_pocket = /obj/item/radio
	backpack_contents = list()

/datum/outfit/job/frontiersmen/ert/random/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	if(visualsOnly)
		return

	if(prob(90))
		head = pickweight(list(
		/obj/item/clothing/head/beret/sec/frontier = 10,
		/obj/item/clothing/head/helmet/bulletproof/x11/frontier = 5,
		/obj/item/reagent_containers/glass/bucket = 1))

	if(prob(60))
		suit = pickweight(list(
		/obj/item/clothing/suit/armor/vest = 5,
		/obj/item/clothing/suit/armor/vest/bulletproof/frontier = 5,
		/obj/item/clothing/suit/armor/vest/scrap_armor = 1))

	if(prob(30))
		mask = pickweight(list(
		/obj/item/clothing/mask/gas/frontiersmen = 5,
		/obj/item/clothing/mask/gas/sechailer/balaclava = 5,
		/obj/item/clothing/mask/breath = 5,
		/obj/item/clothing/mask/whistle = 3))

	if(prob(90))
		back = pickweight(list(
		/obj/item/storage/backpack = 20,
		/obj/item/storage/backpack/satchel = 20,
		/obj/item/storage/backpack/messenger = 20,
		/obj/item/melee/baton/cattleprod/loaded = 5,
		/obj/item/food/baguette = 2, // yes you can put this on your back
		/obj/item/deployable_turret_folded = 1,
		/obj/item/gun/ballistic/automatic/hmg/skm_lmg/extended = 1,
		))

	if(prob(90))
		shoes = pickweight(list(
		/obj/item/clothing/shoes/jackboots = 10,
		/obj/item/clothing/shoes/sneakers = 5,
		))

	var/extra_class = pick(list("Doctor", "Breacher", "Ammo Carrier"))
	switch(extra_class)
		if("Doctor")
			backpack_contents += list(/obj/item/storage/firstaid/regular = 1)
			gloves = /obj/item/clothing/gloves/color/latex
			suit = /obj/item/clothing/suit/frontiersmen
			head = /obj/item/clothing/head/frontier
			if(prob(50))
				belt = /obj/item/storage/belt/medical/surgery
			if(prob(30))
				glasses = /obj/item/clothing/glasses/hud/health
		if("Breacher")
			backpack_contents += list(/obj/item/grenade/c4 = 2)
			if(prob(10))
				belt = /obj/item/storage/belt/grenade/full
		if("Ammo Carrier")
			var/loops = rand(1,3)
			for(var/i in 1 to loops)
				var/ammotype = pick(list(
					/obj/item/ammo_box/c8x50mm_box,
					/obj/item/ammo_box/c45,
					/obj/item/ammo_box/a357_box,
					/obj/item/ammo_box/c45,
					/obj/item/ammo_box/a4570,
					/obj/item/stock_parts/cell/gun/mini))
				backpack_contents += ammotype

	var/weapon = pick(list("Bolt-Action", "Pistol", "Melee"))
	switch(weapon)
		if("Bolt-Action")
			r_hand = /obj/item/gun/ballistic/rifle/illestren
			if(prob(70) && istype(back, /obj/item/storage/backpack))
				backpack_contents += list(/obj/item/ammo_box/magazine/illestren_a850r = rand(1,4))
			if(prob(55))
				l_pocket = /obj/item/ammo_box/magazine/illestren_a850r
		if("Pistol")
			r_hand = pick(list(
			/obj/item/gun/ballistic/automatic/pistol/disposable,
			/obj/item/gun/ballistic/automatic/pistol/candor,
			/obj/item/gun/ballistic/revolver/firebrand,
			/obj/item/gun/ballistic/revolver/shadow,
			/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/presawn,
			/obj/item/gun/energy/e_gun/mini))
			if(prob(30))
				l_hand = pick(list(
				/obj/item/gun/ballistic/automatic/pistol/disposable,
				/obj/item/gun/ballistic/automatic/pistol/candor,
				/obj/item/gun/ballistic/revolver/firebrand,
				/obj/item/gun/ballistic/revolver/shadow,
				/obj/item/gun/ballistic/shotgun/doublebarrel/beacon/presawn,
				/obj/item/gun/energy/e_gun/mini))
		if("Melee")
			r_hand = pickweight(list(
			/obj/item/kitchen/knife/combat/survival = 15,
			/obj/item/melee/baseball_bat = 10,
			/obj/item/melee/cleric_mace = 7,
			/obj/item/melee/roastingstick = 2,
			/obj/item/kitchen/fork = 1,
			/obj/item/melee/flyswatter = 1,
			))

/datum/outfit/job/frontiersmen/ert/grunt //better armed, use for quick creating pirate ships
	name = "ERT - Frontiersman Grunt (Unarmed)"

	suit_store = null
	belt = /obj/item/storage/belt/security/military/frontiersmen

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen)

/datum/outfit/job/frontiersmen/ert/grunt/skm
	name = "ERT - Frontiersman Grunt (SKM-24)"

	suit_store = /obj/item/gun/ballistic/automatic/assault/skm
	belt = /obj/item/storage/belt/security/military/frontiersmen/skm_ammo

/datum/outfit/job/frontiersmen/ert/grunt/aps_mp //remember. Remind me to replace this with the spitter.
	name = "ERT - Frontiersman Grunt (Stechkin APS)"

	suit_store = /obj/item/gun/ballistic/automatic/pistol/APS
	belt = /obj/item/storage/belt/security/military/frontiersmen/aps_mp_ammo

/datum/outfit/job/frontiersmen/ert/leader
	name = "ERT - Frontiersman Officer"

	uniform = /obj/item/clothing/under/frontiersmen/officer
	head = /obj/item/clothing/head/beret/sec/frontier/officer
	ears = /obj/item/radio/headset/pirate/alt/captain
	back = /obj/item/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/armor/frontier
	suit_store = /obj/item/gun/ballistic/automatic/pistol/deagle

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/ammo_box/magazine/m50=2, /obj/item/binoculars=1, /obj/item/kitchen/knife/combat/survival)

/datum/outfit/job/frontiersmen/ert/leader/unnarmed
	name = "ERT - Frontiersman Officer (Unnarmed)"

	suit_store = null

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/binoculars=1, /obj/item/kitchen/knife/combat/survival)

/datum/outfit/job/frontiersmen/ert/medic
	name = "ERT - Frontiersman Medic"

	head = /obj/item/clothing/head/frontier
	back = /obj/item/storage/backpack/medic
	mask = /obj/item/clothing/mask/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	belt = /obj/item/storage/belt/medical/webbing/frontiersmen/surgery
	suit_store = /obj/item/gun/ballistic/automatic/pistol/APS

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/storage/firstaid/medical=1, /obj/item/reagent_containers/hypospray/medipen/stimpack=3, /obj/item/ammo_box/magazine/pistolm9mm=2)


/datum/outfit/job/frontiersmen/ert/engineer
	name = "ERT - Frontiersman Engineer"

	back = /obj/item/storage/backpack/industrial
	belt = /obj/item/storage/belt/utility/full
	head = /obj/item/clothing/head/hardhat/frontier
	glasses = /obj/item/clothing/glasses/welding
	suit_store = null

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/grenade/c4=3, /obj/item/crowbar/large=1)

/datum/outfit/job/frontiersmen/ert/flamer
	name = "ERT - Frontiersman Flame Trooper"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier/fireproof
	mask = /obj/item/clothing/mask/gas/frontiersmen
	suit = /obj/item/clothing/suit/armor/frontier/fireproof
	suit_store = /obj/item/tank/internals/oxygen/red
	uniform = /obj/item/clothing/under/frontiersmen/fireproof
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/security/military/frontiersmen/flamer

	l_hand = /obj/item/flamethrower/full/tank

	backpack_contents = list(/obj/item/gun/ballistic/shotgun/doublebarrel/presawn=1,/obj/item/ammo_box/a12g=1,/obj/item/extinguisher=2,/obj/item/radio=1)


/datum/outfit/job/frontiersmen/ert/sentry_lmg
	name = "ERT - Frontiersman Sentry (SKM-24v)"

	head = /obj/item/clothing/head/helmet/marine/frontier
	mask = /obj/item/clothing/mask/gas/sechailer/balaclava
	suit = /obj/item/clothing/suit/armor/vest/marine/frontier
	suit_store = /obj/item/gun/ballistic/automatic/hmg/skm_lmg/drum_mag
	gloves = /obj/item/clothing/gloves/combat

	belt = /obj/item/gun/ballistic/revolver/mateba

	backpack_contents = list(/obj/item/ammo_box/magazine/skm_762_40/drum=2,/obj/item/ammo_box/a357=2,/obj/item/grenade/frag=1,/obj/item/radio=1)
