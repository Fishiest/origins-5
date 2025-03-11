advancement revoke @s only origin:flux/horn-creator_box
scoreboard players set @s[scores={disc_inserted=0}] sec 11
scoreboard players set @s[scores={disc_inserted=0}] min 1
scoreboard players set @s[scores={disc_inserted=0}] flux 1
scoreboard players set @s[scores={disc_inserted=0}] disc_inserted 1




execute as @s run attribute @s max_absorption base set -12
execute as @s run attribute @s max_health base set 14
execute as @s run attribute @s attack_damage base set .8
execute as @s run attribute @s mining_efficiency base set -.2
execute as @s run attribute @s movement_speed base set .09
execute as @s run attribute @s attack_speed base set 3.5
execute as @s run attribute @s armor base set -4
execute as @s run attribute @s armor_toughness base set -1


