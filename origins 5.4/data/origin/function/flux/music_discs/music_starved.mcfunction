#apply music starved for level 1 utility
scoreboard players set @s[scores={disc_inserted=1,flux=1..10}] sec 5
scoreboard players set @s[scores={disc_inserted=1,flux=1..10}] min 0
effect give @s[scores={disc_inserted=1,flux=1..10}] blindness 6


#apply music starved for level 2 utility
scoreboard players set @s[scores={disc_inserted=1,flux=11..20}] sec 10
scoreboard players set @s[scores={disc_inserted=1,flux=11..20}] min 0
effect give @s[scores={disc_inserted=1,flux=11..20}] blindness 11

#apply music starved for level 1 combat
scoreboard players set @s[scores={disc_inserted=1,flux=21..30}] sec 10
scoreboard players set @s[scores={disc_inserted=1,flux=21..30}] min 0
effect give @s[scores={disc_inserted=1,flux=21..30}] blindness 11

#apply music starved for level 2 combat
scoreboard players set @s[scores={disc_inserted=1,flux=31..40}] sec 15
scoreboard players set @s[scores={disc_inserted=1,flux=31..40}] min 0
effect give @s[scores={disc_inserted=1,flux=31..40}] blindness 16


#apply music starved stats
scoreboard players set @s[scores={disc_inserted=1,flux=0..}] flux -2

scoreboard players set @s[scores={flux=-2}] sec_timer 20