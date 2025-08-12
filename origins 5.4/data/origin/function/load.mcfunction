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
scoreboard players set !20 numbers 20
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
scoreboard objectives add lspark trigger
scoreboard objectives add lspark_timer dummy
scoreboard objectives add lspark_cooldown dummy
scoreboard objectives add rspark trigger
scoreboard objectives add rspark_timer dummy
scoreboard objectives add rspark_cooldown dummy
scoreboard objectives add damageDealt minecraft.custom:minecraft.damage_dealt
team add armadillo
scoreboard objectives add ego dummy
scoreboard objectives add egotimer dummy
#team modify armadillo color gold
#team modify armadillo prefix {"text":"[Armadillo] ","color":"gold"}
#team modify armadillo seeFriendlyInvisibles false
team add healer
team modify healer color light_purple

#oh mein gott eine Katze
team add catgirl
scoreboard objectives add dash trigger
scoreboard objectives add dashRay dummy

team add flux
    #the current flux state(passive or active/music starved)
    scoreboard objectives add flux dummy
    #how many minutes left in the current song
    scoreboard objectives add min dummy
    #how many seconds left in the current minute in the current song
    scoreboard objectives add sec dummy
    #increments by 1 per tick and resets on 20 while reducing sec by one, only active while flux != 0
    scoreboard objectives add sec_timer dummy

    #=1 when an active song is playing or music starved, =0 otherwise including if your playing an ambient song prevents ambient songs from working if =1
    scoreboard objectives add disc_inserted dummy

    #not currently implemented, increments by 1 per second your playing an active, decrements by one per second while not playing an active, prevents using actives if != 0
    scoreboard objectives add active_cooldown_timer dummy
    #tick that goes down by 1 each tick and represents how long left in the current song
    scoreboard objectives add ambient_timer dummy
    #=1 if you have changed dimensions since the start of the current active, if = 1 stopsound @s record 1/tick
    scoreboard objectives add dimension_traveled_on_current_disc dummy
#end flux
scoreboard objectives add left_game minecraft.custom:leave_game

#oh mein gott eine Katze
team add catgirl
scoreboard objectives add dash trigger
scoreboard objectives add dashRay dummy


scoreboard objectives add originSelect trigger
scoreboard objectives add justJoined minecraft.custom:minecraft.play_time
scoreboard objectives add damage minecraft.custom:minecraft.damage_taken
#i believe this currently does nothing?
scoreboard objectives add prog dummy
#affects #dimensionaccess if = 0 players get tpd to the overworld when traveling dimensions if = 1 players get tpd to the overworld when traveling to the end if = 2.. behaves as vanilla 
scoreboard objectives add dimension_access dummy
scoreboard objectives add adminFag trigger


scoreboard objectives add death deathCount


scoreboard objectives add degg trigger
scoreboard objectives add DragonEgg trigger

scoreboard objectives add pvp trigger
scoreboard objectives add pvplist trigger

scoreboard objectives add vanillaMusicDisable trigger

scoreboard objectives add degg trigger
scoreboard objectives add DragonEgg trigger

scoreboard objectives add pvp trigger
scoreboard objectives add pvplist trigger

scoreboard objectives add vanillaMusicDisable trigger

#execute as @r at @s run function origin:test with entity @s SelectedItem
say I LOVE FAGGOTS n tranniesa
