#execute if predicate origin:jump as @s unless block ~ ~-.25 ~ #air run effect give @s levitation 1 19 true
execute as @a[team=catgirl] run attribute @s max_health base set 12
execute as @a[team=catgirl] run attribute @s movement_speed base set 0.15
execute as @a[team=catgirl] run attribute @s safe_fall_distance base set 9999
execute as @a[team=catgirl] run attribute @s fall_damage_multiplier base set 0
scoreboard players enable @a[team=catgirl] dash
execute as @s if score @s dash matches 1.. run summon armor_stand ~ ~ ~ {Invisible:1b,Small:1b,NoGravity:1b,Tags:["catgirl"]}
execute as @s if score @s dash matches 1.. if score @s dashRay matches 1 run execute anchored eyes as @s run tp @e[tag=catgirl,limit=1] ^ ^ ^ ~ ~
execute as @s if score @s dash matches 1.. run execute as @e[type=armor_stand,tag=catgirl] at @s run tp @s ^ ^ ^.5
execute as @s if score @s dash matches 1.. run scoreboard players add @s dashRay 1
execute as @s if score @s dash matches 1.. run execute at @e[type=armor_stand,tag=catgirl] run particle firework ~ ~ ~ 0.1 0.1 0.1 0.1 1
execute as @s if score @s dash matches 1.. if score @s dashRay matches 21.. run tp @a[team=catgirl] @e[type=armor_stand,tag=catgirl,limit=1]
execute as @s if score @s dash matches 1.. if score @s dashRay matches 21.. run kill @e[type=armor_stand,tag=catgirl]
execute if score @s dashRay matches 21.. run scoreboard players set @s dash 0
execute if score @s dashRay matches 21.. run scoreboard players set @s dashRay 0