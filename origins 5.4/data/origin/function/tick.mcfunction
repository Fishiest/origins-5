#blind stuffs
execute as @a[team=blind,scores={beserker_active=0}] run attribute @s max_health base set 16
execute as @a[team=blind,scores={beserker_active=1}] run attribute @s max_health base set 6
scoreboard players enable @a[team=blind] invis
scoreboard players operation @r[team=blind] invis %= !two numbers
effect give @a[scores={invis=1},team=blind] invisibility infinite 0 true
effect give @a[scores={invis=1},team=blind] hunger 3 6 true
execute as @a[team=blind] if score @s hp matches ..6 run attribute @s attack_damage modifier add 1 .75 add_multiplied_total
execute as @a[team=blind] if score @s hp matches ..6 run title @s actionbar {"text":"1.75x damage","color":"red"}
execute as @a[team=blind] if score @s hp matches 7.. run attribute @s attack_damage modifier remove 1
execute as @a[team=blind] if score @s hp matches 7.. run title @s actionbar {"text":"1x damage","color":"green"}


effect clear @a[scores={invis=0},team=blind] invisibility
execute as @a run scoreboard players remove @s[scores={timesincehorn = 1..}] timesincehorn 1
execute as @a[team=blind] unless entity @s[scores={sprinting=0,swiming=0,boat=0,riding=0},nbt={FallFlying:0b}] run effect give @s hunger 3 0 true
execute as @a[team=blind] run scoreboard players set @s sprinting 0
execute as @a[team=blind] run scoreboard players set @s swiming 0
execute as @a[team=blind] run scoreboard players set @s boat 0
execute as @a[team=blind] run scoreboard players set @s riding 0


#tank
execute as @a[team=tank,scores={lspark_timer=0}] run attribute @s max_health base set 30
execute as @a[team=tank,scores={lspark_timer=1200..}] run attribute @s max_health base set 30
scoreboard players set @a[team=tank,scores={lspark_timer=1200..}] lspark_cooldown 1
scoreboard players set @a[team=tank,scores={lspark_timer=1200..}] lspark_timer 0
scoreboard players set @a[team=tank,scores={lspark_cooldown=2400..}] lspark_cooldown 0
#execute as @a[team=tank] if score @s hp matches 30 run effect give @s resistance 1 2 true

#tank spark shit
scoreboard players enable @a[team=tank] lspark
scoreboard players enable @a[team=tank] rspark
execute as @a[team=tank,scores={lspark=1}] if score @s lspark_cooldown matches 0 if score @s lspark_timer matches 0 run function origin:tank/lspark/lsparkpass
execute as @a[team=tank,scores={lspark=1}] if score @s lspark_cooldown matches 1.. run function origin:tank/lspark/lsparkfail
execute as @a[team=tank,scores={lspark=1}] if score @s lspark_timer matches 1.. run function origin:tank/lspark/lsparkfail
#title @a[team=tank] actionbar {"text":"lspark temp timer | rspark temp timer","color":"red"}
effect clear @a[team=tank] slowness
scoreboard players add @a[team=tank,scores={lspark_timer=1..}] lspark_timer 1
scoreboard players add @a[team=tank,scores={lspark_cooldown=1..}] lspark_cooldown 1
#execute as @a[team=tank,tag=admin] run title @s actionbar [{"text":"lspark timer: ","color":"red"},{"score":{"objective":"lspark_timer","name":"@s"}},{"text":" | lspark cooldown: ","color":"red"},{"score":{"objective":"lspark_cooldown","name":"@s"}}]
scoreboard players set @a[scores={justJoined=1}] lspark_timer 0
scoreboard players set @a[scores={justJoined=1}] lspark_cooldown 0
scoreboard players set @a[scores={justJoined=1}] rspark_timer 0
scoreboard players set @a[scores={justJoined=1}] rspark_cooldown 0
execute as @a[team=tank,scores={rspark=1}] if score @s rspark_cooldown matches 0 if score @s rspark_timer matches 0 run function origin:tank/rspark/rsparkpass
execute as @a[team=tank,scores={rspark=1}] if score @s rspark_cooldown matches 1.. run function origin:tank/rspark/rsparkfail
execute as @a[team=tank,scores={rspark=1}] if score @s rspark_timer matches 1.. run function origin:tank/rspark/rsparkfail
#execute as @a[team=tank,tag=admin] run title @s actionbar [{"text":"rspark timer: ","color":"red"},{"score":{"objective":"rspark_timer","name":"@s"}},{"text":" | rspark cooldown: ","color":"red"},{"score":{"objective":"rspark_cooldown","name":"@s"}}]
execute as @a[team=tank] if score @s lspark_timer matches 0 if score @s rspark_timer matches 0 run title @s actionbar [{"color":"#5f5555","score":{"objective":"lspark_cooldown","name":"@s"}},{"color":"#5f5555","text":" ➀ | ➁ "},{"color":"#5f5555","score":{"objective":"rspark_cooldown","name":"@s"}}]
execute as @a[team=tank] if score @s lspark_timer matches 1.. if score @s rspark_timer matches 1.. run title @s actionbar [{"color":"red","score":{"objective":"lspark_timer","name":"@s"}},{"color":"red","text":" ➀ | ➁ "},{"color":"red","score":{"objective":"rspark_timer","name":"@s"}}]
execute as @a[team=tank] if score @s lspark_timer matches 1.. if score @s rspark_timer matches 0 run title @s actionbar [{"color":"red","score":{"objective":"lspark_timer","name":"@s"}},{"color":"red","text":" ➀ | "},{"text":"➁ ","color":"#5f5555"},{"color":"#5f5555","score":{"objective":"rspark_cooldown","name":"@s"}}]
execute as @a[team=tank] if score @s lspark_timer matches 0 if score @s rspark_timer matches 1.. run title @s actionbar [{"color":"#5f5555","score":{"objective":"lspark_cooldown","name":"@s"}},{"color":"#5f5555","text":" ➀ "},{"text":"| ➁ ","color":"red"},{"color":"red","score":{"objective":"rspark_timer","name":"@s"}}]
scoreboard players add @a[team=tank,scores={rspark_timer=1..}] rspark_timer 1
scoreboard players add @a[team=tank,scores={rspark_cooldown=1..}] rspark_cooldown 1
scoreboard players set @a[team=tank,scores={rspark_timer=300..}] rspark_cooldown 1
scoreboard players set @a[team=tank,scores={rspark_timer=300..}] rspark_timer 0
scoreboard players set @a[team=tank,scores={rspark_cooldown=2400..}] rspark_cooldown 0
execute as @a[team=tank,scores={rspark_timer=1..}] if score @s damageDealt matches 25.. run effect give @s instant_health 1 0
execute as @a[team=tank,scores={rspark_timer=1..}] if score @s damageDealt matches 25.. run say test
execute as @a[team=tank,scores={rspark_timer=1..}] if score @s damageDealt matches 25.. run scoreboard players remove @s damageDealt 25
scoreboard players set @a[team=tank,scores={rspark=0}] damageDealt 0

#armadillo
effect give @a[team=armadillo] instant_health infinite 1 true
#execute as @a[team=armadillo,scores={damage=1..}] run say i took damage like a bitch

#removing ego and egotimer upon damage
execute as @a[team=armadillo,scores={damage=1..}] run scoreboard players set @s egotimer 0
execute as @a[team=armadillo,scores={damage=1..}] run scoreboard players remove @s ego 1
#execute as @a[team=armadillo] if score @s ego matches ..0 run scoreboard players set @s ego 0

#various tellraw commands
execute as @a[team=armadillo] if score @s ego matches ..-1 run gamerule showDeathMessages false
execute as @a[team=armadillo] if score @s ego matches ..-1 run kill @s
execute as @a[team=armadillo] if score @s ego matches ..-1 run tellraw @a ["",{"text":""},{"selector":"@s"},{"text":" died of low self-esteem."}]
execute as @a[team=armadillo] if score @s ego matches ..-1 run gamerule showDeathMessages true
execute as @a[team=armadillo] if score @s ego matches 10.. run scoreboard players set @s ego 10
execute as @a[team=armadillo] if score @s damage matches 1.. run scoreboard players operation @s damage /= !ten numbers
execute as @a[team=armadillo] if score @s damage matches 1.. run tellraw @s ["",{"text":"You would've taken [","color":"#ff3366"},{"score":{"name":"@s","objective":"damage"},"color":"#c51c1c","bold":true},{"text":"] damage!","color":"#ff3366"}]

#manual ego settings
execute as @a[team=armadillo,scores={damage=1..}] run scoreboard players set @s damage 0
execute as @a[scores={justJoined=1}] run scoreboard players set @s ego 5
execute as @a[scores={justJoined=1}] run scoreboard players set @s egotimer 0
execute as @a[scores={justJoined=1}] run scoreboard players set @s damage 0

#death detection
#ivy this was armadillo death detection but go off girlboss :3
execute as @a[team=armadillo] if score @s death matches 1.. run scoreboard players set @s ego 0
execute as @a[team=flux,scores={death=1,disc_inserted=1}] run function origin:flux/music_discs/end_disc_effects
execute as @a if score @s death matches 1.. run scoreboard players set @s death 0

#ego timer
execute as @a[team=armadillo,scores={damage=0,ego=..9}] run scoreboard players add @s egotimer 1
execute as @a[team=armadillo] if score @s[scores={ego=..9}] egotimer matches 400.. run scoreboard players add @s ego 1
execute as @a[team=armadillo] run scoreboard players operation @s egotimer %= !400 numbers

#ego actionbar
execute as @a[team=armadillo] if score @s egotimer matches 0..9 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 10..19 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 20..39 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 40..59 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 60..79 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 80..99 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 100..119 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 120..139 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 140..159 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 160..179 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 180..199 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 200..219 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 220..239 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 240..259 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 260..279 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 280..299 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 300..319 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 320..339 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 340..359 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 360..379 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ □","color":"#ff3366"}]
execute as @a[team=armadillo] if score @s egotimer matches 380..399 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■","color":"#ff3366"}]
#at full ego keeps ego bar full
execute as @a[team=armadillo] if score @s ego matches 10 run title @s actionbar ["",{"text":"Ego: [","color":"#ff3366"},{"color":"#c51c1c","bold":true,"score":{"objective":"ego","name":"@s"}},{"text":"] ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■ ■","color":"#ff3366"}]
#ego movement speed
execute as @a[team=armadillo] if score @s ego matches 0 run attribute @s movement_speed base set 0.05
execute as @a[team=armadillo] if score @s ego matches 1 run attribute @s movement_speed base set 0.078
execute as @a[team=armadillo] if score @s ego matches 2 run attribute @s movement_speed base set 0.081
execute as @a[team=armadillo] if score @s ego matches 3 run attribute @s movement_speed base set 0.084
execute as @a[team=armadillo] if score @s ego matches 4 run attribute @s movement_speed base set 0.088
execute as @a[team=armadillo] if score @s ego matches 5 run attribute @s movement_speed base set 0.092
execute as @a[team=armadillo] if score @s ego matches 6 run attribute @s movement_speed base set 0.097
execute as @a[team=armadillo] if score @s ego matches 7 run attribute @s movement_speed base set 0.102
execute as @a[team=armadillo] if score @s ego matches 8 run attribute @s movement_speed base set 0.108
execute as @a[team=armadillo] if score @s ego matches 9 run attribute @s movement_speed base set 0.115
execute as @a[team=armadillo] if score @s ego matches 10 run attribute @s movement_speed base set 0.17

#ego health
execute as @a[team=armadillo] if score @s ego matches 0 run attribute @s max_health base set 2
execute as @a[team=armadillo] if score @s ego matches 1 run attribute @s max_health base set 10
execute as @a[team=armadillo] if score @s ego matches 2 run attribute @s max_health base set 12
execute as @a[team=armadillo] if score @s ego matches 3 run attribute @s max_health base set 14
execute as @a[team=armadillo] if score @s ego matches 4 run attribute @s max_health base set 16
execute as @a[team=armadillo] if score @s ego matches 5 run attribute @s max_health base set 18
execute as @a[team=armadillo] if score @s ego matches 6 run attribute @s max_health base set 20
execute as @a[team=armadillo] if score @s ego matches 7 run attribute @s max_health base set 22
execute as @a[team=armadillo] if score @s ego matches 8 run attribute @s max_health base set 24
execute as @a[team=armadillo] if score @s ego matches 9 run attribute @s max_health base set 26
execute as @a[team=armadillo] if score @s ego matches 10 run attribute @s max_health base set 40


#healer unused pensive emoji
execute as @a[team=healer] run attribute @s max_health base set 20
effect give @a[team=healer] glowing infinite 0 true
execute as @a[team=healer,scores={sneaking2=1}] at @s run effect give @e[distance=..5] regeneration 2 1 false
execute as @a[team=healer,scores={sneaking=10}] at @s run particle minecraft:heart ~ ~ ~ 3 0 3 .1 100 normal
scoreboard players operation @r[team=healer] sneaking %= !ten numbers
scoreboard players operation @r[team=healer] sneaking2 %= !one numbers


#flux stuffs

execute as @a[team=flux] run function origin:flux/fluxtick

scoreboard players enable @a[scores={justJoined=1}] originSelect
tellraw @a[scores={justJoined=1}] ["Welcome! Please select your origin.\n\n",{"text":"[Flux]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger originSelect set 1"}},"\n",{"text":"[Assassin]","clickEvent":{"action":"run_command","value":"/trigger originSelect set 2"},"color":"dark_red"},"\n",{"text":"[Armadillo]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger originSelect set 3"}},"\n",{"text":"[Tank]","clickEvent":{"action":"run_command","value":"/trigger originSelect set 4"},"color":"gray"},"\n",{"text":"[Human]","clickEvent":{"action":"run_command","value":"/trigger originSelect set 5"},"color":"white"}]
execute as @a[scores={originSelect=1}] run team join flux
execute as @a[scores={originSelect=2}] run team join blind
execute as @a[scores={originSelect=2}] run attribute @s max_health base set 16
execute as @a[scores={originSelect=2}] run give @s goat_horn
execute as @a[scores={originSelect=3}] run team join armadillo
execute as @a[scores={originSelect=4}] run team join tank
execute as @a[scores={originSelect=1..}] run tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHave fun :3"]
execute as @a[scores={originSelect=1..}] run scoreboard players set @s originSelect 0

#eine Katze!!!
execute as @a[team=catgirl] at @s run function origin:catgirl with entity @s

#admin reset the stats cus thats cool
execute as @a[tag=admin] run scoreboard players enable @s adminFag
execute as @a[scores={adminFag=1..}] run attribute @s armor base reset
execute as @a[scores={adminFag=1..}] run attribute @s armor_toughness base reset
execute as @a[scores={adminFag=1..}] run attribute @s attack_damage base reset
execute as @a[scores={adminFag=1..}] run attribute @s attack_knockback base reset
execute as @a[scores={adminFag=1..}] run attribute @s attack_speed base reset
execute as @a[scores={adminFag=1..}] run attribute @s block_break_speed base reset
execute as @a[scores={adminFag=1..}] run attribute @s block_interaction_range base reset
execute as @a[scores={adminFag=1..}] run attribute @s burning_time base reset
execute as @a[scores={adminFag=1..}] run attribute @s entity_interaction_range base reset
execute as @a[scores={adminFag=1..}] run attribute @s explosion_knockback_resistance base reset
execute as @a[scores={adminFag=1..}] run attribute @s fall_damage_multiplier base reset
execute as @a[scores={adminFag=1..}] run attribute @s flying_speed base reset
execute as @a[scores={adminFag=1..}] run attribute @s follow_range base reset
execute as @a[scores={adminFag=1..}] run attribute @s gravity base reset
execute as @a[scores={adminFag=1..}] run attribute @s jump_strength base reset
execute as @a[scores={adminFag=1..}] run attribute @s knockback_resistance base reset
execute as @a[scores={adminFag=1..}] run attribute @s luck base reset
execute as @a[scores={adminFag=1..}] run attribute @s max_absorption base reset
execute as @a[scores={adminFag=1..}] run attribute @s max_health base reset
execute as @a[scores={adminFag=1..}] run attribute @s movement_speed base reset
execute as @a[scores={adminFag=1..}] run attribute @s scale base reset
execute as @a[scores={adminFag=1..}] run attribute @s fall_damage_multiplier base reset
execute as @a[scores={adminFag=1..}] run attribute @s safe_fall_distance base reset
execute as @a[scores={adminFag=1..}] run effect clear @s
execute as @a[scores={adminFag=1..}] run scoreboard players set @s adminFag 0


#dragon egg stuff
scoreboard players enable @a degg
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] run scoreboard players enable @s DragonEgg
execute as @a[nbt=!{Inventory:[{id:"minecraft:dragon_egg"}]}] run scoreboard players set @s DragonEgg 0
execute as @a[scores={DragonEgg=1..}] run function origin:dragonegg
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] if score @s degg matches 1 run effect give @s strength 1 1 true
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] if score @s degg matches 2 run effect give @s speed 1 1 true
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] if score @s degg matches 3 run effect give @s fire_resistance 1 0 true
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] if score @s degg matches 4 run effect give @s haste 1 1 true
execute as @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] if score @s degg matches 5 run effect give @s jump_boost 1 1 true

#pvp list
tellraw @a[scores={pvplist=1..}] ["",{"text":"[PvP List]:","color":"gold"},"\n",{"selector":"@a[scores={pvp=1..}]"}]
scoreboard players enable @a pvplist
scoreboard players set @a[scores={pvplist=1..}] pvplist 0
scoreboard players set @a[scores={justJoined=1}] pvp 1
scoreboard players enable @a pvp
scoreboard players operation @r pvp %= !two numbers
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:mace"}]}] pvp 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:dragon_egg"}]}] pvp 1

scoreboard players enable @a vanillaMusicDisable
execute as @a[scores={vanillaMusicDisable=1}] run function origin:flux/end_vanilla_music
scoreboard players set @a[scores={vanillaMusicDisable=2..}] vanillaMusicDisable 0
#say alkjsdf


#dim lock
#prog 0 = overworld only
#prog 1 = neth & overworld
#prog 2 = everything
#execute unless entity @e[tag=neth,type=armor_stand] in the_nether run summon armor_stand 0 1000 0 {NoGravity:1b,Invisible:1b,Tags:["neth"]}
#execute unless entity @e[tag=end,type=armor_stand] in the_end run summon armor_stand 0 1000 0 {NoGravity:1b,Invisible:1b,Tags:["end"]}
#execute as @e[tag=neth] at @s run execute as @a[distance=0..,scores={prog=0}] in overworld run tp @s 0 100 0
#execute as @e[tag=end] at @s run execute as @a[distance=0..,scores={prog=..1}] in overworld run tp @s 0 100 0
#give @s goat_horn[instrument={sound_event:"music_disc.creator",description:"gay sex",range:15,use_duration:90},use_cooldown={seconds:90,cooldown_group:"34"},item_model=music_disc_creator_music_box,item_name="'music disc'"] 1

