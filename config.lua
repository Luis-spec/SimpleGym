Config = {}

Config.EnableBlip = true
Config.MapBlip = {
    Pos     	= {x = -1203.3242,y = -1570.6184,z = 4.6115},
    Sprite  	= 311, --icon
    Display	    = 4,
    Scale  	    = 1.0,
    Colour  	= 26,
    Name        = 'Beach Gym',
}

Config.Exersices = {
	{type = 'arm exercises', scenario = "world_human_muscle_free_weights", x = -1202.9837,y = -1565.1718,z = 4.6115},
	{type = 'pushups', scenario = "world_human_push_ups", x = -1203.3242,y = -1570.6184,z = 4.6115},
	{type = 'yoga', scenario = "world_human_yoga", x = -1204.7958,y = -1560.1906,z = 4.6115},
	{type = 'situps', scenario = "world_human_sit_ups", x = -1206.1055,y = -1565.1589,z = 4.6115},
	{type = 'chins', scenario = "prop_human_muscle_chin_ups", x = -1200.1284,y = -1570.9903,z = 4.6115, fixedChinPos = {x = -1199.84, y = -1571.40, z = 4.61, rot = 40.0}},
}

Config.ExersiceKey = 38 -- E
Config.ExersiceString = 'Press ~g~E ~s~to do some '
Config.AbortString = 'Press ~g~E ~s~to abort working out'
Config.ExersiceDuration = 30 -- in seconds
Config.FinishString = '~g~Exercise finished! ~s~Take a deep breath before continuing.'
