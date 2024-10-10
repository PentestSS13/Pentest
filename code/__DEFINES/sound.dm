//max channel is 1024. Only go lower from here, because byond tends to pick the first availiable channel to play sounds on
#define CHANNEL_LOBBYMUSIC 1024
#define CHANNEL_ADMIN 1023
#define CHANNEL_VOX 1022
#define CHANNEL_JUKEBOX 1021
#define CHANNEL_JUKEBOX_START 1016 //The gap between this and CHANNEL_JUKEBOX determines the amount of free jukebox channels. This currently allows 6 jukebox channels to exist.
#define CHANNEL_HEARTBEAT 1015 //sound channel for heartbeats
#define CHANNEL_AMBIENCE 1014
#define CHANNEL_BUZZ 1013
#define CHANNEL_BICYCLE 1012

///Default range of a sound.
#define SOUND_RANGE 17
///default extra range for sounds considered to be quieter
#define SHORT_RANGE_SOUND_EXTRARANGE -9
///The range deducted from sound range for things that are considered silent / sneaky
#define SILENCED_SOUND_EXTRARANGE -11
///Percentage of sound's range where no falloff is applied
#define SOUND_DEFAULT_FALLOFF_DISTANCE 1 //For a normal sound this would be 1 tile of no falloff
///The default exponent of sound falloff
#define SOUND_FALLOFF_EXPONENT 6

//THIS SHOULD ALWAYS BE THE LOWEST ONE!
//KEEP IT UPDATED

#define CHANNEL_HIGHEST_AVAILABLE 1015

#define MAX_INSTRUMENT_CHANNELS (128 * 6)

#define SOUND_MINIMUM_PRESSURE 10


//Ambience types

#define GENERIC list( \
	'sound/ambience/ambigen1.ogg', 'sound/ambience/ambigen3.ogg', \
	'sound/ambience/ambigen4.ogg', 'sound/ambience/ambigen5.ogg', \
	'sound/ambience/ambigen6.ogg', 'sound/ambience/ambigen7.ogg', \
	'sound/ambience/ambigen8.ogg', 'sound/ambience/ambigen9.ogg', \
	'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', \
	'sound/ambience/ambigen12.ogg', 'sound/ambience/ambigen14.ogg', \
	'sound/ambience/ambigen15.ogg')

#define HOLY list( \
	'sound/ambience/ambicha1.ogg', 'sound/ambience/ambicha2.ogg', \
	'sound/ambience/ambicha3.ogg', 'sound/ambience/ambicha4.ogg', \
	'sound/ambience/ambiholy.ogg', 'sound/ambience/ambiholy2.ogg', \
	'sound/ambience/ambiholy3.ogg')

#define HIGHSEC list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg')

#define RUINS list( \
	'sound/ambience/ambimine.ogg', 'sound/ambience/ambicave.ogg', \
	'sound/ambience/ambiruin.ogg', 'sound/ambience/ambiruin2.ogg', \
	'sound/ambience/ambiruin3.ogg', 'sound/ambience/ambiruin4.ogg', \
	'sound/ambience/ambiruin5.ogg', 'sound/ambience/ambiruin6.ogg', \
	'sound/ambience/ambiruin7.ogg', 'sound/ambience/ambidanger.ogg', \
	'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambitech3.ogg', \
	'sound/ambience/ambimystery.ogg', 'sound/ambience/ambimaint1.ogg')

#define ENGINEERING list( \
	'sound/ambience/ambisin1.ogg', 'sound/ambience/ambisin2.ogg', \
	'sound/ambience/ambisin3.ogg', 'sound/ambience/ambisin4.ogg', \
	'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg', \
	'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', \
	'sound/ambience/ambitech3.ogg')

#define MINING list( \
	'sound/ambience/ambimine.ogg', 'sound/ambience/ambicave.ogg', \
	'sound/ambience/ambiruin.ogg', 'sound/ambience/ambiruin2.ogg', \
	'sound/ambience/ambiruin3.ogg', 'sound/ambience/ambiruin4.ogg', \
	'sound/ambience/ambiruin5.ogg', 'sound/ambience/ambiruin6.ogg', \
	'sound/ambience/ambiruin7.ogg', 'sound/ambience/ambidanger.ogg', \
	'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambimaint1.ogg', \
	'sound/ambience/ambilava.ogg')

#define MEDICAL list('sound/ambience/ambinice.ogg')

#define SPOOKY list( \
	'sound/ambience/ambimo1.ogg', 'sound/ambience/ambimo2.ogg', \
	'sound/ambience/ambiruin7.ogg', 'sound/ambience/ambiruin6.ogg', \
	'sound/ambience/ambiodd.ogg', 'sound/ambience/ambimystery.ogg')

#define SPACE list('sound/ambience/ambispace.ogg', 'sound/ambience/ambispace2.ogg', 'sound/ambience/title2.ogg', 'sound/ambience/ambiatmos.ogg')

#define MAINTENANCE list( \
	'sound/ambience/ambimaint1.ogg', 'sound/ambience/ambimaint2.ogg', \
	'sound/ambience/ambimaint3.ogg', 'sound/ambience/ambimaint4.ogg', \
	'sound/ambience/ambimaint5.ogg', 'sound/voice/lowHiss2.ogg', \
	'sound/voice/lowHiss3.ogg', 'sound/voice/lowHiss4.ogg', \
	'sound/ambience/ambitech2.ogg')

#define AWAY_MISSION list( \
	'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', \
	'sound/ambience/ambiruin.ogg', 'sound/ambience/ambiruin2.ogg', \
	'sound/ambience/ambiruin3.ogg', 'sound/ambience/ambiruin4.ogg', \
	'sound/ambience/ambiruin5.ogg', 'sound/ambience/ambiruin6.ogg', \
	'sound/ambience/ambiruin7.ogg', 'sound/ambience/ambidanger.ogg', \
	'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambimaint.ogg', \
	'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg', \
	'sound/ambience/ambiodd.ogg')

#define REEBE list('sound/ambience/ambireebe1.ogg', 'sound/ambience/ambireebe2.ogg', 'sound/ambience/ambireebe3.ogg')



#define CREEPY_SOUNDS list( \
	'sound/effects/ghost.ogg', 'sound/effects/ghost2.ogg', \
	'sound/effects/heart_beat.ogg', 'sound/effects/screech.ogg', \
	'sound/hallucinations/behind_you1.ogg', 'sound/hallucinations/behind_you2.ogg', \
	'sound/hallucinations/far_noise.ogg', 'sound/hallucinations/growl1.ogg', \
	'sound/hallucinations/growl2.ogg', 'sound/hallucinations/growl3.ogg', \
	'sound/hallucinations/im_here1.ogg', 'sound/hallucinations/im_here2.ogg', \
	'sound/hallucinations/i_see_you1.ogg', 'sound/hallucinations/i_see_you2.ogg', \
	'sound/hallucinations/look_up1.ogg', 'sound/hallucinations/look_up2.ogg', \
	'sound/hallucinations/over_here1.ogg', 'sound/hallucinations/over_here2.ogg', \
	'sound/hallucinations/over_here3.ogg', 'sound/hallucinations/turn_around1.ogg', \
	'sound/hallucinations/turn_around2.ogg', 'sound/hallucinations/veryfar_noise.ogg', \
	'sound/hallucinations/wail.ogg')

#define BEACH list( \
	'sound/ambience/shore.ogg', 'sound/ambience/seag1.ogg','sound/ambience/seag2.ogg','sound/ambience/seag2.ogg', \
	'sound/ambience/ambiodd.ogg','sound/ambience/ambinice.ogg')


#define INTERACTION_SOUND_RANGE_MODIFIER -3
#define EQUIP_SOUND_VOLUME 30
#define PICKUP_SOUND_VOLUME 15
#define DROP_SOUND_VOLUME 20
#define YEET_SOUND_VOLUME 90


//default byond sound environments
#define SOUND_ENVIRONMENT_NONE -1
#define SOUND_ENVIRONMENT_GENERIC 0
#define SOUND_ENVIRONMENT_PADDED_CELL 1
#define SOUND_ENVIRONMENT_ROOM 2
#define SOUND_ENVIRONMENT_BATHROOM 3
#define SOUND_ENVIRONMENT_LIVINGROOM 4
#define SOUND_ENVIRONMENT_STONEROOM 5
#define SOUND_ENVIRONMENT_AUDITORIUM 6
#define SOUND_ENVIRONMENT_CONCERT_HALL 7
#define SOUND_ENVIRONMENT_CAVE 8
#define SOUND_ENVIRONMENT_ARENA 9
#define SOUND_ENVIRONMENT_HANGAR 10
#define SOUND_ENVIRONMENT_CARPETED_HALLWAY 11
#define SOUND_ENVIRONMENT_HALLWAY 12
#define SOUND_ENVIRONMENT_STONE_CORRIDOR 13
#define SOUND_ENVIRONMENT_ALLEY 14
#define SOUND_ENVIRONMENT_FOREST 15
#define SOUND_ENVIRONMENT_CITY 16
#define SOUND_ENVIRONMENT_MOUNTAINS 17
#define SOUND_ENVIRONMENT_QUARRY 18
#define SOUND_ENVIRONMENT_PLAIN 19
#define SOUND_ENVIRONMENT_PARKING_LOT 20
#define SOUND_ENVIRONMENT_SEWER_PIPE 21
#define SOUND_ENVIRONMENT_UNDERWATER 22
#define SOUND_ENVIRONMENT_DRUGGED 23
#define SOUND_ENVIRONMENT_DIZZY 24
#define SOUND_ENVIRONMENT_PSYCHOTIC 25
//If we ever make custom ones add them here

//"sound areas": easy way of keeping different types of areas consistent.
#define SOUND_AREA_STANDARD_STATION SOUND_ENVIRONMENT_PARKING_LOT
#define SOUND_AREA_LARGE_ENCLOSED SOUND_ENVIRONMENT_QUARRY
#define SOUND_AREA_SMALL_ENCLOSED SOUND_ENVIRONMENT_BATHROOM
#define SOUND_AREA_TUNNEL_ENCLOSED SOUND_ENVIRONMENT_STONEROOM
#define SOUND_AREA_LARGE_SOFTFLOOR SOUND_ENVIRONMENT_CARPETED_HALLWAY
#define SOUND_AREA_MEDIUM_SOFTFLOOR SOUND_ENVIRONMENT_LIVINGROOM
#define SOUND_AREA_SMALL_SOFTFLOOR SOUND_ENVIRONMENT_ROOM
#define SOUND_AREA_ASTEROID SOUND_ENVIRONMENT_CAVE
#define SOUND_AREA_SPACE SOUND_ENVIRONMENT_UNDERWATER
#define SOUND_AREA_LAVALAND SOUND_ENVIRONMENT_MOUNTAINS
#define SOUND_AREA_ICEMOON SOUND_ENVIRONMENT_CAVE
#define SOUND_AREA_WOODFLOOR SOUND_ENVIRONMENT_CITY

/// List of all of our sound keys.
#define SFX_BODYFALL "bodyfall"
#define SFX_BULLET_MISS "bullet_miss"
#define SFX_CAN_OPEN "can_open"
#define SFX_CLOWN_STEP "clown_step"
#define SFX_DESECRATION "desecration"
#define SFX_EXPLOSION "explosion"
#define SFX_EXPLOSION_CREAKING "explosion_creaking"
#define SFX_HISS "hiss"
#define SFX_HONKBOT_E "honkbot_e"
#define SFX_HULL_CREAKING "hull_creaking"
#define SFX_HYPERTORUS_CALM "hypertorus_calm"
#define SFX_HYPERTORUS_MELTING "hypertorus_melting"
#define SFX_IM_HERE "im_here"
#define SFX_LAW "law"
#define SFX_PAGE_TURN "page_turn"
#define SFX_PUNCH "punch"
#define SFX_REVOLVER_SPIN "revolver_spin"
#define SFX_RICOCHET "ricochet"
#define SFX_RUSTLE "rustle"
#define SFX_SHATTER "shatter"
#define SFX_SM_CALM "sm_calm"
#define SFX_SM_DELAM "sm_delam"
#define SFX_SPARKS "sparks"
#define SFX_SUIT_STEP "suit_step"
#define SFX_SWING_HIT "swing_hit"
#define SFX_TERMINAL_TYPE "terminal_type"
#define SFX_WARPSPEED "warpspeed"
#define SFX_CRUNCHY_BUSH_WHACK "crunchy_bush_whack"
#define SFX_TREE_CHOP "tree_chop"
#define SFX_ROCK_TAP "rock_tap"

#define SOUND_EMPTY_MAG 'sound/weapons/empty.ogg'
