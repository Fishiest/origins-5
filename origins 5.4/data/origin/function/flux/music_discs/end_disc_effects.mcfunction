
scoreboard players set @s[scores={disc_inserted=1,death=1}] sec 0
scoreboard players set @s[scores={disc_inserted=1,death=1}] min 0
scoreboard players set @s[scores={disc_inserted=1,death=1}] flux 0
scoreboard players set @s[scores={disc_inserted=1,death=1}] disc_inserted 0

scoreboard players set @s[scores={disc_inserted=1,death=0}] dimension_traveled_on_current_disc 1
tellraw @s[scores={disc_inserted=1,death=0}] "music muted until end of current disc from traveling dimensions/relogging due to a minecraft bug making stuff weird"

advancement revoke @s only origin:flux/change_dimension_flux