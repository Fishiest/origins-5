#music disc title stuff
    #misc
    title @s[scores={flux = -2}] actionbar [{"text":"Music Starved: ","color":"#1a1a1a","bold": true},{"score":{"name": "@s","objective":"min"}},{"text": ":"},{"score":{"name": "@s","objective": "sec"}}]
    title @s[scores={flux = 0}] actionbar {"text":"No disc inserted "}


    #creator
        #musicbox
        title @s[scores={flux = 1}] actionbar [{"text":"Creator/Musicbox: ","color":"#d47a31"},{"score":{"name": "@s","objective":"min"}},{"text": ":"},{"score":{"name": "@s","objective": "sec"}}]
        title @s[scores={flux = 2}] actionbar [{"text":"Creator/musicbox - ","color":"#d47a31","italic": true},{"text":"Ambient"}]
        #normal
     title @s[scores={flux = 11}] actionbar [{"text":"Creator: ","color":"#d47a31","bold": true},{"score":{"name": "@s","objective":"min"}},{"text": ":"},{"score":{"name": "@s","objective": "sec"}}]
     title @s[scores={flux = 12}] actionbar [{"text":"Creator - ","color":"#d47a31","italic": true,"bold": true},{"text":"Ambient"}]
#spacer



#joined flux stuff
    execute unless score @s disc_inserted matches -2147483648..2147483647 run scoreboard players set @s disc_inserted 0
    execute unless score @s flux matches -2147483648..2147483647 run scoreboard players set @s flux 0
    execute unless score @s sec_timer matches -30.. run scoreboard players set @s sec_timer 0
    execute unless score @s ambient_timer matches -30.. run scoreboard players set @s ambient_timer 0

#keep music off if dimension changed
stopsound @s[scores={dimension_traveled_on_current_disc=1,disc_inserted=1}] record

#timer stuff
    execute unless score @s flux matches 0 run scoreboard players remove @s[scores={sec_timer= 0..}] sec_timer 1
    execute as @s[scores={sec_timer = ..0}] run function origin:flux/second_tick
    scoreboard players set @s[scores={sec_timer = ..0}] sec_timer 20
    scoreboard players set @s[scores={flux = 0}] sec_timer 20
    execute unless score @s sec_timer matches -30.. run scoreboard players set @s sec_timer 20
#spacer

#apply music starved
execute as @s[scores={min=0,sec=-1,flux=1..,disc_inserted=1}] run function origin:flux/music_discs/music_starved


#unapply music starved and set stats to default
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_absorption base set -12
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_health base set 14
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_damage base set .8
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s mining_efficiency base set -.2
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s minecraft:sneaking_speed base set 0.3
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s block_interaction_range base set 4.5
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s movement_speed base set .09
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_speed base set 3.5
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s scale base set 1
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor base set -4
    execute as @s[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor_toughness base set -1

    scoreboard players set @s[scores={min=0,sec=-1,flux=-2}] dimension_traveled_on_current_disc 0
    scoreboard players set @s[scores={min=0,sec=-1,flux=-2}] disc_inserted 0
    scoreboard players set @s[scores={min=0,sec=-1,flux=-2}] flux 0
#spacer


#apply musicstarved stats
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s max_absorption base set -12
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s max_health base set 8
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s attack_damage base set .5
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s mining_efficiency base set -.2
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s minecraft:sneaking_speed base set 0.3
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s block_interaction_range base set 4.5
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s movement_speed base set .04
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s attack_speed base set 3.5
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s scale base set 1
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s armor base set -4
    execute as @s[team=flux] if score @s flux matches -2 run attribute @s armor_toughness base set -1

#apply default stats
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s max_absorption base set -12
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s max_health base set 14
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s attack_damage base set .8
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s mining_efficiency base set -.2
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s minecraft:sneaking_speed base set 0.3
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s block_interaction_range base set 4.5
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s movement_speed base set .09
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s attack_speed base set 3.5
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s scale base set 1
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s armor base set -4
    execute as @s[team=flux] if score @s flux matches 0 run attribute @s armor_toughness base set -1

#apply disc dependent stats
    #health
        #execute as @s[team=flux] if score @s flux matches 10..11 run attribute @s max_absorption base set 0
        #execute as @s[team=flux] if score @s flux matches 11 run attribute @s max_health base set 30


    #fuckin mining
        #execute as @s[team=flux] if score @s flux matches 20..21 run attribute @s attack_damage base set 1.5
        #execute as @s[team=flux] if score @s flux matches 21 run attribute @s mining_efficiency base set 1.5

    #creator
        #creator passive
            execute as @s[team=flux] if score @s flux matches 2 run attribute @s block_interaction_range base set 5
            execute as @s[team=flux] if score @s flux matches 2 run attribute @s sneaking_speed base set .6
            #level 2
            execute as @s[team=flux] if score @s flux matches 12 run attribute @s block_interaction_range base set 5
            execute as @s[team=flux] if score @s flux matches 12 run attribute @s sneaking_speed base set .6
            execute as @s[team=flux] if score @s flux matches 12 run attribute @s scale base set .65

        #creator active
            execute as @s[team=flux] if score @s flux matches 1 run attribute @s block_interaction_range base set 6.5
            execute as @s[team=flux] if score @s flux matches 1 run attribute @s sneaking_speed base set 1
            #level 2
            execute as @s[team=flux] if score @s flux matches 11 run attribute @s sneaking_speed base set 1
            execute as @s[team=flux] if score @s flux matches 11 run attribute @s block_interaction_range base set 6.5
            execute as @s[team=flux] if score @s flux matches 11 run attribute @s scale base set .65


    #fukin armour
        #execute as @s[team=flux] if score @s flux matches 40..41 run attribute @s armor base set 1.5
        #execute as @s[team=flux] if score @s flux matches 41 run attribute @s armor_toughness base set 1.5
#spacer



#handle ambient buffs and music
    #tick the timer for ambient music down, this is used to restart the music
    execute unless entity @s[scores={flux=0}] run scoreboard players remove @s[scores={ambient_timer= 0..,disc_inserted=0}] ambient_timer 1

    #apply creator flux states
        #music box
               #apply mb-creator flux state
                execute unless entity @s[scores={flux=2}] run execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator_music_box"} run scoreboard players set @s ambient_timer 0
               execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator_music_box"} run scoreboard players set @s flux 2

               #apply mb-creator music
               execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=2}] run function origin:flux/end_ambient_music
               execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=2}] run playsound alt_music_disc:musicboxstereo music @s ~ ~ ~ .7 1 1
               scoreboard players set @s[scores={ambient_timer = ..0,flux=2}] ambient_timer 1440
        #regular
               #apply creator flux state
               execute unless entity @s[scores={flux=12}] run execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator"} run scoreboard players set @s ambient_timer 0
               execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator"} run scoreboard players set @s flux 12

               #apply creator music
                execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=12}] run function origin:flux/end_ambient_music
               execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=12}] run playsound alt_music_disc:creatorstereo music @s ~ ~ ~ .7 1 1
               scoreboard players set @s[scores={ambient_timer = ..0,flux=12}] ambient_timer 3520

    #end ambient effects
        execute unless data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components."minecraft:item_model" run scoreboard players set @s flux 0
        execute unless data entity @s Inventory[{Slot:17b}].components."minecraft:item_model" run scoreboard players set @s ambient_timer 0
    #end ambient music
        execute unless data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components."minecraft:item_model" run function origin:flux/end_ambient_music
        execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components."minecraft:item_model" run function origin:flux/end_vanilla_music
        execute if entity @s[scores={disc_inserted=1}] run function origin:flux/end_vanilla_music

