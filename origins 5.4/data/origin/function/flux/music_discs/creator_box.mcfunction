advancement revoke @s only origin:flux/horn_creator_box
scoreboard players set @s timesincehorn 140
scoreboard players set @s sec 11
scoreboard players set @s min 1
scoreboard players set @s flux 32
scoreboard players set @s disc_inserted 1


execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_absorption base set -12
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s max_health base set 14
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_damage base set .8
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s mining_efficiency base set -.2
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s movement_speed base set .09
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s attack_speed base set 3.5
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor base set -4
execute as @a[team=flux,scores={min=0,sec=-1,flux=-2}] run attribute @s armor_toughness base set -1