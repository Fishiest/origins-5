team add blind
#team modify blind color black
#team modify blind prefix {"text":"[Blind Assasin] ","color":"black"}
scoreboard objectives add invis trigger
scoreboard objectives add numbers dummy
scoreboard objectives add sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add sneaking2 minecraft.custom:minecraft.sneak_time
scoreboard players set !one numbers 1
scoreboard players set !two numbers 2
scoreboard players set !ten numbers 10
scoreboard players set !400 numbers 400
scoreboard objectives add hp health

team modify blind seeFriendlyInvisibles false
scoreboard objectives add beserker_active dummy
scoreboard objectives add timesincehorn dummy
scoreboard objectives add swiming custom:swim_one_cm
scoreboard objectives add sprinting custom:sprint_one_cm
scoreboard objectives add riding custom:horse_one_cm
scoreboard objectives add boat custom:boat_one_cm

team add tank
#team modify tank color gray
#team modify tank prefix {"text":"[Tank] ","color":"gray"}
#team modify tank seeFriendlyInvisibles false
team add armadillo
scoreboard objectives add ego dummy
scoreboard objectives add egotimer dummy
#team modify armadillo color gold
#team modify armadillo prefix {"text":"[Armadillo] ","color":"gold"}
#team modify armadillo seeFriendlyInvisibles false
team add healer
team modify healer color light_purple


team add flux
scoreboard objectives add flux dummy
scoreboard objectives add min dummy
scoreboard objectives add sec dummy
scoreboard objectives add sec_timer dummy
scoreboard objectives add disc_inserted dummy

scoreboard objectives add originSelect trigger
scoreboard objectives add justJoined minecraft.custom:minecraft.play_time
scoreboard objectives add damage minecraft.custom:minecraft.damage_taken
scoreboard objectives add prog dummy
scoreboard objectives add dimension_access dummy
scoreboard objectives add adminFag trigger


scoreboard objectives add death deathCount
scoreboard players set #dimensionaccess dimension_access 0

scoreboard objectives add degg trigger
scoreboard objectives add DragonEgg trigger

#execute as @r at @s run function origin:test with entity @s SelectedItem
say gay_sex