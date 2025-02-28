advancement revoke @s only origin:blind/blind_horn_used

execute unless score @s beserker_active matches 0..1 run scoreboard players set @s timesincehorn 0
execute unless score @s beserker_active matches 0..1 run scoreboard players set @s beserker_active 0
execute as @s[scores={beserker_active=0,timesincehorn=0}] run function origin:blind/blindi_active
execute as @s[scores={beserker_active=1,timesincehorn=0}] run function origin:blind/blindi_inactive






