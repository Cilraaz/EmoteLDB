local addonName, addon = ...
function addon:LoadTranslations(AL)
  local debug = nil
  --[===[@debug@
  debug = true
  --@end-debug@]===]
  
  local locale = GetLocale()
  local L = AL:NewLocale(addonName, locale, true, debug)
  --local L = AL:NewLocale(addonName, "enUS", true, debug)
  
  if locale ~= "enUS" and locale ~= "deDE" and locale ~= "ruRU" then
    locale = "enUS"
  end
  
  if locale == "enUS" then
  
    -- Random addon strings
    L["Last Emote Used"] = true
    L["Custom:  "] = true -- Label for custom emotes
    L["Toggle the display of slash commands."] = true
    L["Currently: "] = true
    L["Toggle the display of the minimap button"] = true
    L["EmoteLDB version: "] = true

    -- Emote Data EL_Types
    L["Friendly"] = true
    L["Hostile"] = true
    L["Happy"] = true
    L["Neutral"] = true
    L["Unhappy"] = true
    L["Custom"] = true
    L["Taunts"] = true
    L["Affection"] = true
    L["Greetings"] = true
    L["Combat"] = true
    L["Self-Deprecating"] = true
    L["Reactions"] = true
    L["Other"] = true

    -- Genders
    L["He"] = true
    L["His"] = true
    L["he"] = true
    L["his"] = true
    L["She"] = true
    L["Her"] = true
    L["she"] = true
    L["her"] = true

    -- Reactions
    L["Action"] = true -- "A"ction shortened
    L["Vocal"] = true -- "V"ocal shortened
    L["AV"] = true -- "A"ction/"V"ocal shortened

    -- Actual addon texts
    -- Same order as in EmoteData.lua

    -- First (emote name only) is text produced
    -- when there is no target.  Second (_target)
    -- is what's produced when there is a target

    -- The following tags:
    -- <Target>, <He>, <he>, <She>, <she>
    -- <His>, <his>, <Her>, <her>
    -- MUST, MUST, MUST remain as is to work
    -- They are localized above

    L["escape"] = "coughs nervously and looks for an escape."
    L["escape_target"] = "coughs nervously at <Target> and looks for an escape."

    L["bio"] = "needs to take a bio break."
    L["bio_target"] = "tells <Target> that <he> needs a bio break."

    L["bladeintro"] = "wants to introduce <his> blade to someone."
    L["bladeintro_target"] = "wants to introduce <Target> to <his> blade."
    
    L["mountspecial"] = "Perform /mountspecial."
    L["mountspecial_target"] = "Perform /mountspecial."

    L["agree"] = "You agree."
    L["agree_target"] = "You agree with <Target>."

    L["amaze"] = "You are amazed!"
    L["amaze_target"] = "You are amazed by <Target>!"

    L["angry"] = "You raise your fist in anger."
    L["angry_target"] = "You raise your fist in anger at <Target>."

    L["apologize"] = "You apologize to everyone. Sorry!"
    L["apologize_target"] = "You apologize to <Target>. Sorry!"

    L["applaud"] = "You applaud. Bravo!"
    L["applaud_target"] = "You applaud at <Target>. Bravo!"

    L["arm"] = "You stretch your arms out."
    L["arm_target"] = "You put your arm around <Target>'s shoulder."

    L["attacktarget"] = "You tell everyone to attack something."
    L["attacktarget_target"] = "You tell everyone to attack <Target>."

    L["bark"] = "You bark. Woof woof!"
    L["bark_target"] = "You bark at <Target>"

    L["bashful"] = "You are bashful."
    L["bashful_target"] = "You are so bashful...too bashful to get <Target>'s attention."

    L["beckon"] = "You beckon everyone over to you."
    L["beckon_target"] = "You beckon <Target> over."

    L["beg"] = "You beg everyone around you. How pathetic."
    L["beg_target"] = "You beg <Target>. How pathetic."

    L["belch"] = "You let out a loud belch."
    L["belch_target"] = "You let out a loud belch."

    L["bite"] = "You look around for someone to bite."
    L["bite_target"] = "You bite <Target>. Ouch!"

    L["bleed"] = "Blood oozes from your wounds."
    L["bleed_target"] = "Blood oozes from your wounds."

    L["blink"] = "You blink your eyes."
    L["blink_target"] = "You blink at <Target>."

    L["blush"] = "You blush."
    L["blush_target"] = "You blush at <Target>."

    L["boggle"] = "You boggle at the situation."
    L["boggle_target"] = "You boggle at <Target>."

    L["bonk"] = "You bonk yourself on the noggin. Doh!"
    L["bonk_target"] = "You bonk <Target> on the noggin. Doh!"

    L["boop"] = "You boop your own nose. Boop!"
    L["boop_target"] = "You boop <Target>'s nose."

    L["bored"] = "You are overcome with boredom. Oh the drudgery!"
    L["bored_target"] = "You are terribly bored with <Target>."

    L["bounce"] = "You bounce up and down."
    L["bounce_target"] = "You bounce up and down in front of <Target>."

    L["bow"] = "You bow down graciously."
    L["bow_target"] = "You bow before <Target>."
    
    L["brandish"] = "You brandish your weapon fiercely."
    L["brandish_target"] = "You brandish your weapon fiercely at <Target>."

    L["brb"] = "You let everyone know you'll be right back."
    L["brb_target"] = "You let <Target> know you'll be right back."

    L["cackle"] = "You cackle maniacally at the situation."
    L["cackle_target"] = "You cackle maniacally at <Target>."

    L["calm"] = "You remain calm."
    L["calm_target"] = "You try to calm <Target> down."

    L["charge"] = "You start to charge."
    L["charge_target"] = "You start to charge."

    L["cheer"] = "You cheer!"
    L["cheer_target"] = "You cheer at <Target>."

    L["chicken"] = "With arms flapping, you strut around. Cluck, Cluck, Chicken!"
    L["chicken_target"] = "With arms flapping, you strut around <Target>. Cluck, Cluck, Chicken!"

    L["chuckle"] = "You let out a hearty chuckle."
    L["chuckle_target"] = "You chuckle at <Target>."

    L["clap"] = "You clap excitedly."
    L["clap_target"] = "You clap excitedly for <Target>."

    L["cold"] = "You let everyone know that you are cold."
    L["cold_target"] = "You let <Target> know that you are cold."

    L["comfort"] = "You need to be comforted."
    L["comfort_target"] = "You comfort <Target>."

    L["commend"] = "You commend everyone on a job well done."
    L["commend_target"] = "You commend <Target> on a job well done."

    L["confused"] = "You are hopelessly confused."
    L["confused_target"] = "You look at <Target> with a confused look."

    L["congrats"] = "You congratulate everyone around you."
    L["congrats_target"] = "You congratulate <Target>."

    L["cough"] = "You let out a hacking cough."
    L["cough_target"] = "You let out a hacking cough."

    L["cower"] = "You cower in fear."
    L["cower_target"] = "You cower in fear at the sight of <Target>."

    L["crack"] = "You crack your knuckles."
    L["crack_target"] = "You crack your knuckles while staring at <Target>."

    L["cringe"] = "You cringe in fear."
    L["cringe_target"] = "You cringe away from <Target>."

    L["cry"] = "You cry."
    L["cry_target"] = "You cry on <Target>'s shoulder."

    L["cuddle"] = "You need to be cuddled."
    L["cuddle_target"] = "You cuddle up against <Target>."

    L["curious"] = "You express your curiosity to those around you."
    L["curious_target"] = "You are curious what <Target> is up to."

    L["curtsey"] = "You curtsey."
    L["curtsey_target"] = "You curtsey before <Target>."

    L["dance"] = "You burst into dance."
    L["dance_target"] = "You dance with <Target>."
    
    L["ding"] = "You reached a new level. DING!"
    L["ding_target"] = "You congratulate <Target> on a new level. DING!"

    L["doom"] = "You threaten everyone with the wrath of doom."
    L["doom_target"] = "You threaten <Target> with the wrath of doom."

    L["drink"] = "You raise a drink in the air before chugging it down. Cheers!"
    L["drink_target"] = "You raise a drink to <Target>. Cheers!"

    L["drool"] = "A tendril of drool runs down your lip."
    L["drool_target"] = "A tendril of drool runs down your lip."

    L["duck"] = "You duck for cover."
    L["duck_target"] = "You duck behind <Target>."

    L["eat"] = "You begin to eat."
    L["eat_target"] = "You begin to eat in front of <Target>."

    L["excited"] = "You talk excitedly with everyone."
    L["excited_target"] = "You talk excitedly with <Target>."

    L["eye"] = "You cross your eyes."
    L["eye_target"] = "You eye <Target> up and down."

    L["facepalm"] = "You cover your face with your palm."
    L["facepalm_target"] = "You look over at <Target> and cover your face with your palm."

    L["fart"] = "You fart loudly. Whew...what stinks?"
    L["fart_target"] = "You brush up against <Target> and fart loudly."

    L["fidget"] = "You fidget."
    L["fidget_target"] = "You fidget impatiently while waiting for <Target>."

    L["flee"] = "You yell for everyone to flee!"
    L["flee_target"] = "You yell for everyone to flee!"

    L["flex"] = "You flex your muscles. Oooooh so strong!"
    L["flex_target"] = "You flex at <Target>. Oooooh so strong!"

    L["flirt"] = "You flirt."
    L["flirt_target"] = "You flirt with <Target>."

    L["flop"] = "You flop about helplessly."
    L["flop_target"] = "You flop about helplessly around <Target>."

    L["followme"] = "You motion for everyone to follow."
    L["followme_target"] = "You motion for <Target> to follow."

    L["frown"] = "You frown."
    L["frown_target"] = "You frown with disappointment at <Target>."

    L["gasp"] = "You gasp."
    L["gasp_target"] = "You gasp at <Target>."

    L["gaze"] = "You gaze off into the distance."
    L["gaze_target"] = "You gaze eagerly at <Target>."

    L["giggle"] = "You giggle."
    L["giggle_target"] = "You giggle at <Target>."

    L["glare"] = "You glare angrily."
    L["glare_target"] = "You glare angrily at <Target>."

    L["gloat"] = "You gloat over everyone's misfortune."
    L["gloat_target"] = "You gloat over <Target>'s misfortune."

    L["golfclap"] = "You clap half heartedly, clearly unimpressed."
    L["golfclap_target"] = "You clap for <Target>, clearly unimpressed."

    L["goodbye"] = "You wave goodbye to everyone. Farewell!"
    L["goodbye_target"] = "You wave goodbye to <Target>. Farewell!"

    L["greet"] = "You greet everyone warmly."
    L["greet_target"] = "You greet <Target> warmly."

    L["grin"] = "You grin wickedly."
    L["grin_target"] = "You grin wickedly at <Target>."

    L["groan"] = "You begin to groan in pain."
    L["groan_target"] = "You look at <Target> and groan in pain."

    L["grovel"] = "You grovel on the ground, wallowing in subservience."
    L["grovel_target"] = "You grovel before <Target> like a subservient peon."

    L["growl"] = "You growl menacingly."
    L["growl_target"] = "You growl menacingly at <Target>."

    L["guffaw"] = "You let out a boisterous guffaw!"
    L["guffaw_target"] = "You take one look at <Target> and let out a guffaw!"

    L["hail"] = "You hail those around you."
    L["hail_target"] = "You hail <Target>."

    L["happy"] = "You are filled with happiness!"
    L["happy_target"] = "You are very happy with <Target>!"

    L["healme"] = "You call out for healing!"
    L["healme_target"] = "You call out for healing!"

    L["hello"] = "You greet everyone with a hearty hello!"
    L["hello_target"] = "You greet <Target> with a hearty hello!"

    L["helpme"] = "You cry out for help!"
    L["helpme_target"] = "You cry out for help!"

    L["highfive"] = "You put up your hand for a high five."
    L["highfive_target"] = "You give <Target> a high five!"

    L["holdhand"] = "You wish someone would hold your hand."
    L["holdhand_target"] = "You hold <Target>'s hand."

    L["hug"] = "You need a hug!"
    L["hug_target"] = "You hug <Target>."

    L["hungry"] = "You are hungry!"
    L["hungry_target"] = "You are hungry. Maybe <Target> has some food..."

    L["huzzah"] = "You cheer boisterously! Huzzah!"
    L["huzzah_target"] = "You cheer boisterously for <Target>! Huzzah!"

    L["impressed"] = "You clap vigorously, clearly impressed."
    L["impressed_target"] = "You clap vigorously for <Target>, clearly impressed."

    L["incoming"] = "You yell incoming enemies!"
    L["incoming_target"] = "You yell incoming enemies!"

    L["insult"] = "You think everyone around you is a son of a motherless ogre."
    L["insult_target"] = "You think <Target> is the son of a motherless ogre."

    L["introduce"] = "You introduce yourself to everyone."
    L["introduce_target"] = "You introduce yourself to <Target>."

    L["jk"] = "You were just kidding!"
    L["jk_target"] = "You let <Target> know that you were just kidding!"

    L["kiss"] = "You blow a kiss into the wind."
    L["kiss_target"] = "You blow a kiss to <Target>."

    L["kneel"] = "You kneel down."
    L["kneel_target"] = "You kneel before <Target>."

    L["laugh"] = "You laugh."
    L["laugh_target"] = "You laugh at <Target>."

    L["lavish"] = "You praise the Light."
    L["lavish_target"] = "You lavish praise upon <Target>."

    L["lay"] = "You lie down."
    L["lay_target"] = "You lie down before <Target>."

    L["lick"] = "You lick your lips."
    L["lick_target"] = "You lick <Target>."

    L["listen"] = "You are listening!"
    L["listen_target"] = "You listen intently to <Target>."

    L["lost"] = "You are hopelessly lost."
    L["lost_target"] = "You want <Target> to know that you are hopelessly lost."

    L["love"] = "You feel the love."
    L["love_target"] = "You love <Target>."

    L["magnificent"] = "You nod approvingly. Magnificent job!"
    L["magnificent_target"] = "You nod approvingly at <Target>. Magnificent job!"

    L["massage"] = "You need a massage!"
    L["massage_target"] = "You massage <Target>'s shoulders."
    
    L["meow"] = "You meow."
    L["meow_target"] = "You meow at <Target>."

    L["mock"] = "You mock life and all it stands for."
    L["mock_target"] = "You mock the foolishness of <Target>."

    L["moo"] = "Mooooooooooo."
    L["moo_target"] = "You moo at <Target>. Mooooooooooo."

    L["moon"] = "You drop your trousers and moon everyone."
    L["moon_target"] = "You drop your trousers and moon everyone."

    L["mourn"] = "In quiet contemplation, you mourn the loss of the dead."
    L["mourn_target"] = "In quiet contemplation, you mourn the death of <Target>."

    L["no"] = "You clearly state, NO."
    L["no_target"] = "You tell <Target> NO. Not going to happen."

    L["nod"] = "You nod."
    L["nod_target"] = "You nod at <Target>."

    L["nosepick"] = "With a finger deep in one nostril, you pass the time."
    L["nosepick_target"] = "You pick your nose and show it to <Target>."

    L["oom"] = "You announce that you have low mana!"
    L["oom_target"] = "You announce that you have low mana!"

    L["openfire"] = "You give the order to open fire."
    L["openfire_target"] = "You give the order to open fire."

    L["panic"] = "You run around in a frenzied state of panic."
    L["panic_target"] = "You take one look at <Target> and panic."

    L["pat"] = "You need a pat."
    L["pat_target"] = "You gently pat <Target>."

    L["peer"] = "You peer around, searchingly."
    L["peer_target"] = "You peer at <Target> searchingly."

    L["pity"] = "You pity those around you."
    L["pity_target"] = "You look down upon <Target> with pity."

    L["plead"] = "You drop to your knees and plead in desperation."
    L["plead_target"] = "You plead with <Target>."

    L["point"] = "You point over yonder."
    L["point_target"] = "You point at <Target>."

    L["poke"] = "You poke your belly and giggle."
    L["poke_target"] = "You poke <Target>. Hey!"

    L["ponder"] = "You ponder the situation."
    L["ponder_target"] = "You ponder <Target>'s actions."

    L["pounce"] = "You pounce out from the shadows."
    L["pounce_target"] = "You pounce towards <Target>."

    L["pray"] = "You pray to the Gods."
    L["pray_target"] = "You say a prayer for <Target>."

    L["purr"] = "You purr like a kitten."
    L["purr_target"] = "You purr at <Target>."

    L["puzzled"] = "You are puzzled. What's going on here?"
    L["puzzled_target"] = "You are puzzled by <Target>."

    L["question"] = "You want to know the meaning of life."
    L["question_target"] = "You question <Target>."

    L["raise"] = "You raise your hand in the air."
    L["raise_target"] = "You look at <Target> and raise your hand."

    L["rasp"] = "You make a rude gesture."
    L["rasp_target"] = "You make a rude gesture at <Target>."

    L["ready"] = "You let everyone know that you are ready!"
    L["ready_target"] = "You let <Target> know that you are ready!"
    
    L["regret"] = "You are filled with regret."
    L["regret_target"] = "You think that <Target> will regret it."

    L["roar"] = "You roar with bestial vigor. So fierce!"
    L["roar_target"] = "You roar with bestial vigor at <Target>. So fierce!"

    L["rofl"] = "You roll on the floor laughing."
    L["rofl_target"] = "You roll on the floor laughing at <Target>."
    
    L["rolleyes"] = "You roll your eyes."
    L["rolleyes_target"] = "You roll your eyes at <Target>."

    L["rude"] = "You make a rude gesture."
    L["rude_target"] = "You make a rude gesture at <Target>."

    L["salute"] = "You stand at attention and salute."
    L["salute_target"] = "You salute <Target> with respect."

    L["scared"] = "You are scared!"
    L["scared_target"] = "You are scared of <Target>."

    L["scratch"] = "You scratch yourself. Ah, much better!"
    L["scratch_target"] = "You scratch <Target>. How catty!"

    L["sexy"] = "You're too sexy for your tunic...so sexy it hurts."
    L["sexy_target"] = "You think <Target> is a sexy devil."

    L["shimmy"] = "You shimmy before the masses."
    L["shimmy_target"] = "You shimmy before <Target>."

    L["shiver"] = "You shiver in your boots. Chilling!"
    L["shiver_target"] = "You shiver beside <Target>. Chilling!"

    L["shoo"] = "You shoo the measly pests away."
    L["shoo_target"] = "You shoo <Target> away. Be gone pest!"

    L["shrug"] = "You shrug. Who knows?"
    L["shrug_target"] = "You shrug at <Target>. Who knows?"

    L["shy"] = "You smile shyly."
    L["shy_target"] = "You smile shyly at <Target>."

    L["sigh"] = "You let out a long, drawn-out sigh."
    L["sigh_target"] = "You sigh at <Target>."

    L["silly"] = "You tell a joke."
    L["silly_target"] = "You tell <Target> a joke."

    L["slap"] = "You slap yourself across the face. Ouch!"
    L["slap_target"] = "You slap <Target> across the face. Ouch!"

    L["sleep"] = "You fall asleep. Zzzzzzz."
    L["sleep_target"] = "You fall asleep. Zzzzzzz."

    L["smile"] = "You smile."
    L["smile_target"] = "You smile at <Target>."

    L["smirk"] = "A sly smirk spreads across your face."
    L["smirk_target"] = "You smirk slyly at <Target>."

    L["snarl"] = "You bare your teeth and snarl."
    L["snarl_target"] = "You bare your teeth and snarl at <Target>."

    L["snicker"] = "You quietly snicker to yourself."
    L["snicker_target"] = "You snicker at <Target>."

    L["sniff"] = "You sniff the air around you."
    L["sniff_target"] = "You sniff <Target>."

    L["snub"] = "You snub all of the lowly peons around you."
    L["snub_target"] = "You snub <Target>."

    L["soothe"] = "You need to be soothed."
    L["soothe_target"] = "You soothe <Target>. There, there...things will be ok."

    L["spit"] = "You spit on the ground."
    L["spit_target"] = "You spit on the ground."

    L["stare"] = "You stare off into the distance."
    L["stare_target"] = "You stare <Target> down."

    L["surprised"] = "You are so surprised!"
    L["surprised_target"] = "You are suprised by <Target>'s actions."

    L["surrender"] = "You surrender to your opponents."
    L["surrender_target"] = "You surrender before <Target>. Such is the agony of defeat..."

    L["talk"] = "You talk to yourself since no one else seems interested."
    L["talk_target"] = "You want to talk things over with <Target>."

    L["tap"] = "You tap your foot. Hurry up already!"
    L["tap_target"] = "You tap your foot as you wait for <Target>."

    L["taunt"] = "You taunt everyone around you. Bring it fools!"
    L["taunt_target"] = "You make a taunting gesture at <Target>. Bring it!"

    L["tease"] = "You are such a tease."
    L["tease_target"] = "You tease <Target>."

    L["thank"] = "You thank everyone around you."
    L["thank_target"] = "You thank <Target>."
    
    L["think"] = "You are lost in thought."
    L["think_target"] = "You think about <Target>."

    L["thirsty"] = "You are so thirsty. Can anyone spare a drink?"
    L["thirsty_target"] = "You let <Target> know you are thirsty. Spare a drink?"

    L["tickle"] = "You want to be tickled. Hee hee!"
    L["tickle_target"] = "You tickle <Target>. Hee hee!"

    L["tired"] = "You let everyone know that you are tired."
    L["tired_target"] = "You let <Target> know that you are tired."

    L["train"] = "Do the 'Choo Choo Train'!"
    L["train_target"] = "Do the 'Choo Choo Train'!"

    L["veto"] = "You veto the motion on the floor."
    L["veto_target"] = "You veto <Target>'s motion."

    L["victory"] = "You bask in the glory of victory."
    L["victory_target"] = "You bask in the glory of victory with <Target>."

    L["violin"] = "You begin to play the world's smallest violin."
    L["violin_target"] = "You play the world's smallest violin for <Target>."

    L["wait"] = "You ask everyone to wait."
    L["wait_target"] = "You ask <Target> to wait."

    L["wave"] = "You wave."
    L["wave_target"] = "You wave at <Target>."

    L["welcome"] = "You welcome everyone."
    L["welcome_target"] = "You welcome <Target>."

    L["whine"] = "You whine pathetically."
    L["whine_target"] = "You whine pathetically at <Target>."

    L["whistle"] = "You let forth a sharp whistle."
    L["whistle_target"] = "You let forth a sharp whistle."

    L["whoa"] = "You are blown away."
    L["whoa_target"] = "You are blown away by <Target>."

    L["wince"] = "You wince sympathetically."
    L["wince_target"] = "You wince sympathetically at <Target>. That looked like it hurt!"

    L["wink"] = "You wink slyly."
    L["wink_target"] = "You wink slyly at <Target>."

    L["work"] = "You begin to work."
    L["work_target"] = "You work with <Target>."

    L["yawn"] = "You yawn sleepily."
    L["yawn_target"] = "You yawn sleepily at <Target>."

    L["yw"] = "You were happy to help."
    L["yw_target"] = "You were happy to help <Target>."

  elseif locale == "deDE" then

    -- German translations courtesy of DirtyHarryGermany of Curse!
  
    -- Random addon strings
    L["Last Emote Used"] = "Zuletzt benutztes Emote"
    L["Custom:  "] = "Eigene:  " -- Label for custom emotes
    L["Toggle the display of slash commands."] = "Umschalten der Anzeige von Slash Befehlen."
    L["Currently: "] = "zur Zeit: "
    L["Toggle the display of the minimap button"] = "Umschalten der Anzeige des Minimap Button"
    L["EmoteLDB version: "] = true

    -- Emote Data EL_Types
    L["Friendly"] = "Freundlich"
    L["Hostile"] = "Feindlich"
    L["Happy"] = "Gl\195\188cklich"
    L["Neutral"] = true
    L["Unhappy"] = "Ungl\195\188cklich"
    L["Custom"] = "Eigene"
    L["Taunts"] = "Sticheleien"
    L["Affection"] = "Zuneigung"
    L["Greetings"] = "Gr\195\188sse"
    L["Combat"] = "Kampf"
    L["Self-Deprecating"] = "Selbsterniedrigung"
    L["Reactions"] = "Reaktionen"
    L["Other"] = "Sonstige"

    -- Genders
    L["He"] = "Er"
    L["His"] = "Sein"
    L["he"] = "er"
    L["his"] = "sein"
    L["She"] = "Sie"
    L["Her"] = "Ihr"
    L["she"] = "sie"
    L["her"] = "ihr"

    -- Reactions
    L["Action"] = true -- "A"ction shortened
    L["Vocal"] = true -- "V"ocal shortened
    L["AV"] = true -- "A"ction/"V"ocal shortened

    -- Actual addon texts
    -- Same order as in EmoteData.lua

    -- First (emote name only) is text produced
    -- when there is no target.  Second (_target)
    -- is what's produced when there is a target

    -- The following tags:
    -- <Target>, <He>, <he>, <She>, <she>
    -- <His>, <his>, <Her>, <her>
    -- MUST, MUST, MUST remain as is to work
    -- They are localized above

    L["escape"] = "h\195\188stelt nerv\195\182s und sucht einen Fluchtweg."
    L["escape_target"] = "h\195\188stelt nerv\195\182s <Target> an und sucht einen Fluchtweg."

    L["bio"] = "braucht eine Auszeit."
    L["bio_target"] = "erkl\195\164rt <Target> das <he> eine Auszeit braucht."

    L["bladeintro"] = "will allen <his> Schwert vorstellen."
    L["bladeintro_target"] = "will <Target> <his> Schwert vorstellen."
    
    L["mountspecial"] = "Ausf\195\188hren /mountspecial."
    L["mountspecial_target"] = "Ausf\195\188hren /mountspecial."

    L["agree"] = "Ihr stimmt zu."
    L["agree_target"] = "Ihr stimmt <Target> zu."

    L["amaze"] = "Ihr wundert Euch!"
    L["amaze_target"] = "Ihr wundert euch \195\188ber <Target>!"

    L["angry"] = "Ihr erhebt erbost eure Faust."
    L["angry_target"] = "Ihr hebt erbost eure Faust gegen <Target>."

    L["apologize"] = "Ihr endschuldigt euch bei allen. Tut mir Leid!"
    L["apologize_target"] = "Ihr endschuldigt euch bei <Target>. Tut mir Leid!"

    L["applaud"] = "Ihr applaudiert. Bravo!"
    L["applaud_target"] = "Ihr applaudiert <Target>. Bravo!"

    L["arm"] = "Ihr streckt eure Arme aus."
    L["arm_target"] = "Ihr legt eure Arme um <Target> Schultern."

    L["attacktarget"] = "Ihr sagt allen, dass sie etwas angreifen sollen."
    L["attacktarget_target"] = "Ihr sagt allen dass sie <Target> angreifen sollen."

    L["bark"] = "Ihr bellt. Wuff Wuff!"
    L["bark_target"] = "Ihr bellt <Target> an"

    L["bashful"] = "Ihr seid sch\195\188chtern."
    L["bashful_target"] = "Ihr seid so sch\195\188chtern...zu sch\195\188chtern um die Aufmerksamkeit von <Target> zu erregen."

    L["beckon"] = "Ihr winkt alle zu euch herr\195\188ber."
    L["beckon_target"] = "Ihr winkt <Target> zu."

    L["beg"] = "Ihr fleht alle um Euch herum an. Wie erb\195\164rmlich."
    L["beg_target"] = "Ihr fleht <Target> an. Wie erb\195\164rmlich."

    L["belch"] = "Ihr R\195\188lpst laut."
    L["belch_target"] = "Ihr R\195\188lpst laut."

    L["bite"] = "Ihr seht euch um ob es jemanden zum Beissen gibt."
    L["bite_target"] = "Ihr Beisst <Target>. Autsch!"

    L["bleed"] = "Blut quillt aus Euren Wunden."
    L["bleed_target"] = "Blut quillt aus Euren Wunden."

    L["blink"] = "Ihr zwinkert mit den Augen."
    L["blink_target"] = "Ihr zwinkert <Target> zu."

    L["blush"] = "Ihr err\195\182tet."
    L["blush_target"] = "Ihr seht <Target> an und err\195\182tet."

    L["boggle"] = "Ihr schaut angesichts der Situation ungl\195\164ubig drein."
    L["boggle_target"] = "Ihr seht <Target> unglaublich an."

    L["bonk"] = "Ihr haut euch selbst kr\195\164ftig auf den Sch\195\164del.Autsch!"
    L["bonk_target"] = "Ihr haut <Target> kr\195\164ftig auf den Sch\195\164del. Autsch!"

    L["boop"] = "Du ber\195\188hrst deine eigene Nase. Boop!"
    L["boop_target"] = "Du ber\195\188hrst <Target> Nase."

    L["bored"] = "Ihr sterbt fast vor Langeweile. Das Leben ist ja so hart!!"
    L["bored_target"] = "Ihr seid schrecklich gelangweilt von <Target>."

    L["bounce"] = "Ihr h\195\188pft auf und ab."
    L["bounce_target"] = "Ihr h\195\188pft vor <Target> auf und ab."

    L["bow"] = "Ihr verbeugt Euch huldvoll."
    L["bow_target"] = "Ihr verbeugt Euch vor <Target>."
    
    L["brandish"] = "Ihr fuchteln Ihre Waffe heftig."
    L["brandish_target"] = "Ihr fuchteln Ihre Waffe heftig auf <Target>."

    L["brb"] = "Ihr lasst alle wissen das ihr gleich wieder zur\195\188ck seid."
    L["brb_target"] = "Ihr lasst <Target> wissen das ihr gleich wieder zur\195\188ck seid."

    L["cackle"] = "Ihr kichert angesichts der Situation wie irre."
    L["cackle_target"] = "Ihr kichert <Target> angesichts der Situation wie irre an."

    L["calm"] = "Ihr bleibt ruhig."
    L["calm_target"] = "Ihr versucht <Target> zu beruhigen."

    L["charge"] = "Ihr greift an."
    L["charge_target"] = "Ihr greift an."

    L["cheer"] = "Ihr jubelt!"
    L["cheer_target"] = "Ihr bejubelt <Target>."

    L["chicken"] = "Ihr flattert mit den Armen und stolziert herum. Koooooom, putt, putt, putt, putt!"
    L["chicken_target"] = "Ihr flattert mit den Armen und stolziert um <Target> herum. Koooooom, putt, putt, putt, putt!"

    L["chuckle"] = "Ihr brecht in herzhaftes freundliches Gekicher aus."
    L["chuckle_target"] = "Ihr kichert <Target> freundlich an."

    L["clap"] = "Ihr klatscht aufgeregt in die H\195\164nde."
    L["clap_target"] = "Ihr klatscht aufgeregt f\195\188r <Target> in die H\195\164nde."

    L["cold"] = "Ihr teilt allen mit dass Euch kalt ist."
    L["cold_target"] = "Ihr teilt <Target> mit dass Euch kalt ist."

    L["comfort"] = "Ihr m\195\188sst getr\195\182stet werden."
    L["comfort_target"] = "Ihr tr\195\182stet <Target>."

    L["commend"] = "Ihr lobt alle f\195\188r ihre gute Arbeit."
    L["commend_target"] = "Ihr lobt <Target> f\195\188r seine gute Arbeit."

    L["confused"] = "Ihr seid total verwirrt."
    L["confused_target"] = "Ihr seht <Target> verwirrt an."

    L["congrats"] = "Ihr gratuliert allen um Euch herum."
    L["congrats_target"] = "Ihr gratuliert <Target>."

    L["cough"] = "Ihr brecht in lautes Husten aus."
    L["cough_target"] = "Ihr brecht in lautes Husten aus."

    L["cower"] = "Ihr kr\195\188mmt Euch ver\195\164ngstigt zusammen."
    L["cower_target"] = "Ihr kr\195\188mmt Euch beim Anblick von <Target> ver\195\164ngstigt zusammen."

    L["crack"] = "Ihr lasst Eure Kn\195\182chel knacken."
    L["crack_target"] = "Ihr lasst Eure Kn\195\182chel knacken und starrt dabei <Target> an."

    L["cringe"] = "Ihr erschauert vor lauter Furcht."
    L["cringe_target"] = "Ihr zuckt \195\164ngstlich vor <Target> zusammen."

    L["cry"] = "Ihr heult."
    L["cry_target"] = "Ihr heult Euch an der Schulter von <Target> aus."

    L["cuddle"] = "Ihr m\195\188sst umarmt werden."
    L["cuddle_target"] = "Ihr kuschelt Euch an <Target>."

    L["curious"] = "Ihr bringt Eure Neugier allen gegen\195\188ber zum Ausdruck."
    L["curious_target"] = "Ihr w\195\188sstet zu gern, was <Target> vorhat."

    L["curtsey"] = "Ihr macht einen Knicks."
    L["curtsey_target"] = "Ihr macht einen Knicks vor <Target>."

    L["dance"] = "Ihr fangt spontan zu tanzen an."
    L["dance_target"] = "Ihr tanzt mit <Target>."
    
    L["ding"] = "Ihr hast ein neues Level erreicht. DING!"
    L["ding_target"] = "Ihr gratulieren <Target> zu einem neuen Level. DING!"

    L["doom"] = "Ihr droht allen mit der ewigen Verdammnis."
    L["doom_target"] = "Ihr droht <Target> mit der ewigen Verdammnis."

    L["drink"] = "Ihr erhebt das Glas zum Gruss, bevor Ihr es leert. Prost!"
    L["drink_target"] = "Ihr erhebt Euer Glas auf <Target>. Prost!"

    L["drool"] = "Ein Sabberfaden l\195\164uft Euch aus dem Mund."
    L["drool_target"] = "Ein Sabberfaden l\195\164uft Euch aus dem Mund."

    L["duck"] = "Ihr duckt Euch zum Schutz."
    L["duck_target"] = "Ihr duckt Euch hinter <Target>."

    L["eat"] = "Ihr fangt an zu essen."
    L["eat_target"] = "Ihr fangt vor <Target> zu essen an."

    L["excited"] = "Ihr sprecht aufgeregt mit jedem."
    L["excited_target"] = "Ihr sprecht aufgeregt mit <Target>."

    L["eye"] = "Ihr schielt."
    L["eye_target"] = "Ihr mustert <Target> von oben bis unten."

    L["facepalm"] = "Ihr schlagt die H\195\164nde vors Gesicht."
    L["facepalm_target"] = "Ihr seht <Target> an und schlagt die H\195\164nde vors Gesicht."

    L["fart"] = "Ihr lasst einen lauten Furz entweichen. Igitt, was stinkt hier nur so?"
    L["fart_target"] = "Ihr lasst einen lauten Furz entweichen. Igitt, was stinkt hier nur so?"

    L["fidget"] = "Ihr zappelt herum."
    L["fidget_target"] = "Ihr zappelt beim Warten auf <Target> nerv\195\182s herum."

    L["flee"] = "Ihr ruft dass alle fliehen sollen!"
    L["flee_target"] = "Ihr ruft dass alle fliehen sollen!"

    L["flex"] = "Ihr lasst Eure Muskeln spielen. Oh, echt stark!"
    L["flex_target"] = "Ihr lasst <Target> gegen\195\188ber Eure Muskeln spielen. Oh, echt stark!"

    L["flirt"] = "Ihr flirtet."
    L["flirt_target"] = "Ihr flirtet mit <Target>."

    L["flop"] = "Ihr w\195\164lzt Euch hilflos herum."
    L["flop_target"] = "Ihr w\195\164lzt Euch hilflos um <Target> herum."

    L["followme"] = "Ihr gebt allen ein Zeichen zu folgen."
    L["followme_target"] = "Ihr gebt <Target> ein Zeichen zu folgen."

    L["frown"] = "Ihr runzelt die Stirn."
    L["frown_target"] = "Ihr seid entt\195\164uscht und zeigt es <Target> durch ein Stirnrunzeln."

    L["gasp"] = "Ihr schnappt nach Luft."
    L["gasp_target"] = "Ihr keucht <Target> an."

    L["gaze"] = "Ihr starrt in die Ferne."
    L["gaze_target"] = "Ihr starrt <Target> begierig an."

    L["giggle"] = "Ihr kichert."
    L["giggle_target"] = "Ihr kichert <Target> an."

    L["glare"] = "Ihr schaut w\195\188tend drein."
    L["glare_target"] = "Ihr starrt <Target> w\195\188tend an."

    L["gloat"] = "Ihr erfreut Euch h\195\164misch am Ungl\195\188ck aller."
    L["gloat_target"] = "Ihr freut Euch h\195\164misch am Ungl\195\188ck von <Target>."

    L["golfclap"] = "Ihr klatscht halbherzig, offensichtlich unbeeindruckt."
    L["golfclap_target"] = "Ihr klatscht f\195\188r <Target>, offensichtlich unbeeindruckt."

    L["goodbye"] = "Ihr winkt allen zum Abschied. Lebt wohl!"
    L["goodbye_target"] = "Ihr winkt <Target> zum Abschied. Lebt wohl!"

    L["greet"] = "Ihr begr\195\188sst alle herzlich."
    L["greet_target"] = "Ihr begr\195\188sst <Target> herzlich."

    L["grin"] = "Ihr grinst b\195\182se."
    L["grin_target"] = "Ihr grinst <Target> b\195\182se an."

    L["groan"] = "Ihr fangt an zu st\195\182hnen."
    L["groan_target"] = "Ihr seht <Target> an und st\195\182hnt."

    L["grovel"] = "Ihr kriecht vor lauter Unterw\195\188rfigkeit auf dem Boden."
    L["grovel_target"] = "Ihr kriecht vor <Target> wie ein unterw\195\188rfiger Diener."

    L["growl"] = "Ihr knurrt bedrohlich."
    L["growl_target"] = "Ihr knurrt <Target> bedrohlich an."

    L["guffaw"] = "Ihr brecht in schallendes Gel\195\164chter aus!"
    L["guffaw_target"] = "Ihr werft nur einen Blick auf <Target> und brecht in schallendes Gel\195\164chter aus!"

    L["hail"] = "Ihr gr\195\188sst alle um Euch herum."
    L["hail_target"] = "Ihr gr\195\188sst <Target>."

    L["happy"] = "Ihr seid von Gl\195\188ck erf\195\188llt!"
    L["happy_target"] = "Ihr seid sehr gl\195\188cklich mit <Target>!"

    L["healme"] = "Ihr ruft nach Heilung!"
    L["healme_target"] = "Ihr ruft nach Heilung!"

    L["hello"] = "Ihr begr\195\188sst alle mit einem herzlichen Hallo!"
    L["hello_target"] = "Ihr begr\195\188sstt <Target> mit einem herzlichen Hallo!"

    L["helpme"] = "Ihr ruft um Hilfe!"
    L["helpme_target"] = "Ihr ruft um Hilfe!"

    L["highfive"] = "Ihr hebt die Hand - hoffentlich schl\195\164gt jemand ein."
    L["highfive_target"] = "Ihr gebt <Target> F\195\188nf!"

    L["holdhand"] = "Sie wollen jemanden, der Ihre Hand halten w\195\188rde."
    L["holdhand_target"] = "Sie halten <Target> Hand."

    L["hug"] = "Ihr m\195\188sst in den Arm genommen werden!"
    L["hug_target"] = "Ihr umarmt <Target>."

    L["hungry"] = "Ihr habt Hunger!"
    L["hungry_target"] = "Ihr habt Hunger. Vielleicht hat <Target> ja etwas zu essen..."

    L["huzzah"] = "Ihr jubeln ausgelassen! Huzzah!"
    L["huzzah_target"] = "Ihr jubeln <Target> ausgelassen zu! Huzzah!"

    L["impressed"] = "Du klatschst kr\195\164ftig, sichtlich beeindruckt."
    L["impressed_target"] = "Du klatschst kr\195\164ftig f\195\188r <Target>, sichtlich beeindruckt."

    L["incoming"] = "Ihr warnt alle vor sich n\195\164hernden Feinden!"
    L["incoming_target"] = "Ihr zeigt auf <Target> - Feind n\195\164hert sich!"

    L["insult"] = "Ihr findet dass alle um Euch herum S\195\182hne eines mutterlosen Ogers seien."
    L["insult_target"] = "Ihr findet <Target> sei der Sohn eines mutterlosen Ogers."

    L["introduce"] = "Ihr stellt Euch allen vor."
    L["introduce_target"] = "Ihr stellt Euch <Target> vor."

    L["jk"] = "Ihr habt nur Spass gemacht!"
    L["jk_target"] = "Ihr lasst <Target> wissen das ihr nur Spass gemacht habt!"

    L["kiss"] = "Ihr haucht einen Kuss in die Luft."
    L["kiss_target"] = "Ihr haucht <Target> einen Kuss zu."

    L["kneel"] = "Ihr kniet nieder."
    L["kneel_target"] = "Ihr kniet vor <Target>."

    L["laugh"] = "Ihr lacht."
    L["laugh_target"] = "Ihr lacht <Target> aus."

    L["lavish"] = "Ihr preist das Licht."
    L["lavish_target"] = "Ihr \195\188bersch\195\188ttet <Target> mit Lob."

    L["lay"] = "Ihr legt Euch nieder."
    L["lay_target"] = "Ihr legt Euch vor <Target> nieder."

    L["lick"] = "Ihr leckt Eure Lippen."
    L["lick_target"] = "Ihr leckt <Target>."

    L["listen"] = "Ihr h\195\182rt zu!"
    L["listen_target"] = "Ihr h\195\182rt <Target> aufmerksam zu."

    L["lost"] = "Ihr habt Euch total verirrt."
    L["lost_target"] = "Ihr lasst <Target> wissen, dass Ihr Euch total verirrt habt."

    L["love"] = "Ihr sp\195\188rt die Liebe."
    L["love_target"] = "Ihr liebt <Target>."

    L["magnificent"] = "Du nickst zustimmend. Gro\195\159artige Arbeit!"
    L["magnificent_target"] = "Du nickst <Target> zustimmend zu. Gro\195\159artige Arbeit!"

    L["massage"] = "Ihr braucht eine Massage!"
    L["massage_target"] = "Ihr massiert die Schultern von <Target>."
    
    L["meow"] = "Ihr miaust."
    L["meow_target"] = "Ihr miaust bei <Target>."

    L["mock"] = "Ihr macht Euch \195\188ber das Leben und alles, wof\195\188r es steht, lustig."
    L["mock_target"] = "Ihr macht Euch \195\188ber die Dummheit von <Target> lustig."

    L["moo"] = "Muuuuh!"
    L["moo_target"] = "<Target> wird von Euch angemuht. Muuuuh!"

    L["moon"] = "Ihr lasst die Hose runter und zeigt allen das blanke Hinterteil."
    L["moon_target"] = "Ihr lasst die Hose runter und zeigt allen das blanke Hinterteil."

    L["mourn"] = "In stillem Nachdenken versunken betrauert Ihr die Toten."
    L["mourn_target"] = "In stillem Nachdenken versunken betrauert Ihr den Tod von <Target>."

    L["no"] = "Ihr sagt deutlich: NEIN."
    L["no_target"] = "Ihr sagt NEIN zu <Target>. Auf keinen Fall."

    L["nod"] = "Ihr nickt."
    L["nod_target"] = "Ihr nickt <Target> zu."

    L["nosepick"] = "Ihr vertreibt Euch die Zeit mit ausgiebigem Nasepopeln."
    L["nosepick_target"] = "Ihr popelt in der Nase und zeigt <Target> Eure Ausbeute."

    L["oom"] = "Ihr verk\195\188ndet dass Ihr wenig Mana habt!"
    L["oom_target"] = "Ihr verk\195\188ndet dass Ihr wenig Mana habt!"

    L["openfire"] = "Ihr gebt den Befehl, das Feuer zu er\195\182ffnen."
    L["openfire_target"] = "Ihr gebt den Befehl, das Feuer zu er\195\182ffnen."

    L["panic"] = "Ihr rennt voller Panik in der Gegend herum."
    L["panic_target"] = "Ihr werft einen Blick auf <Target> und brecht in Panik aus."

    L["pat"] = "Ihr braucht eine Aufmunterung."
    L["pat_target"] = "Ihr gebt <Target> einen freundschaftlichen Klaps."

    L["peer"] = "Ihr blickt forschend in der Gegend herum."
    L["peer_target"] = "Ihr starrt <Target> forschend an."

    L["pity"] = "Ihr habt Mitleid mit allen um Euch herum."
    L["pity_target"] = "Ihr blickt mitleidig auf <Target> herab."

    L["plead"] = "Ihr fallt auf die Knie und fleht verzweifelt."
    L["plead_target"] = "Ihr fleht <Target> an."

    L["point"] = "Ihr zeigt dort dr\195\188ben hin."
    L["point_target"] = "Ihr zeigt auf <Target>."

    L["poke"] = "Ihr knufft Euch in den Bauch und kichert."
    L["poke_target"] = "<Target> wird von Euch geknufft. He!"

    L["ponder"] = "Ihr denkt \195\188ber die Situation nach."
    L["ponder_target"] = "Ihr macht Euch Gedanken \195\188ber das Tun von <Target>."

    L["pounce"] = "Ihr springt aus dem Schatten."
    L["pounce_target"] = "Ihr springt auf <Target>."

    L["pray"] = "Ihr betet zu den G\195\182ttern."
    L["pray_target"] = "Ihr sprecht ein Gebet f\195\188r <Target>."

    L["purr"] = "Ihr schnurrt wie ein K\195\164tzchen."
    L["purr_target"] = "Ihr schnurrt <Target> an."

    L["puzzled"] = "Ihr seid verwirrt. Was ist denn hier nur los?"
    L["puzzled_target"] = "<Target> verwirrt Euch."

    L["question"] = "Ihr wollt wissen was der Sinn des Lebens ist."
    L["question_target"] = "Ihr befragt <Target>."

    L["raise"] = "Ihr streckt Eure Hand in die Luft."
    L["raise_target"] = "Ihr seht <Target> an und hebt Eure Hand."

    L["rasp"] = "Ihr macht eine unfl\195\164tige Geste."
    L["rasp_target"] = "Ihr zeigt <Target> eine unfl\195\164tige Geste."

    L["ready"] = "Ihr teilt allen mit dass Ihr bereit seid!"
    L["ready_target"] = "Ihr teilt <Target> mit dass Ihr bereit seid!"
    
    L["regret"] = "Ihr bist voller Bedauern."
    L["regret_target"] = "Ihr denkst, dass <Target> es bereuen wird."

    L["roar"] = "Ihr br\195\188llt wie ein wildes Tier. Wie furchterregend!"
    L["roar_target"] = "Ihr br\195\188llt <Target> wie ein wildes Tier an. Wie furchterregend!"

    L["rofl"] = "Ihr w\195\164lzt Euch vor Lachen auf dem Boden."
    L["rofl_target"] = "Ihr lacht <Target> aus und w\195\164lzt Euch dabei vor Vergn\195\188gen auf dem Boden."
    
    L["rolleyes"] = "Ihr rollst deine Augen."
    L["rolleyes_target"] = "Ihr rollst deine Augen auf <Target>."

    L["rude"] = "Ihr macht eine unfl\195\164tige Geste."
    L["rude_target"] = "Ihr zeigt <Target> eine unfl\195\164tige Geste."

    L["salute"] = "Ihr steht stramm und gr\195\188sst."
    L["salute_target"] = "Ihr gr\195\188sst <Target> voller Respekt."

    L["scared"] = "Ihr habt Angst!"
    L["scared_target"] = "Ihr habt Angst vor <Target>."

    L["scratch"] = "Ihr kratzt Euch. Ah, das ist besser!"
    L["scratch_target"] = "Ihr kratzt <Target>. Wie unerwartet!"

    L["sexy"] = "Ihr seid einfach zu sexy."
    L["sexy_target"] = "Ihr denkt dass <Target> total sexy ist."

    L["shimmy"] = "Ihr t\195\164nzelt vor den Massen herum."
    L["shimmy_target"] = "Ihr t\195\164nzelt vor <Target> herum."

    L["shiver"] = "Ihr fr\195\182stelt bis ins Mark. Eiskalt!"
    L["shiver_target"] = "Euch fr\195\182stelt neben <Target>. Eiskalt!"

    L["shoo"] = "Ihr verscheucht die nervige Pest."
    L["shoo_target"] = "Ihr scheucht <Target> weg. Hinfort, nervige Pest!"

    L["shrug"] = "Ihr zuckt mit den Achseln. Wer wei\195\159?"
    L["shrug_target"] = "Ihr zeigt <Target> ein Achselzucken. Wer wei\195\159?"

    L["shy"] = "Ihr l\195\164chelt sch\195\188chtern."
    L["shy_target"] = "Ihr l\195\164chelt <Target> sch\195\188chtern an."

    L["sigh"] = "Euch entf\195\164hrt ein langer, tiefer Seufzer."
    L["sigh_target"] = "Ihr schmachtet <Target> an."

    L["silly"] = "Ihr erz\195\164hlt einen Witz."
    L["silly_target"] = "Ihr erz\195\164hlt <Target> einen Witz."

    L["slap"] = "Ihr gebt Euch selbst eine Ohrfeige. Aua!"
    L["slap_target"] = "Ihr gebt <Target> eine Ohrfeige. Aua!"

    L["sleep"] = "Ihr schlaft ein. Zzzzzzz."
    L["sleep_target"] = "Ihr schlaft ein. Zzzzzzz."

    L["smile"] = "Ihr l\195\164chelt."
    L["smile_target"] = "Ihr l\195\164chelt <Target> an."

    L["smirk"] = "Ein verstohlenes Grinsen breitet sich auf Eurem Gesicht aus."
    L["smirk_target"] = "Ihr grinst <Target> verstohlen an."

    L["snarl"] = "Ihr zeigt Eure Z\195\164hne und knurrt."
    L["snarl_target"] = "Ihr zeigt Eure Z\195\164hne und knurrt <Target> an."

    L["snicker"] = "Ihr kichert leise belustigt in Euch hinein."
    L["snicker_target"] = "Ihr kichert <Target> belustigt an."

    L["sniff"] = "Ihr schn\195\188ffelt die Luft um Euch herum."
    L["sniff_target"] = "Ihr schn\195\188ffelt an <Target>."

    L["snub"] = "Ihr beleidigt alle niederen Peons um Euch herum."
    L["snub_target"] = "Ihr beleidigt <Target>."

    L["soothe"] = "Ihr m\195\188sst bes\195\164nftigt werden."
    L["soothe_target"] = "Ihr bes\195\164nftigt <Target>. Keine Panik ... alles wird wieder gut...."

    L["spit"] = "Ihr spuckt auf den Boden."
    L["spit_target"] = "Ihr spuckt auf den Boden."

    L["stare"] = "Ihr starrt in die Ferne."
    L["stare_target"] = "Ihr starrt <Target> begierig an."

    L["surprised"] = "Ihr seid echt \195\188berrascht!"
    L["surprised_target"] = "Ihr seid von den Taten von <Target> \195\188berrascht."

    L["surrender"] = "Ihr ergebt Euch Euren Gegnern."
    L["surrender_target"] = "Ihr ergebt Euch <Target>. Niederlagen tun weh ..."

    L["talk"] = "Ihr redet mit euch selbst da niemand sonst daran interessiert zu seien scheint."
    L["talk_target"] = "Ihr wollt mit <Target> \195\188ber einige Dinge reden."

    L["tap"] = "Ihr klopft mit dem Fuss. Jetzt aber Tempo!"
    L["tap_target"] = "Ihr klopft mit dem Fuss auf den Boden, w\195\164hrend Ihr auf <Target> wartet."

    L["taunt"] = "Ihr verspottet alle um Euch herum. Na los doch, Ihr Dummk\195\182pfe!"
    L["taunt_target"] = "Ihr macht <Target> gegen\195\188ber eine sp\195\182ttische Geste. Na los doch!"

    L["tease"] = "Ihr zieht alle Leute so gern auf."
    L["tease_target"] = "Ihr zieht <Target> auf."

    L["thank"] = "Ihr dankt allen um Euch herum."
    L["thank_target"] = "Ihr dankt <Target>."
    
    L["think"] = "Ihr bist in Gedanken versunken."
    L["think_target"] = "Ihr denkst an <Target>."

    L["thirsty"] = "Ihr seid ja so durstig. Hat jemand was zu trinken \195\188brig?"
    L["thirsty_target"] = "Ihr teilt <Target> mit dass Ihr durstig seid. Habt Ihr was zu trinken \195\188brig?"

    L["tickle"] = "Ihr wollt gekitzelt werden. Ha ha ha!"
    L["tickle_target"] = "Ihr kitzelt <Target>. Ha ha ha!"

    L["tired"] = "Ihr teilt allen mit dass Ihr m\195\188de seid."
    L["tired_target"] = "Ihr teilt <Target> mit dass Ihr m\195\188de seid."

    L["train"] = "Ihr macht Zugger\195\164usche 'Tschuu Tschuu Tschuu'!"
    L["train_target"] = "Ihr macht Zugger\195\164usche 'Tschuu Tschuu Tschuu'!"

    L["veto"] = "Ihr lehnt den gestellten Antrag ab."
    L["veto_target"] = "Ihr lehnt den Antrag von <Target> ab."

    L["victory"] = "Ihr sonnt Euch im Glanz des Sieges."
    L["victory_target"] = "Ihr sonnt Euch mit <Target> im Glanz des Sieges."

    L["violin"] = "Ihr fangt an der Welt kleinste Geige zu spielen."
    L["violin_target"] = "Ihr spielt der Welt kleinste Geige f\195\188r <Target>."

    L["wait"] = "Ihr bittet alle zu warten."
    L["wait_target"] = "Ihr bittet <Target> zu warten."

    L["wave"] = "Ihr winkt."
    L["wave_target"] = "Ihr winkt <Target> zu."

    L["welcome"] = "Ihr sagt: 'Bitte sehr.'"
    L["welcome_target"] = "Ihr sagt: 'Gern geschehn, <Target>.'"

    L["whine"] = "Ihr heult herzzerrei\195\159end."
    L["whine_target"] = "Ihr heult <Target> herzzerrei\195\159end an."

    L["whistle"] = "Ihr lasst ein lautes Pfeifen h\195\182ren."
    L["whistle_target"] = "Ihr lasst ein lautes Pfeifen h\195\182ren."

    L["whoa"] = "Ihr bist hin und weg."
    L["whoa_target"] = "Ihr bist \195\188berw\195\164ltigt von <Target>."

    L["wince"] = "Du zuckt mitf\195\188hlend zusammen."
    L["wince_target"] = "Du zuckt mitleidig bei <Target> zusammen. Das sah aus, als ob es weh tat!"

    L["wink"] = "Ihr zwinkert verschmitzt."
    L["wink_target"] = "Ihr zwinkert <Target> verschmitzt zu."

    L["work"] = "Ihr beginnt mit der Arbeit."
    L["work_target"] = "Ihr arbeitet mit <Target>."

    L["yawn"] = "Ihr g\195\164hnt m\195\188de."
    L["yawn_target"] = "Ihr g\195\164hnt <Target> m\195\188de an."

    L["yw"] = "Ihr habt gern geholfen."
    L["yw_target"] = "Ihr habt <Target> gern geholfen."
  
  elseif locale == "ruRU" then  
    -- Random addon strings
    L["Last Emote Used"] = "Последняя использованная эмоция"
    L["Custom:  "] = "Пользовательские: "
    L["Toggle the display of slash commands."] = "Включить отображение команд. "
    L["Currently: "] = "Сейчас: "
    L["Toggle the display of the minimap button"] = "Включить отображение кнопки на миникарте "
    L["EmoteLDB version: "] = "Версия EmoteLDB: "

    -- Emote Data EL_Types
    L["Friendly"] = "Дружелюбные "
    L["Hostile"] = "Враждебные"
    L["Happy"] = "Счастливые"
    L["Neutral"] = "Нейтральные"
    L["Unhappy"] = "Несчастные"
    L["Custom"] = "Пользовательские"
    L["Taunts"] = "Насмешки"
    L["Affection"] = "Флирт"
    L["Greetings"] = "Приветствия"
    L["Combat"] = "Бой"
    L["Self-Deprecating"] = "Самоуничижение"
    L["Reactions"] = "Реакции"
    L["Other"] = "Другие"

    -- Genders
    L["He"] = "Он"
    L["His"] = "Его"
    L["he"] = "он"
    L["his"] = "его"
    L["She"] = "Она"
    L["Her"] = "Её"
    L["she"] = "она"
    L["her"] = "её"

    -- Reactions
    L["Action"] = "Действие" -- "A"ction shortened
    L["Vocal"] = "Голос" -- "V"ocal shortened
    L["AV"] = "Д+Г" -- "A"ction/"V"ocal shortened

    L["mountspecial"] = "Выполнить /mountspecial."
    L["mountspecial_target"] = "Выполнить /mountspecial."

    L["agree"] = "Вы соглашаетесь."
    L["agree_target"] = "Вы соглашаетесь с <Target>."
    
    L["amaze"] = "Вы восхищены!"
    L["amaze_target"] = "Вы восхищены <Target>!"
    
    L["angry"] = "Вы в гневе заносите кулак."
    L["angry_target"] = "Вы в гневе замахиваетесь кулаком на <Target>."
    
    L["apologize"] = "Вы просите у всех прощения. Извините!"
    L["apologize_target"] = "Вы извиняетесь перед <Target>. Прости!"
    
    L["applaud"] = "Вы аплодируете. Браво!"
    L["applaud_target"] = "Вы рукоплещете <Target>. Браво! "
    
    L["arm"] = "Вы потягиваетесь, разминая плечи."
    L["arm_target"] = "Вы обнимаете <Target> за плечи."
    
    L["attacktarget"] = "Вы приказываете всем идти в атаку."
    L["attacktarget_target"] = "Вы велите всем атаковать <Target>."
    
    L["bark"] = "Вы лаете. Гав-гав!"
    L["bark_target"] = "Вы рявкаете на <Target>."
    
    L["bashful"] = "Вы краснеете."
    L["bashful_target"] = "Вы слишком застенчивы, чтобы привлечь внимание <Target>."

    L["beckon"] = "Вы жестом подзываете всех к себе."
    L["beckon_target"] = "Вы жестом подзываете <Target>."
    
    L["beg"] = "Вы с мольбой смотрите на окружающих. Выглядит жалко."
    L["beg_target"] = "Вы с мольбой смотрите на <Target>. Выглядит жалко."
    
    L["belch"] = "Вы громко рыгаете."
    L["belch_target"] = "Вы громко рыгаете."
    
    L["bio"] = "нуждается в перерыве для естественных надобностей."
    L["bio_target"] = "говорит <Target>, что <he> нуждается в перерыве для естественных надобностей."

    L["bite"] = "Вы ищите, кого бы укусить."
    L["bite_target"] = "Вы кусаете <Target>. Ох!"

    L["bladeintro"] = "хочет представить <his> клинок кому-нибудь."
    L["bladeintro_target"] = "хочет познакомить <Target> с <his> клинком."

    L["bleed"] = "Ваши раны кровоточат."
    L["bleed_target"] = "Ваши раны кровоточат."

    L["blink"] = "Вы моргаете."
    L["blink_target"] = "Вы моргаете, глядя на <Target>."

    L["blush"] = "Вы заливаетесь краской."
    L["blush_target"] = "Вы заливаетесь краской при виде <Target>."

    L["boggle"] = "Вы не знаете, что делать в этой ситуации."
    L["boggle_target"] = "Вы изумленно смотрите на <Target>."

    L["bonk"] = "Вы стукаетесь головой. Буммм!"
    L["bonk_target"] = "Вы бьете <Target> по голове. Буммм!"

    L["boop"] = "Ты сам себе нос портишь. Буп!"
    L["boop_target"] = "Ты Буп <Target> нос."

    L["bored"] = "Вы изнываете от скуки. Какое занудство!"
    L["bored_target"] = "Общение с <Target> вас основательно утомило."

    L["bounce"] = "Вы подпрыгиваете на месте."
    L["bounce_target"] = "Вы прыгаете на месте перед <Target>."

    L["bow"] = "Вы изящно кланяетесь."
    L["bow_target"] = "Вы кланяетесь <Target>."

    L["brandish"] = "Вы яростно размахиваете оружием."
    L["brandish_target"] = "Вы яростно замахиваетесь своим оружием на <Target>."    
    
    L["brb"] = "Вы даёте всем понять, что сейчас вернётесь."
    L["brb_target"] = "Вы показываете <Target>, что сейчас вернётесь."

    L["cackle"] = "Вы громко расхохотались."
    L["cackle_target"] = "Вы глупо хохочете над <Target>."

    L["calm"] = "Вы сохраняете спокойствие."
    L["calm_target"] = "Вы пытаетесь успокоить <Target>."

    L["charge"] = "Вы идете в атаку."
    L["charge_target"] = "Вы идете в атаку."

    L["cheer"] = "Вы очень рады!"
    L["cheer_target"] = "Вы радуетесь успехам <Target>."

    L["chicken"] = "Хлопая руками, вы расхаживаете вокруг. Цыпа-цыпа-цыпа!"
    L["chicken_target"] = "Хлопая руками, вы расхаживаете вокруг <Target>. Цыпа-цыпа-цыпа!"

    L["chuckle"] = "Вы смеетесь от всей души."
    L["chuckle_target"] = "Вы хихикаете над <Target>."

    L["clap"] = "Вы восторженно аплодируете."
    L["clap_target"] = "Вы восторженно аплодируете <Target>."

    L["cold"] = "Вы показываете всем, что вы замерзли."
    L["cold_target"] = "Вы показываете <Target>, что вы замерзли."

    L["comfort"] = "Вы нуждаетесь в утешении."
    L["comfort_target"] = "Вы утешаете <Target>."

    L["commend"] = "Вы благодарите всех за хорошую работу."
    L["commend_target"] = "Вы хвалите <Target> за хорошую работу."

    L["confused"] = "Вы в полном недоумении."
    L["confused_target"] = "Вы недоуменно смотрите на <Target>."

    L["congrats"] = "Вы поздравляете всех вокруг."
    L["congrats_target"] = "Вы поздравляете <Target>."

    L["cough"] = "Вы отрывисто кашляете."
    L["cough_target"] = "Вы отрывисто кашляете."

    L["cower"] = "Вы дрожите от страха."
    L["cower_target"] = "Вы дрожите от страха при виде <Target>."

    L["crack"] = "Вы похрустываете костяшками пальцев."
    L["crack_target"] = "Вы похрустываете костяшками, глядя на <Target>."

    L["cringe"] = "Вы сжимаетесь от страха."
    L["cringe_target"] = "Вы в страхе пятитесь от <Target>."

    L["cry"] = "Вы плачете."
    L["cry_target"] = "Вы рыдаете на плече у <Target>."

    L["cuddle"] = "Вам хочется ласки."
    L["cuddle_target"] = "Вы прижимаетесь к <Target>."

    L["curious"] = "Вы показываете окружающим свое любопытство."
    L["curious_target"] = "Вам интересно, что будет делать <Target>."

    L["curtsey"] = "Вы делаете реверанс."
    L["curtsey_target"] = "Вы делаете реверанс перед <Target>."

    L["dance"] = "Вы пускаетесь в пляс."
    L["dance_target"] = "Вы танцуете с <Target>."

    L["ding"] = "Вы достигли нового уровня. ДЗИНЬ!"
    L["ding_target"] = "Вы поздравляете <Target>  с новым уровнем. ДЗИНЬ!"
    
    L["doom"] = "Вы пророчите всем кару небесную."
    L["doom_target"] = "Вы пророчите <Target> кару небесную."

    L["drink"] = "Вы поднимаете кубок. Будем здоровы!"
    L["drink_target"] = "Вы пьете за <Target>. Ваше здоровье!"

    L["drool"] = "С ваших губ стекает струйка слюны."
    L["drool_target"] = "С ваших губ стекает струйка слюны."

    L["duck"] = "Вы ищете укрытие."
    L["duck_target"] = "Вы прячетесь за спину <Target>."

    L["eat"] = "Вы начинаете есть."
    L["eat_target"] = "Вы начинаете есть на глазах <Target>."

    L["escape"] = "нервно кашляет и ищет способ сбежать."
    L["escape_target"] = "нервно кашляет <Target> и ищет способ сбежать."

    L["excited"] = "Вы возбужденно говорите со всеми вокруг."
    L["excited_target"] = "Вы возбужденно разговариваете с <Target>."

    L["eye"] = "У вас глаза лезут на лоб."
    L["eye_target"] = "Вы меряете взглядом <Target>."

    L["facepalm"] = "Вы прячете лицо в ладонях."
    L["facepalm_target"] = "Вы смотрите на <Target> и прячете лицо в ладонях."

    L["fart"] = "Вы испускаете газы. Фууу...чем это воняет?"
    L["fart_target"] = "Вы испускаете газы. Фууу...чем это воняет?"

    L["fidget"] = "Вы нервничаете."
    L["fidget_target"] = "Вы нервничаете, ожидая <Target>."

    L["flee"] = "Вы кричите, чтобы все убегали!"
    L["flee_target"] = "Вы кричите <Target>: 'Беги'!"

    L["flex"] = "Вы поигрываете мускулами. Вот это сила!"
    L["flex_target"] = "Вы поигрываете мускулами перед <Target>. Какая сила!"

    L["flirt"] = "Вы флиртуете."
    L["flirt_target"] = "Вы флиртуете с <Target>."

    L["flop"] = "Вы беспомощно суетитесь."
    L["flop_target"] = "Вы беспомощно суетитесь вокруг <Target>."

    L["followme"] = "Вы жестом велите всем следовать за вами."
    L["followme_target"] = "Вы жестом велите <Target> следовать за вами."

    L["frown"] = "Вы хмуритесь."
    L["frown_target"] = "Вы хмуро смотрите на <Target>."

    L["gasp"] = "Вы ахаете."
    L["gasp_target"] = "Вы ахаете при виде <Target>."

    L["gaze"] = "Вы смотрите куда-то вдаль."
    L["gaze_target"] = "Вы пожираете взглядом <Target>."

    L["giggle"] = "Вы хихикаете."
    L["giggle_target"] = "Вы хихикаете при виде <Target>."

    L["glare"] = "Вы смотрите гневным взглядом."
    L["glare_target"] = "Вы бросаете гневный взгляд на <Target>."

    L["gloat"] = "Вы злорадствуете по поводу общей неудачи."
    L["gloat_target"] = "Вы злорадствуете по поводу неудачи <Target>."

    L["golfclap"] = "Вы вяло аплодируете."
    L["golfclap_target"] = "Вы подчеркнуто равнодушно аплодируете <Target>."

    L["goodbye"] = "Вы машете всем рукой. До свидания!"
    L["goodbye_target"] = "Вы машете рукой <Target>. До свидания!"

    L["greet"] = "Вы тепло приветствуете всех вокруг."
    L["greet_target"] = "Вы тепло приветствуете <Target>."

    L["grin"] = "Вы злобно ухмыляетесь."
    L["grin_target"] = "Вы злобно ухмыляетесь <Target>."

    L["groan"] = "Вы начинаете стонать."
    L["groan_target"] = "Вы смотрите на <Target> и стонете."

    L["grovel"] = "Вы ползаете на брюхе, выражая полную покорность."
    L["grovel_target"] = "Вы ползаете перед <Target>, как услужливый слуга."

    L["growl"] = "Вы угрожающе рычите."
    L["growl_target"] = "Вы угрожающе рычите на <Target>."

    L["guffaw"] = "Вы громко гогочете!"
    L["guffaw_target"] = "Вы смотрите на <Target> и ржете!"

    L["hail"] = "Вы приветствуете всех."
    L["hail_target"] = "Вы приветствуете <Target>."

    L["happy"] = "Вас переполняет счастье!"
    L["happy_target"] = "Вы очень довольны <Target>!"

    L["healme"] = "Вы зовете лекаря!"
    L["healme_target"] = "Вы зовете лекаря!"

    L["hello"] = "Вы от всего сердца приветствуете всех!"
    L["hello_target"] = "Вы от всего сердца приветствуете <Target>!"

    L["helpme"] = "Вы зовете на помощь!"
    L["helpme_target"] = "Вы зовете на помощь!"

    L["highfive"] = "Вы поднимаете руку для дружеского приветствия."
    L["highfive_target"] = "Вы по дружески здороваетесь с <Target>!"

    L["holdhand"] = "Вам хочется с кем-нибудь подержаться за руку."
    L["holdhand_target"] = "Вы держитесь с <Target> за руку."

    L["hug"] = "Вы хотите, чтобы вас обняли."
    L["hug_target"] = "Вы крепко обнимаете <Target>."

    L["hungry"] = "Вы голодны!"
    L["hungry_target"] = "Вы голодны. Возможно, у <Target> есть что-нибудь поесть..."

    L["huzzah"] = "Вы бурно веселитесь! Ура!"
    L["huzzah_target"] = "Вы бурно болеете за <Target>! Ура!"

    L["impressed"] = "Вы энергично хлопаете, явно впечатленные."
    L["impressed_target"] = "Вы энергично хлопаете в ладоши <Target>, явно впечатлены."

    L["incoming"] = "Вы кричите, что враги идут!"
    L["incoming_target"] = "Вы указываете на <Target> как на врага!"

    L["insult"] = "Вы думаете, что все вокруг отродья пьяного огра."
    L["insult_target"] = "Вы думаете, что <Target> - отродье пьяного огра."

    L["introduce"] = "Вы представляетесь всем."
    L["introduce_target"] = "Вы представляетесь <Target>."

    L["jk"] = "Вы просто пошутили!"
    L["jk_target"] = "Вы показываете <Target>, что это просто шутка!"

    L["kiss"] = "Вы посылаете воздушный поцелуй."
    L["kiss_target"] = "Вы посылаете воздушный поцелуй <Target>."

    L["kneel"] = "Вы преклоняете колени."
    L["kneel_target"] = "Вы преклоняете колена перед <Target>."

    L["laugh"] = "Вы смеётесь."
    L["laugh_target"] = "Вы смеетесь над <Target>."

    L["lavish"] = "Вы возносите хвалу Свету."
    L["lavish_target"] = "Вы превозносите <Target>."

    L["lay"] = "Вы ложитесь."
    L["lay_target"] = "Вы ложитесь перед <Target>."

    L["lick"] = "Вы облизываетесь."
    L["lick_target"] = "Вы облизываете <Target>."

    L["listen"] = "Вы прислушиваетесь."
    L["listen_target"] = "Вы внимательно слушаете <Target>."

    L["lost"] = "Вы в полном недоумении."
    L["lost_target"] = "Вы хотите показать <Target>, что вы в полной растерянности."

    L["love"] = "Вы чувствуете любовь."
    L["love_target"] = "Вы любите <Target>."

    L["magnificent"] = "Вы одобрительно киваете. Великолепная работа!"
    L["magnificent_target"] = "Вы одобрительно киваете <Target>. Великолепная работа!"

    L["massage"] = "Вам нужен массаж!"
    L["massage_target"] = "Вы массируете плечи <Target>."

    L["meow"] = "Вы мяукаете."
    L["meow_target"] = "Вы мяукаете <Target>."

    L["mock"] = "Вы высмеиваете жизнь и все, что с ней связано."
    L["mock_target"] = "Вы смеетесь над глупостью <Target>."

    L["moo"] = "Мууууууууууу."
    L["moo_target"] = "Вы мычите на <Target>. Mуууууууууу."

    L["moon"] = "Вы снимаете штаны и показываете всем зад."
    L["moon_target"] = "Вы снимаете штаны и показываете всем зад."

    L["mourn"] = "В глубоком молчании вы скорбите о павших."
    L["mourn_target"] = "В глубоком молчании вы скорбите о гибели <Target>."

    L["no"] = "Вы твердо заявляете: 'НЕТ!'"
    L["no_target"] = "Вы отвечаете <Target> 'НЕТ! Этому не бывать!'"

    L["nod"] = "Вы киваете."
    L["nod_target"] = "Вы киваете <Target>."

    L["nosepick"] = "Вы коротаете время, ковыряясь в носу."
    L["nosepick_target"] = "Вы достаете из носу козявку и показываете ее <Target>."

    L["oom"] = "Вы заявляете, что у вас кончается мана!"
    L["oom_target"] = "Вы заявляете, что у вас кончается мана!"

    L["openfire"] = "Вы приказываете открыть огонь."
    L["openfire_target"] = "Вы приказываете открыть огонь."

    L["panic"] = "Вы в панике бегаете кругами."
    L["panic_target"] = "Вы бросаете взгляд на <Target> и впадаете в панику."

    L["pat"] = "Вы хотите чтобы вас погладили."
    L["pat_target"] = "Вы ласково гладите <Target>."

    L["peer"] = "Вы внимательно осматриваетесь."
    L["peer_target"] = "Вы испытующе смотрите на <Target>."

    L["pity"] = "Вы жалеете окружающих."
    L["pity_target"] = "Вы с жалостью взираете на <Target>."

    L["plead"] = "Вы падаете на колени в отчаянной мольбе."
    L["plead_target"] = "Вы умоляете <Target>."

    L["point"] = "Вы показываете в ту сторону."
    L["point_target"] = "Вы показываете на <Target>."

    L["poke"] = "Вы тыкаете себя в живот и хихикаете."
    L["poke_target"] = "Вы пихаете в бок <Target>. Эй!"

    L["ponder"] = "Вы обдумываете ситуацию."
    L["ponder_target"] = "Вы обдумываете действия <Target>."

    L["pounce"] = "Вы выскакиваете из теней."
    L["pounce_target"] = "Вы бросаетесь на <Target>."

    L["pray"] = "Вы молитесь богам."
    L["pray_target"] = "Вы молитесь за <Target>."

    L["purr"] = "Вы мурлычете, как котенок."
    L["purr_target"] = "Вы мурлычете <Target>."

    L["puzzled"] = "Вы озадачены. Что тут происходит?"
    L["puzzled_target"] = "Вы озадачены поведением <Target>."

    L["question"] = "Вы хотите познать смысл жизни."
    L["question_target"] = "Вы спрашиваете <Target>."

    L["raise"] = "Вы поднимаете руку."
    L["raise_target"] = "Вы смотрите на <Target> и поднимаете руку."

    L["rasp"] = "Вы делаете неприличный жест."
    L["rasp_target"] = "Вы делаете неприличный жест в сторону <Target>."

    L["ready"] = "Вы показываете всем, что готовы!"
    L["ready_target"] = "Вы показываете <Target>, что вы готовы!"

    L["regret"] = "Вас переполняет сожаление."
    L["regret_target"] = "Вы уверены, что <Target> пожалеет об этом."   
    
    L["roar"] = "Вы бешено рычите. Какая ярость!"
    L["roar_target"] = "Вы в бешенстве рычите на <Target>. Вот это ярость!"

    L["rofl"] = "Вы катаетесь по полу от смеха."
    L["rofl_target"] = "Вы катаетесь от смеха по полу, глядя на <Target>."

    L["rolleyes"] = "Вы закатываете глаза."
    L["rolleyes_target"] = "Вы смотрите на <Target> и закатываете глаза."   
    
    L["rude"] = "Вы делаете неприличный жест."
    L["rude_target"] = "Вы делаете неприличный жест в сторону <Target>."

    L["salute"] = "Вы становитесь навытяжку и отдаете честь."
    L["salute_target"] = "Вы почтительно отдаете честь <Target>."

    L["scared"] = "Вы испуганы!"
    L["scared_target"] = "Вы пугаетесь <Target>."

    L["scratch"] = "Вы чешетесь. Полегчало!"
    L["scratch_target"] = "Вы чешете <Target>. Как котяво!"

    L["sexy"] = "Вы чересчур сексуальны... прямо невыносимо!"
    L["sexy_target"] = "Вы думаете, что <Target> - сама сексуальность."

    L["shimmy"] = "Вы танцуете перед толпой."
    L["shimmy_target"] = "Вы танцуете перед <Target>."

    L["shiver"] = "Вы зябко дрожите. Холодно!"
    L["shiver_target"] = "Вы дрожите рядом с <Target>. Холодно!"

    L["shoo"] = "Вы отгоняете мерзких тварей."
    L["shoo_target"] = "Вы отгоняете <Target>. Сгинь, зараза!"

    L["shrug"] = "Вы пожимаете плечами. Кто знает?"
    L["shrug_target"] = "Вы пожимаете плечами в ответ <Target>. Кто знает?"

    L["shy"] = "Вы застенчиво улыбаетесь."
    L["shy_target"] = "Вы застенчиво улыбаетесь <Target>."

    L["sigh"] = "Вы испускаете долгий, усталый вздох."
    L["sigh_target"] = "Вы вздыхаете, глядя на <Target>."

    L["silly"] = "Вы рассказываете анекдот."
    L["silly_target"] = "Вы рассказываете анекдот <Target>."

    L["slap"] = "Вы бьете себя по лицу! Ох!"
    L["slap_target"] = "Вы даете пощечину <Target>. Ох!"

    L["sleep"] = "Вы засыпаете. Хррррр..."
    L["sleep_target"] = "Вы засыпаете. Хррррр..."

    L["smile"] = "Вы улыбаетесь."
    L["smile_target"] = "Вы улыбаетесь <Target>."

    L["smirk"] = "На вашем лице появляется хитрая усмешка."
    L["smirk_target"] = "Вы хитро ухмыляетесь <Target>."

    L["snarl"] = "Вы скалитесь и ворчите."
    L["snarl_target"] = "Вы скалитесь и ворчите на <Target>."

    L["snicker"] = "Вы молча давитесь от смеха."
    L["snicker_target"] = "Вы давитесь от смеха, глядя на <Target>."

    L["sniff"] = "Вы нюхаете воздух."
    L["sniff_target"] = "Вы обнюхиваете <Target>."

    L["snub"] = "Вы пренебрежительно выговариваете окружающим вас плебеям."
    L["snub_target"] = "Вы браните <Target>."

    L["soothe"] = "Вам нужно утешение."
    L["soothe_target"] = "Вы утешаете <Target>. Ну-ну, все будет хорошо..."

    L["spit"] = "Вы плюете на землю."
    L["spit_target"] = "Вы плюете на землю."

    L["stare"] = "Вы пристально смотрите вдаль."
    L["stare_target"] = "Вы меряете взглядом <Target>."

    L["surprised"] = "Вы так удивлены!"
    L["surprised_target"] = "Вы удивлены действиями <Target>."

    L["surrender"] = "Вы сдаетесь на милость победителей."
    L["surrender_target"] = "Вы сдаетесь <Target>. Тяжела горечь поражения..."

    L["talk"] = "Вы разговариваете сами с собой, поскольку остальные вас не слушают."
    L["talk_target"] = "Вы хотите обсудить дела с <Target>."

    L["tap"] = "Вы притоптываете ногой. Ну, быстрее же!"
    L["tap_target"] = "Вы притоптываете ногой в ожидании <Target>."

    L["taunt"] = "Вы глумливо поддразниваете всех. Давайте, дураки!"
    L["taunt_target"] = "Вы глумливо поддразниваете <Target>. Ну, давай!"

    L["tease"] = "Вы такая язва!"
    L["tease_target"] = "Вы дразните <Target>."

    L["thank"] = "Вы благодарите всех."
    L["thank_target"] = "Вы благодарите <Target>."

    L["think"] = "Вы погрузились в раздумья."
    L["think_target"] = "Вы думаете о <Target>."    
    
    L["thirsty"] = "Вам так хочется пить. Никто не даст глоточек?"
    L["thirsty_target"] = "Вы показываете <Target> что вы хотите пить. Дадите глоточек?"

    L["tickle"] = "Вы хотите, чтобы вас пощекотали. Хи-хи!"
    L["tickle_target"] = "Вы щекочете <Target>. Хи-хи!"

    L["tired"] = "Вы показываете всем, что устали."
    L["tired_target"] = "Вы показываете <Target>, что устали."

    L["train"] = "Показать 'Поезд'"
    L["train_target"] = "Показать 'Поезд' "

    L["veto"] = "Вы запрещаете всем двигаться."
    L["veto_target"] = "Вы запрещаете <Target> двигаться."

    L["victory"] = "Вы упиваетесь победой."
    L["victory_target"] = "Вы упиваетесь славой вместе с <Target>."

    L["violin"] = "Вы начинаете играть на маленькой скрипочке."
    L["violin_target"] = "Вы играете на маленькой скрипочке для <Target>."

    L["wait"] = "Вы просите всех подождать."
    L["wait_target"] = "Вы просите <Target> подождать."

    L["wave"] = "Вы машете рукой."
    L["wave_target"] = "Вы машете рукой <Target>."

    L["welcome"] = "Вы здороваетесь со всеми."
    L["welcome_target"] = "Вы приветствуете <Target>."

    L["whine"] = "Вы жалобно скулите."
    L["whine_target"] = "Вы жалобно скулите перед <Target>."

    L["whistle"] = "Вы пронзительно свистите."
    L["whistle_target"] = "Вы пронзительно свистите."

    L["whoa"] = "Вы просто в шоке."
    L["whoa_target"] = "Вы в шоке от <Target>."   

    L["wince"] = "Вы сочувственно вздрагиваете."
    L["wince_target"] = "Вы сочувственно вздрагиваете, глядя на <Target>. Похоже, было больно!"

    L["wink"] = "Вы хитро подмигиваете."
    L["wink_target"] = "Вы хитро подмигиваете <Target>."

    L["work"] = "Вы приступаете к работе."
    L["work_target"] = "Вы работаете с <Target>."

    L["yawn"] = "Вы сонно зеваете."
    L["yawn_target"] = "Вы лениво зеваете, глядя на <Target>."

    L["yw"] = "Вы были рады помочь."
    L["yw_target"] = "Вы были рады помочь <Target>."

  end

end
