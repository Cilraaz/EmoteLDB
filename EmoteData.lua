-- EmoteData.lua - Emote data structure for EmoteLDB
local addonName, EmoteLDB = ...
local L = EmoteLDB.L

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------
-- Category IDs (used for types)
local CATEGORY = {
	FRIENDLY = 1,
	HOSTILE = 2,
	HAPPY = 3,
	NEUTRAL = 4,
	UNHAPPY = 5,
	CUSTOM = 6,
	TAUNTS = 7,
	AFFECTION = 8,
	GREETINGS = 9,
	COMBAT = 10,
	SELF_DEPRECATING = 11,
	REACTIONS = 12,
	OTHER = 13
}

-- Reaction types (visual/audio effects)
local REACTION = {
	NONE = 0,    -- Chat only
	ACTION = 1,  -- Animated
	VOCAL = 2,   -- Voice/sound
	AV = 3       -- Both animated and voiced
}

--------------------------------------------------------------------------------
-- Category Names
--------------------------------------------------------------------------------
EL_Types = {
	[CATEGORY.FRIENDLY] = L["Friendly"],
	[CATEGORY.HOSTILE] = L["Hostile"],
	[CATEGORY.HAPPY] = L["Happy"],
	[CATEGORY.NEUTRAL] = L["Neutral"],
	[CATEGORY.UNHAPPY] = L["Unhappy"],
	[CATEGORY.CUSTOM] = L["Custom"],
	[CATEGORY.TAUNTS] = L["Taunts"],
	[CATEGORY.AFFECTION] = L["Affection"],
	[CATEGORY.GREETINGS] = L["Greetings"],
	[CATEGORY.COMBAT] = L["Combat"],
	[CATEGORY.SELF_DEPRECATING] = L["Self-Deprecating"],
	[CATEGORY.REACTIONS] = L["Reactions"],
	[CATEGORY.OTHER] = L["Other"]
}

--------------------------------------------------------------------------------
-- Reaction Labels
--------------------------------------------------------------------------------
EL_React = {
	[REACTION.NONE] = "",
	[REACTION.ACTION] = L["Action"],
	[REACTION.VOCAL] = L["Vocal"],
	[REACTION.AV] = L["AV"]
}

--------------------------------------------------------------------------------
-- Helper Function for Creating Emote Entries
--------------------------------------------------------------------------------
-- Creates a standardized emote entry
-- @param types: table of category IDs
-- @param none: text when no target
-- @param target: text when targeting someone
-- @param react: reaction type (REACTION.NONE, ACTION, VOCAL, or AV)
-- @param isCustom: boolean, true if this is a custom emote
local function CreateEmote(types, none, target, react, isCustom)
	return {
		types = types,
		none = none,
		target = target,
		react = react,
		custom = isCustom and {1} or {0}  -- Keep for backward compatibility
	}
end

--------------------------------------------------------------------------------
-- Emote Database
--------------------------------------------------------------------------------
--[[ 
CUSTOM EMOTE NOTES:
- Custom emotes use template variables: <Target>, <He>, <His>, <he>, <his>
- The text should NOT contain the player's name at the beginning
- Custom emotes are sent with /e (emote command)
- Custom emotes MUST be category 6 (CUSTOM) or include it in their types
]]

EL_Emotes = {
	--------------------------------------------------------------------------------
	-- Custom Emotes
	--------------------------------------------------------------------------------

	["escape"] = CreateEmote(
		{CATEGORY.CUSTOM},
		L["escape"],
		L["escape_target"],
		REACTION.NONE,
		true
	),
	
	["bio"] = CreateEmote(
		{CATEGORY.CUSTOM, CATEGORY.OTHER},
		L["bio"],
		L["bio_target"],
		REACTION.NONE,
		true
	),
	
	["bladeintro"] = CreateEmote(
		{CATEGORY.CUSTOM, CATEGORY.HOSTILE},
		L["bladeintro"],
		L["bladeintro_target"],
		REACTION.NONE,
		true
	),
	
	--------------------------------------------------------------------------------
	-- Special Commands (not standard emotes)
	--------------------------------------------------------------------------------

	["mountspecial"] = CreateEmote(
		{CATEGORY.NEUTRAL, CATEGORY.OTHER},
		L["mountspecial"],
		L["mountspecial_target"],
		REACTION.ACTION,
		false
	),
	
	--------------------------------------------------------------------------------
	-- Standard Blizzard Emotes
	--------------------------------------------------------------------------------
	
	-- A
	["agree"] = CreateEmote({CATEGORY.REACTIONS}, L["agree"], L["agree_target"], REACTION.NONE, false),
	["amaze"] = CreateEmote({CATEGORY.REACTIONS}, L["amaze"], L["amaze_target"], REACTION.NONE, false),
	["angry"] = CreateEmote({CATEGORY.HOSTILE}, L["angry"], L["angry_target"], REACTION.ACTION, false),
	["apologize"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["apologize"], L["apologize_target"], REACTION.NONE, false),
	["applaud"] = CreateEmote({CATEGORY.REACTIONS}, L["applaud"], L["applaud_target"], REACTION.AV, false),
	["arm"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.AFFECTION}, L["arm"], L["arm_target"], REACTION.NONE, false),
	["attacktarget"] = CreateEmote({CATEGORY.COMBAT}, L["attacktarget"], L["attacktarget_target"], REACTION.AV, false),
	
	-- B
	["bark"] = CreateEmote({CATEGORY.OTHER}, L["bark"], L["bark_target"], REACTION.NONE, false),
	["bashful"] = CreateEmote({CATEGORY.AFFECTION}, L["bashful"], L["bashful_target"], REACTION.ACTION, false),
	["beckon"] = CreateEmote({CATEGORY.GREETINGS}, L["beckon"], L["beckon_target"], REACTION.NONE, false),
	["beg"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["beg"], L["beg_target"], REACTION.ACTION, false),
	["belch"] = CreateEmote({CATEGORY.TAUNTS}, L["belch"], L["belch_target"], REACTION.NONE, false),
	["bite"] = CreateEmote({CATEGORY.HOSTILE}, L["bite"], L["bite_target"], REACTION.NONE, false),
	["bleed"] = CreateEmote({CATEGORY.OTHER}, L["bleed"], L["bleed_target"], REACTION.NONE, false),
	["blink"] = CreateEmote({CATEGORY.REACTIONS}, L["blink"], L["blink_target"], REACTION.NONE, false),
	["blush"] = CreateEmote({CATEGORY.AFFECTION}, L["blush"], L["blush_target"], REACTION.ACTION, false),
	["boggle"] = CreateEmote({CATEGORY.REACTIONS}, L["boggle"], L["boggle_target"], REACTION.ACTION, false),
	["bonk"] = CreateEmote({CATEGORY.REACTIONS}, L["bonk"], L["bonk_target"], REACTION.NONE, false),
	["boop"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.HAPPY, CATEGORY.NEUTRAL, CATEGORY.AFFECTION, CATEGORY.GREETINGS}, L["boop"], L["boop_target"], REACTION.ACTION, false),
	["bored"] = CreateEmote({CATEGORY.UNHAPPY}, L["bored"], L["bored_target"], REACTION.VOCAL, false),
	["bounce"] = CreateEmote({CATEGORY.HAPPY}, L["bounce"], L["bounce_target"], REACTION.NONE, false),
	["bow"] = CreateEmote({CATEGORY.GREETINGS}, L["bow"], L["bow_target"], REACTION.ACTION, false),
	["brandish"] = CreateEmote({CATEGORY.HOSTILE}, L["brandish"], L["brandish_target"], REACTION.NONE, false),
	["brb"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.COMBAT, CATEGORY.REACTIONS}, L["brb"], L["brb_target"], REACTION.NONE, false),
	
	-- C
	["cackle"] = CreateEmote({CATEGORY.HAPPY}, L["cackle"], L["cackle_target"], REACTION.AV, false),
	["calm"] = CreateEmote({CATEGORY.NEUTRAL}, L["calm"], L["calm_target"], REACTION.NONE, false),
	["charge"] = CreateEmote({CATEGORY.COMBAT}, L["charge"], L["charge_target"], REACTION.AV, false),
	["cheer"] = CreateEmote({CATEGORY.HAPPY, CATEGORY.REACTIONS}, L["cheer"], L["cheer_target"], REACTION.AV, false),
	["chicken"] = CreateEmote({CATEGORY.TAUNTS}, L["chicken"], L["chicken_target"], REACTION.AV, false),
	["chuckle"] = CreateEmote({CATEGORY.HAPPY}, L["chuckle"], L["chuckle_target"], REACTION.AV, false),
	["clap"] = CreateEmote({CATEGORY.HAPPY, CATEGORY.REACTIONS}, L["clap"], L["clap_target"], REACTION.AV, false),
	["cold"] = CreateEmote({CATEGORY.OTHER}, L["cold"], L["cold_target"], REACTION.NONE, false),
	["comfort"] = CreateEmote({CATEGORY.AFFECTION}, L["comfort"], L["comfort_target"], REACTION.NONE, false),
	["commend"] = CreateEmote({CATEGORY.COMBAT}, L["commend"], L["commend_target"], REACTION.AV, false),
	["confused"] = CreateEmote({CATEGORY.SELF_DEPRECATING, CATEGORY.REACTIONS}, L["confused"], L["confused_target"], REACTION.ACTION, false),
	["congrats"] = CreateEmote({CATEGORY.COMBAT, CATEGORY.REACTIONS}, L["congrats"], L["congrats_target"], REACTION.AV, false),
	["cough"] = CreateEmote({CATEGORY.OTHER}, L["cough"], L["cough_target"], REACTION.NONE, false),
	["cower"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["cower"], L["cower_target"], REACTION.NONE, false),
	["crack"] = CreateEmote({CATEGORY.HOSTILE}, L["crack"], L["crack_target"], REACTION.NONE, false),
	["cringe"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["cringe"], L["cringe_target"], REACTION.NONE, false),
	["cry"] = CreateEmote({CATEGORY.UNHAPPY}, L["cry"], L["cry_target"], REACTION.AV, false),
	["cuddle"] = CreateEmote({CATEGORY.AFFECTION}, L["cuddle"], L["cuddle_target"], REACTION.NONE, false),
	["curious"] = CreateEmote({CATEGORY.REACTIONS}, L["curious"], L["curious_target"], REACTION.ACTION, false),
	["curtsey"] = CreateEmote({CATEGORY.GREETINGS}, L["curtsey"], L["curtsey_target"], REACTION.ACTION, false),
	
	-- D
	["dance"] = CreateEmote({CATEGORY.HAPPY, CATEGORY.AFFECTION}, L["dance"], L["dance_target"], REACTION.ACTION, false),
	["ding"] = CreateEmote({CATEGORY.HAPPY, CATEGORY.NEUTRAL}, L["ding"], L["ding_target"], REACTION.NONE, false),
	["doom"] = CreateEmote({CATEGORY.HOSTILE}, L["doom"], L["doom_target"], REACTION.NONE, false),
	["drink"] = CreateEmote({CATEGORY.FRIENDLY}, L["drink"], L["drink_target"], REACTION.ACTION, false),
	["drool"] = CreateEmote({CATEGORY.OTHER}, L["drool"], L["drool_target"], REACTION.NONE, false),
	["duck"] = CreateEmote({CATEGORY.REACTIONS}, L["duck"], L["duck_target"], REACTION.NONE, false),
	
	-- E
	["eat"] = CreateEmote({CATEGORY.OTHER}, L["eat"], L["eat_target"], REACTION.ACTION, false),
	["excited"] = CreateEmote({CATEGORY.FRIENDLY}, L["excited"], L["excited"], REACTION.ACTION, false),
	["eye"] = CreateEmote({CATEGORY.OTHER}, L["eye"], L["eye_target"], REACTION.NONE, false),
	
	-- F
	["facepalm"] = CreateEmote({CATEGORY.TAUNTS, CATEGORY.REACTIONS}, L["facepalm"], L["facepalm_target"], REACTION.NONE, false),
	["fart"] = CreateEmote({CATEGORY.TAUNTS, CATEGORY.SELF_DEPRECATING}, L["fart"], L["fart_target"], REACTION.NONE, false),
	["fidget"] = CreateEmote({CATEGORY.UNHAPPY}, L["fidget"], L["fidget_target"], REACTION.NONE, false),
	["flee"] = CreateEmote({CATEGORY.COMBAT}, L["flee"], L["flee_target"], REACTION.AV, false),
	["flex"] = CreateEmote({CATEGORY.AFFECTION}, L["flex"], L["flex_target"], REACTION.ACTION, false),
	["flirt"] = CreateEmote({CATEGORY.AFFECTION}, L["flirt"], L["flirt_target"], REACTION.AV, false),
	["flop"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["flop"], L["flop_target"], REACTION.NONE, false),
	["followme"] = CreateEmote({CATEGORY.COMBAT}, L["followme"], L["followme_target"], REACTION.AV, false),
	["frown"] = CreateEmote({CATEGORY.UNHAPPY}, L["frown"], L["frown_target"], REACTION.NONE, false),
	
	-- G
	["gasp"] = CreateEmote({CATEGORY.REACTIONS}, L["gasp"], L["gasp_target"], REACTION.ACTION, false),
	["gaze"] = CreateEmote({CATEGORY.OTHER}, L["gaze"], L["gaze_target"], REACTION.NONE, false),
	["giggle"] = CreateEmote({CATEGORY.HAPPY}, L["giggle"], L["giggle_target"], REACTION.AV, false),
	["glare"] = CreateEmote({CATEGORY.HOSTILE}, L["glare"], L["glare_target"], REACTION.NONE, false),
	["gloat"] = CreateEmote({CATEGORY.TAUNTS}, L["gloat"], L["gloat_target"], REACTION.AV, false),
	["golfclap"] = CreateEmote({CATEGORY.TAUNTS}, L["golfclap"], L["golfclap_target"], REACTION.AV, false),
	["goodbye"] = CreateEmote({CATEGORY.GREETINGS}, L["goodbye"], L["goodbye_target"], REACTION.AV, false),
	["greet"] = CreateEmote({CATEGORY.GREETINGS}, L["greet"], L["greet_target"], REACTION.ACTION, false),
	["grin"] = CreateEmote({CATEGORY.HAPPY}, L["grin"], L["grin_target"], REACTION.NONE, false),
	["groan"] = CreateEmote({CATEGORY.OTHER}, L["groan"], L["groan_target"], REACTION.NONE, false),
	["grovel"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["grovel"], L["grovel_target"], REACTION.ACTION, false),
	["growl"] = CreateEmote({CATEGORY.HOSTILE}, L["growl"], L["growl_target"], REACTION.ACTION, false),
	["guffaw"] = CreateEmote({CATEGORY.HAPPY}, L["guffaw"], L["guffaw_target"], REACTION.AV, false),
	
	-- H
	["hail"] = CreateEmote({CATEGORY.GREETINGS}, L["hail"], L["hail_target"], REACTION.ACTION, false),
	["happy"] = CreateEmote({CATEGORY.HAPPY}, L["happy"], L["happy_target"], REACTION.NONE, false),
	["healme"] = CreateEmote({CATEGORY.COMBAT}, L["healme"], L["healme_target"], REACTION.AV, false),
	["hello"] = CreateEmote({CATEGORY.GREETINGS}, L["hello"], L["hello_target"], REACTION.AV, false),
	["helpme"] = CreateEmote({CATEGORY.COMBAT}, L["helpme"], L["helpme_target"], REACTION.AV, false),
	["highfive"] = CreateEmote({CATEGORY.HAPPY, CATEGORY.GREETINGS, CATEGORY.REACTIONS}, L["highfive"], L["highfive_target"], REACTION.NONE, false),
	["holdhand"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.UNHAPPY, CATEGORY.AFFECTION}, L["holdhand"], L["holdhand_target"], REACTION.NONE, false),
	["hug"] = CreateEmote({CATEGORY.AFFECTION}, L["hug"], L["hug_target"], REACTION.NONE, false),
	["hungry"] = CreateEmote({CATEGORY.NEUTRAL}, L["hungry"], L["hungry_target"], REACTION.NONE, false),
	["huzzah"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.AFFECTION, CATEGORY.REACTIONS}, L["huzzah"], L["huzzah_target"], REACTION.ACTION, false),

	-- I
	["impressed"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.AFFECTION, CATEGORY.REACTIONS}, L["impressed"], L["impressed_target"], REACTION.AV, false),
	["incoming"] = CreateEmote({CATEGORY.COMBAT}, L["incoming"], L["incoming_target"], REACTION.AV, false),
	["insult"] = CreateEmote({CATEGORY.TAUNTS}, L["insult"], L["insult_target"], REACTION.ACTION, false),
	["introduce"] = CreateEmote({CATEGORY.GREETINGS}, L["introduce"], L["introduce_target"], REACTION.NONE, false),

	-- J
	["jk"] = CreateEmote({CATEGORY.OTHER}, L["jk"], L["jk_target"], REACTION.NONE, false),

	-- K
	["kiss"] = CreateEmote({CATEGORY.AFFECTION}, L["kiss"], L["kiss_target"], REACTION.AV, false),
	["kneel"] = CreateEmote({CATEGORY.NEUTRAL}, L["kneel"], L["kneel_target"], REACTION.ACTION, false),
	
	-- L
	["laugh"] = CreateEmote({CATEGORY.HAPPY}, L["laugh"], L["laugh_target"], REACTION.AV, false),
	["lavish"] = CreateEmote({CATEGORY.FRIENDLY}, L["lavish"], L["lavish_target"], REACTION.NONE, false),
	["lay"] = CreateEmote({CATEGORY.NEUTRAL}, L["lay"], L["lay_target"], REACTION.ACTION, false),
	["lick"] = CreateEmote({CATEGORY.AFFECTION}, L["lick"], L["lick_target"], REACTION.NONE, false),
	["listen"] = CreateEmote({CATEGORY.FRIENDLY}, L["listen"], L["listen_target"], REACTION.NONE, false),
	["lost"] = CreateEmote({CATEGORY.UNHAPPY}, L["lost"], L["lost_target"], REACTION.ACTION, false),
	["love"] = CreateEmote({CATEGORY.AFFECTION}, L["love"], L["love_target"], REACTION.NONE, false),
	
	-- M
	["magnificent"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.AFFECTION, CATEGORY.REACTIONS}, L["magnificent"], L["magnificent_target"], REACTION.ACTION, false),
	["massage"] = CreateEmote({CATEGORY.AFFECTION}, L["massage"], L["massage_target"], REACTION.NONE, false),
	["meow"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.HAPPY, CATEGORY.AFFECTION, CATEGORY.GREETINGS}, L["meow"], L["meow_target"], REACTION.NONE, false),
	["mock"] = CreateEmote({CATEGORY.UNHAPPY}, L["mock"], L["mock_target"], REACTION.NONE, false),
	["moo"] = CreateEmote({CATEGORY.GREETINGS}, L["moo"], L["moo_target"], REACTION.VOCAL, false),
	["moon"] = CreateEmote({CATEGORY.TAUNTS}, L["moon"], L["moon_target"], REACTION.NONE, false),
	["mourn"] = CreateEmote({CATEGORY.OTHER}, L["mourn"], L["mourn_target"], REACTION.AV, false),
	
	-- N
	["no"] = CreateEmote({CATEGORY.NEUTRAL}, L["no"], L["no_target"], REACTION.AV, false),
	["nod"] = CreateEmote({CATEGORY.NEUTRAL}, L["nod"], L["nod_target"], REACTION.AV, false),
	["nosepick"] = CreateEmote({CATEGORY.OTHER}, L["nosepick"], L["nosepick_target"], REACTION.NONE, false),
	
	-- O
	["oom"] = CreateEmote({CATEGORY.COMBAT}, L["oom"], L["oom_target"], REACTION.AV, false),
	["openfire"] = CreateEmote({CATEGORY.COMBAT}, L["openfire"], L["openfire_target"], REACTION.AV, false),
	
	-- P
	["panic"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["panic"], L["panic_target"], REACTION.NONE, false),
	["pat"] = CreateEmote({CATEGORY.AFFECTION}, L["pat"], L["pat_target"], REACTION.NONE, false),
	["peer"] = CreateEmote({CATEGORY.NEUTRAL}, L["peer"], L["peer_target"], REACTION.NONE, false),
	["pity"] = CreateEmote({CATEGORY.TAUNTS}, L["pity"], L["pity_target"], REACTION.NONE, false),
	["plead"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["plead"], L["plead_target"], REACTION.ACTION, false),
	["point"] = CreateEmote({CATEGORY.COMBAT}, L["point"], L["point_target"], REACTION.ACTION, false),
	["poke"] = CreateEmote({CATEGORY.NEUTRAL}, L["poke"], L["poke_target"], REACTION.NONE, false),
	["ponder"] = CreateEmote({CATEGORY.REACTIONS}, L["ponder"], L["ponder_target"], REACTION.ACTION, false),
	["pounce"] = CreateEmote({CATEGORY.AFFECTION}, L["pounce"], L["pounce_target"], REACTION.NONE, false),
	["pray"] = CreateEmote({CATEGORY.NEUTRAL}, L["pray"], L["pray_target"], REACTION.ACTION, false),
	["purr"] = CreateEmote({CATEGORY.AFFECTION}, L["purr"], L["purr_target"], REACTION.NONE, false),
	["puzzled"] = CreateEmote({CATEGORY.REACTIONS}, L["puzzled"], L["puzzled_target"], REACTION.ACTION, false),

	-- Q
	["quack"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.TAUNTS, CATEGORY.AFFECTION, CATEGORY.GREETINGS, CATEGORY.REACTIONS}, L["quack"], L["quack_target"], REACTION.ACTION, false),
	["question"] = CreateEmote({CATEGORY.OTHER}, L["question"], L["question_target"], REACTION.ACTION, false),
	
	-- R
	["raise"] = CreateEmote({CATEGORY.OTHER}, L["raise"], L["raise_target"], REACTION.NONE, false),
	["rasp"] = CreateEmote({CATEGORY.TAUNTS}, L["rasp"], L["rasp_target"], REACTION.AV, false),
	["ready"] = CreateEmote({CATEGORY.COMBAT}, L["ready"], L["ready_target"], REACTION.NONE, false),
	["regret"] = CreateEmote({CATEGORY.HOSTILE, CATEGORY.UNHAPPY, CATEGORY.TAUNTS, CATEGORY.COMBAT, CATEGORY.REACTIONS}, L["regret"], L["regret_target"], REACTION.NONE, false),
	["roar"] = CreateEmote({CATEGORY.HOSTILE}, L["roar"], L["roar_target"], REACTION.ACTION, false),
	["rofl"] = CreateEmote({CATEGORY.HAPPY}, L["rofl"], L["rofl_target"], REACTION.AV, false),
	["rolleyes"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.REACTIONS}, L["rolleyes"], L["rolleyes_target"], REACTION.AV, false),
	["rude"] = CreateEmote({CATEGORY.TAUNTS}, L["rude"], L["rude_target"], REACTION.ACTION, false),
	
	-- S
	["salute"] = CreateEmote({CATEGORY.FRIENDLY}, L["salute"], L["salute_target"], REACTION.ACTION, false),
	["scared"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["scared"], L["scared_target"], REACTION.NONE, false),
	["scratch"] = CreateEmote({CATEGORY.OTHER}, L["scratch"], L["scratch_target"], REACTION.NONE, false),
	["sexy"] = CreateEmote({CATEGORY.AFFECTION}, L["sexy"], L["sexy_target"], REACTION.NONE, false),
	["shimmy"] = CreateEmote({CATEGORY.OTHER}, L["shimmy"], L["shimmy_target"], REACTION.NONE, false),
	["shiver"] = CreateEmote({CATEGORY.OTHER}, L["shiver"], L["shiver_target"], REACTION.NONE, false),
	["shoo"] = CreateEmote({CATEGORY.TAUNTS}, L["shoo"], L["shoo_target"], REACTION.NONE, false),
	["shrug"] = CreateEmote({CATEGORY.REACTIONS}, L["shrug"], L["shrug_target"], REACTION.ACTION, false),
	["shy"] = CreateEmote({CATEGORY.AFFECTION}, L["shy"], L["shy_target"], REACTION.ACTION, false),
	["sigh"] = CreateEmote({CATEGORY.UNHAPPY}, L["sigh"], L["sigh_target"], REACTION.VOCAL, false),
	["silly"] = CreateEmote({CATEGORY.HAPPY}, L["silly"], L["silly_target"], REACTION.AV, false),
	["slap"] = CreateEmote({CATEGORY.TAUNTS}, L["slap"], L["slap_target"], REACTION.NONE, false),
	["sleep"] = CreateEmote({CATEGORY.OTHER}, L["sleep"], L["sleep_target"], REACTION.ACTION, false),
	["smile"] = CreateEmote({CATEGORY.HAPPY}, L["smile"], L["smile_target"], REACTION.NONE, false),
	["smirk"] = CreateEmote({CATEGORY.HAPPY}, L["smirk"], L["smirk_target"], REACTION.NONE, false),
	["snarl"] = CreateEmote({CATEGORY.HOSTILE}, L["snarl"], L["snarl_target"], REACTION.NONE, false),
	["snicker"] = CreateEmote({CATEGORY.HAPPY}, L["snicker"], L["snicker_target"], REACTION.NONE, false),
	["sniff"] = CreateEmote({CATEGORY.REACTIONS}, L["sniff"], L["sniff_target"], REACTION.NONE, false),
	["snub"] = CreateEmote({CATEGORY.HOSTILE}, L["snub"], L["snub_target"], REACTION.NONE, false),
	["soothe"] = CreateEmote({CATEGORY.AFFECTION}, L["soothe"], L["soothe_target"], REACTION.NONE, false),
	["stare"] = CreateEmote({CATEGORY.HOSTILE}, L["stare"], L["stare_target"], REACTION.NONE, false),
	["surprised"] = CreateEmote({CATEGORY.REACTIONS}, L["surprised"], L["surprised_target"], REACTION.NONE, false),
	["surrender"] = CreateEmote({CATEGORY.UNHAPPY}, L["surrender"], L["surrender_target"], REACTION.ACTION, false),
	
	-- T
	["talk"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.GREETINGS, CATEGORY.REACTIONS, CATEGORY.OTHER}, L["talk"], L["talk_target"], REACTION.ACTION, false),
	["tap"] = CreateEmote({CATEGORY.REACTIONS}, L["tap"], L["tap_target"], REACTION.NONE, false),
	["taunt"] = CreateEmote({CATEGORY.TAUNTS}, L["taunt"], L["taunt_target"], REACTION.NONE, false),
	["tease"] = CreateEmote({CATEGORY.AFFECTION}, L["tease"], L["tease_target"], REACTION.NONE, false),
	["thank"] = CreateEmote({CATEGORY.FRIENDLY}, L["thank"], L["thank_target"], REACTION.NONE, false),
	["think"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.REACTIONS}, L["think"], L["think_target"], REACTION.NONE, false),
	["thirsty"] = CreateEmote({CATEGORY.OTHER}, L["thirsty"], L["thirsty_target"], REACTION.NONE, false),
	["tickle"] = CreateEmote({CATEGORY.AFFECTION}, L["tickle"], L["tickle_target"], REACTION.NONE, false),
	["tired"] = CreateEmote({CATEGORY.OTHER}, L["tired"], L["tired_target"], REACTION.NONE, false),
	["train"] = CreateEmote({CATEGORY.REACTIONS, CATEGORY.OTHER}, L["train"], L["train_target"], REACTION.AV, false),
	
	-- U

	-- V
	["veto"] = CreateEmote({CATEGORY.OTHER}, L["veto"], L["veto_target"], REACTION.NONE, false),
	["victory"] = CreateEmote({CATEGORY.REACTIONS}, L["victory"], L["victory_target"], REACTION.ACTION, false),
	["violin"] = CreateEmote({CATEGORY.TAUNTS}, L["violin"], L["violin_target"], REACTION.AV, false),

	-- W
	["wait"] = CreateEmote({CATEGORY.COMBAT}, L["wait"], L["wait_target"], REACTION.AV, false),
	["wave"] = CreateEmote({CATEGORY.GREETINGS}, L["wave"], L["wave_target"], REACTION.NONE, false),
	["welcome"] = CreateEmote({CATEGORY.GREETINGS}, L["welcome"], L["welcome_target"], REACTION.AV, false),
	["whine"] = CreateEmote({CATEGORY.SELF_DEPRECATING}, L["whine"], L["whine_target"], REACTION.NONE, false),
	["whistle"] = CreateEmote({CATEGORY.OTHER}, L["whistle"], L["whistle_target"], REACTION.VOCAL, false),
	["whoa"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.REACTIONS}, L["whoa"], L["whoa_target"], REACTION.AV, false),
	["wince"] = CreateEmote({CATEGORY.NEUTRAL, CATEGORY.REACTIONS}, L["wince"], L["wince_target"], REACTION.NONE, false),
	["wink"] = CreateEmote({CATEGORY.AFFECTION}, L["wink"], L["wink_target"], REACTION.NONE, false),
	["work"] = CreateEmote({CATEGORY.OTHER}, L["work"], L["work_target"], REACTION.NONE, false),

	-- X

	-- Y
	["yawn"] = CreateEmote({CATEGORY.OTHER}, L["yawn"], L["yawn_target"], REACTION.VOCAL, false),
	["yw"] = CreateEmote({CATEGORY.FRIENDLY, CATEGORY.REACTIONS}, L["yw"], L["yw_target"], REACTION.AV, false),

	-- Z
}

--------------------------------------------------------------------------------
-- Utility Functions (Optional - for future enhancements)
--------------------------------------------------------------------------------

-- Get all emotes in a specific category
function EmoteLDB:GetEmotesInCategory(categoryId)
	local emotes = {}
	for key, data in pairs(EL_Emotes) do
		for _, typeId in ipairs(data.types) do
			if typeId == categoryId then
				emotes[key] = data
				break
			end
		end
	end
	return emotes
end

-- Check if an emote is custom
function EmoteLDB:IsCustomEmote(emoteKey)
	local emote = EL_Emotes[emoteKey]
	return emote and emote.custom[1] == 1
end

-- Get emote count for debugging
function EmoteLDB:GetEmoteCount()
	local count = 0
	for _ in pairs(EL_Emotes) do
		count = count + 1
	end
	return count
end