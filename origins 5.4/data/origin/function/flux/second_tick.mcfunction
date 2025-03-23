execute as @s[scores={sec = ..0}] run function origin:flux/minute_tick

scoreboard players remove @s[scores={sec = 0..}] sec 1

scoreboard players add @s[scores={disc_inserted=1}] active_cooldown_timer 1
scoreboard players remove @s[scores={disc_inserted=0,active_cooldown_timer=1..}] active_cooldown_timer 1