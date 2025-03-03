#music disc title stuff
title @s[scores={flux = 32}] actionbar [{"text":"Creator/Musicbox: ","color":"#d47a31"},{"score":{"name": "@s","objective":"min"}},{"text": ":"},{"score":{"name": "@s","objective": "sec"}}]
title @s[scores={flux = -2}] actionbar [{"text":"Music Starved: ","color":"#1a1a1a","bold": true},{"score":{"name": "@s","objective":"min"}},{"text": ":"},{"score":{"name": "@s","objective": "sec"}}]
title @s[scores={flux = 0}] actionbar {"text":"No disc inserted "}

#passive title stuff
title @s[scores={flux = 30}] actionbar [{"text":"Creator/musicbox - ","color":"#d47a31","italic": true},{"text":"Ambient"}]

#joined flux stuff
execute unless score @s disc_inserted matches -2147483648..2147483647 run scoreboard players set @s disc_inserted 0
execute unless score @s flux matches -2147483648..2147483647 run scoreboard players set @s flux 0
execute unless score @s sec_timer matches -30.. run scoreboard players set @s sec_timer 0
execute unless score @s ambient_timer matches -30.. run scoreboard players set @s ambient_timer 0


#timer stuff
execute unless score @s flux matches 0 run scoreboard players remove @s[scores={sec_timer= 0..}] sec_timer 1
execute as @s[scores={sec_timer = ..0}] run function origin:flux/second_tick
scoreboard players set @s[scores={sec_timer = ..0}] sec_timer 20
scoreboard players set @s[scores={flux = 0}] sec_timer 20
execute unless score @s sec_timer matches -30.. run scoreboard players set @s sec_timer 20

#apply music starved
execute as @s[scores={min=0,sec=-1,flux=1..,disc_inserted=1}] run function origin:flux/music_discs/music_starved

#unapply music starved and set stats to default
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_absorption base set -12
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_health base set 14
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_damage base set .8
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s mining_efficiency base set -.2
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s movement_speed base set .09
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_speed base set 3.5
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor base set -4
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor_toughness base set -1
scoreboard players set @s[scores={min=0,sec=-1,flux=-2}] disc_inserted 0
scoreboard players set @s[scores={min=0,sec=-1,flux=-2}] flux 0



#apply musicstarved stats
execute as @a[team=flux] if score @s flux matches -2 run attribute @s max_absorption base set -12
execute as @a[team=flux] if score @s flux matches -2 run attribute @s max_health base set 8
execute as @a[team=flux] if score @s flux matches -2 run attribute @s attack_damage base set .5
execute as @a[team=flux] if score @s flux matches -2 run attribute @s mining_efficiency base set -.2
execute as @a[team=flux] if score @s flux matches -2 run attribute @s movement_speed base set .04
execute as @a[team=flux] if score @s flux matches -2 run attribute @s attack_speed base set 3.5
execute as @a[team=flux] if score @s flux matches -2 run attribute @s armor base set -4
execute as @a[team=flux] if score @s flux matches -2 run attribute @s armor_toughness base set -1

#apply default stats
execute as @a[team=flux] if score @s flux matches 0 run attribute @s max_absorption base set -12
execute as @a[team=flux] if score @s flux matches 0 run attribute @s max_health base set 14
execute as @a[team=flux] if score @s flux matches 0 run attribute @s attack_damage base set .8
execute as @a[team=flux] if score @s flux matches 0 run attribute @s mining_efficiency base set -.2
execute as @a[team=flux] if score @s flux matches 0 run attribute @s movement_speed base set .09
execute as @a[team=flux] if score @s flux matches 0 run attribute @s attack_speed base set 3.5
execute as @a[team=flux] if score @s flux matches 0 run attribute @s armor base set -4
execute as @a[team=flux] if score @s flux matches 0 run attribute @s armor_toughness base set -1

#apply disc dependent active stats
execute as @a[team=flux] if score @s flux matches 10..11 run attribute @s max_absorption base set 0
execute as @a[team=flux] if score @s flux matches 11 run attribute @s max_health base set 30



execute as @a[team=flux] if score @s flux matches 20..21 run attribute @s attack_damage base set 1.5
execute as @a[team=flux] if score @s flux matches 21 run attribute @s mining_efficiency base set 1.5


#creator passive
execute as @a[team=flux] if score @s flux matches 30..31 run attribute @s movement_speed base set .125
execute as @a[team=flux] if score @s flux matches 31 run attribute @s attack_speed base set 6
#creator active
execute as @a[team=flux] if score @s flux matches 32..33 run attribute @s movement_speed base set .15
execute as @a[team=flux] if score @s flux matches 33 run attribute @s attack_speed base set 6



execute as @a[team=flux] if score @s flux matches 40..41 run attribute @s armor base set 1.5
execute as @a[team=flux] if score @s flux matches 41 run attribute @s armor_toughness base set 1.5




#apply passive buffs and music
execute unless entity @s[scores={flux=0}] run scoreboard players remove @s[scores={ambient_timer= 0..,disc_inserted=0}] ambient_timer 1

#apply mb-creator flux state
execute unless entity @s[scores={flux=30}] run execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator_music_box"} run scoreboard players set @s ambient_timer 0
execute if data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components{"minecraft:item_model":"minecraft:music_disc_creator_music_box"} run scoreboard players set @s flux 30

#apply mb-creator music
execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=30}] run stopsound @s record
execute if entity @s[scores={disc_inserted=0,ambient_timer=0,flux=30}] run playsound alt_music_disc:musicboxstereo record @s ~ ~ ~ .7 1 1
scoreboard players set @s[scores={ambient_timer = ..0,flux=30}] ambient_timer 1420





 
#end ambient effects
execute unless data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components."minecraft:item_model" run scoreboard players set @s flux 0
execute unless data entity @s Inventory[{Slot:17b}].components."minecraft:item_model" run scoreboard players set @s ambient_timer 0
execute unless data entity @s[scores={disc_inserted=0}] Inventory[{Slot:17b}].components."minecraft:item_model" run stopsound @s record


