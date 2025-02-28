execute as @s[scores={sec = ..0}] run function origin:flux/minute_tick

scoreboard players remove @s[scores={sec = 0..}] sec 1
