#$say The player running this function is holding $(count) items with ID $(id) with $(components)!
#$summon item ~ ~ ~ {Item:{id:"$(id)", count:$(count), components:$(components)}}



#need to work out how to do resource pack music and replace this with that
playsound music_disc.creator record @s 15000 60 15000 10000000 1 1
playsound music_disc.creator record @s 15000 60 0 10000000 1 1
playsound music_disc.creator record @s 0 60 15000 10000000 1 1
playsound music_disc.creator record @s -15000 60 -15000 10000000 1 1
playsound music_disc.creator record @s -15000 60 0 10000000 1 1
playsound music_disc.creator record