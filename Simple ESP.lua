local modname="Simple ESP"
local configfile=modname..".json"
print("["..modname.."]".." Started.")


--Made by JumpmanSr
--Version 2.0.0
--https://github.com/JumpmanSr/Simple-ESP-Dragons-Dogma-2


--TON OF CREDITS TO THE ORIGINAL AUTHOR OF "NAME ON HEAD" He inspired this and 
--I was able to use and learn from a lot of his code, so without him none of this would
--even be possible, please make sure you check out his github!!
-- XYZAPI DEV - https://github.com/xyzkljl1/MyDD2Mod

--settings
local _config={
	{name="Simple ESP Options",type="mutualbox"},
    {name="FriendShow",type="bool",default=true,label="Show Friendly ESP"},
    --{name="",type="sameline"},
    {name="EnemyShow",type="bool",default=true,label="Show Enemy ESP"},
 
    {name="ChestShow",type="bool",default=true,label="Show Chest ESP"},
	
    {name="ShowAllInteractables",type="bool",default=false,label="Show EVERY player interactable"},
	
    {name="font",type="font",default="simsun.ttc"},
    {name="fontsize",type="fontsize",default=20},
    {name="fcolor",type="rgba32",default=0xff00EE00},
	{name="ecolor",type="rgba32",default=0xff0000EE},
	{name="tcolor",type="rgba32",default=0xffFFE800},
	{name="acolor",type="rgba32",default=0xffFFFFFF},
    {name="offsetX",type="int",default=0,min=-300,max=5000},
    {name="offsetY",type="int",default=0,min=-300,max=5000},
    {name="offsetZ",type="int",default=0,min=-300,max=5000},
    {name="keyboardKey",type="hotkey",default="Alpha1",actionName="keyboardKey2728"},
    {name="controllerKeyShoulder",type="hotkey",default="RT (R2)",actionName="controllerKeyShoulder2728"},
    {name="controllerKeyNotShoulder",type="hotkey",default="LLeft",actionName="controllerKeyNotShoulder2728"},
	
	
}
local myapi = require("_XYZApi/_XYZApi")
local hk = require("Hotkeys/Hotkeys")
local config=myapi.InitFromFile(_config,configfile)

local enemname = {
  ch220000 = {
    id = 4075430906,
    name = "Goblin"
  },
  ch220000_00 = {
    id = 3831138060,
    name = "Goblin"
  },
  ch220000_01 = {
    id = 681487416,
    name = "Goblin"
  },
  ch220000_02 = {
    id = 505830464,
    name = "Goblin"
  },
  ch220000_03 = {
    id = 3354236422,
    name = "Goblin"
  },
  ch220000_04 = {
    id = 3926755095,
    name = "Goblin"
  },
  ch220000_10 = {
    id = 2673306579,
    name = "Goblin"
  },
  ch220000_11 = {
    id = 4050526927,
    name = "Goblin"
  },
  ch220000_12 = {
    id = 498711577,
    name = "Goblin"
  },
  ch220000_13 = {
    id = 3340998717,
    name = "Goblin"
  },
  ch220000_14 = {
    id = 886594300,
    name = "Goblin"
  },
  ch220000_90 = {
    id = 979398568,
    name = "Goblin"
  },
  ch220000_91 = {
    id = 3738879281,
    name = "Goblin"
  },
  ch220001 = {
    id = 824292082,
    name = "Hobgoblin"
  },
  ch220001_00 = {
    id = 3023839524,
    name = "Hobgoblin"
  },
  ch220001_01 = {
    id = 820168355,
    name = "Hobgoblin"
  },
  ch220001_02 = {
    id = 3671779649,
    name = "Hobgoblin"
  },
  ch220001_03 = {
    id = 714445199,
    name = "Hobgoblin"
  },
  ch220001_10 = {
    id = 1119391072,
    name = "Hobgoblin"
  },
  ch220001_11 = {
    id = 3959282474,
    name = "Hobgoblin"
  },
  ch220001_12 = {
    id = 1072978625,
    name = "Hobgoblin"
  },
  ch220001_13 = {
    id = 265987869,
    name = "Hobgoblin"
  },
  ch220001_20 = {
    id = 2108697931,
    name = "Hobgoblin"
  },
  ch220001_21 = {
    id = 3746646715,
    name = "Hobgoblin"
  },
  ch220001_22 = {
    id = 2402686166,
    name = "Hobgoblin"
  },
  ch220001_23 = {
    id = 1433009442,
    name = "Hobgoblin"
  },
  ch220002 = {
    id = 1659799223,
    name = "Chopper"
  },
  ch220002_00 = {
    id = 617454969,
    name = "Chopper"
  },
  ch220002_01 = {
    id = 3236912930,
    name = "Chopper"
  },
  ch220002_02 = {
    id = 207240957,
    name = "Chopper"
  },
  ch220002_03 = {
    id = 86583291,
    name = "Chopper"
  },
  ch220003 = {
    id = 3901007162,
    name = "Knacker"
  },
  ch220003_00 = {
    id = 2774043831,
    name = "Knacker"
  },
  ch220003_01 = {
    id = 3404862741,
    name = "Knacker"
  },
  ch220003_02 = {
    id = 1873000869,
    name = "Knacker"
  },
  ch220003_03 = {
    id = 2246101787,
    name = "Knacker"
  },
  ch221000 = {
    id = 984436780,
    name = "Saurian"
  },
  ch221000_00 = {
    id = 1563777152,
    name = "Saurian"
  },
  ch221001 = {
    id = 3739136302,
    name = "Asp"
  },
  ch221001_00 = {
    id = 2286111823,
    name = "Asp"
  },
  ch221002 = {
    id = 3773499102,
    name = "Rattler"
  },
  ch221002_00 = {
    id = 260695884,
    name = "Rattler"
  },
  ch221002_20 = {
    id = 2605756573,
    name = "Rattler"
  },
  ch221003 = {
    id = 3737589358,
    name = "Magma Scale"
  },
  ch221003_00 = {
    id = 3777932813,
    name = "Magma Scale"
  },
  ch221004 = {
    id = 821632591,
    name = "Serpent"
  },
  ch221004_00 = {
    id = 597146809,
    name = "Serpent"
  },
  ch222000 = {
    id = 2034931361,
    name = "Harpy"
  },
  ch222000_00 = {
    id = 3700061936,
    name = "Harpy"
  },
  ch222001 = {
    id = 44571581,
    name = "Venin Harpy"
  },
  ch222001_00 = {
    id = 1086493832,
    name = "Venin Harpy"
  },
  ch222002 = {
    id = 352780568,
    name = "Gore Harpy"
  },
  ch222002_00 = {
    id = 1993240449,
    name = "Gore Harpy"
  },
  ch222003 = {
    id = 2537311039,
    name = "Succubus"
  },
  ch222003_00 = {
    id = 2025923066,
    name = "Succubus"
  },
  ch222003_20 = {
    id = 4279131294,
    name = "Succubus"
  },
  ch223000 = {
    id = 3074847708,
    name = "Wolf"
  },
  ch223000_00 = {
    id = 3503729693,
    name = "Wolf"
  },
  ch223001 = {
    id = 3826873172,
    name = "Redwolf"
  },
  ch223001_00 = {
    id = 4267949999,
    name = "Redwolf"
  },
  ch223001_01 = {
    id = 1432231968,
    name = "Redwolf"
  },
  ch223002 = {
    id = 463959734,
    name = "Blackdog"
  },
  ch223002_00 = {
    id = 1641985855,
    name = "Blackdog"
  },
  ch224000 = {
    id = 3727708212,
    name = "Slime"
  },
  ch224000_00 = {
    id = 579176354,
    name = "Slime"
  },
  ch224001 = {
    id = 1440405779,
    name = "Ooze"
  },
  ch224001_00 = {
    id = 453830893,
    name = "Ooze"
  },
  ch224002 = {
    id = 4095108099,
    name = "Sludge"
  },
  ch224002_00 = {
    id = 2686608683,
    name = "Sludge"
  },
  ch225000 = {
    id = 2548825760,
    name = "Phantom",
    is_undead = true
  },
  ch225000_00 = {
    id = 2446613150,
    name = "Phantom",
    is_undead = true
  },
  ch225001 = {
    id = 1670555315,
    name = "Phantasm",
    is_undead = true
  },
  ch225001_00 = {
    id = 4115095027,
    name = "Phantasm",
    is_undead = true
  },
  ch225002 = {
    id = 2286707282,
    name = "Specter",
    is_undead = true
  },
  ch225002_00 = {
    id = 804066478,
    name = "Specter",
    is_undead = true
  },
  ch226000 = {
    id = 172545239,
    name = "Skeleton",
    is_undead = true
  },
  ch226000_00 = {
    id = 3778529772,
    name = "Skeleton",
    is_undead = true
  },
  ch226000_01 = {
    id = 3499882976,
    name = "Skeleton",
    is_undead = true
  },
  ch226001 = {
    id = 2162458964,
    name = "Skeleton",
    is_undead = true
  },
  ch226001_01 = {
    id = 2034177105,
    name = "Skeleton",
    is_undead = true
  },
  ch226001_03 = {
    id = 1831724056,
    name = "Skeleton",
    is_undead = true
  },
  ch226001_05 = {
    id = 997659575,
    name = "Skeleton",
    is_undead = true
  },
  ch226001_06 = {
    id = 409454115,
    name = "Skeleton",
    is_undead = true
  },
  ch226002 = {
    id = 996797807,
    name = "Skeleton",
    is_undead = true
  },
  ch226002_01 = {
    id = 325028463,
    name = "Skeleton",
    is_undead = true
  },
  ch226002_03 = {
    id = 2774400895,
    name = "Skeleton",
    is_undead = true
  },
  ch226002_05 = {
    id = 3069007639,
    name = "Skeleton",
    is_undead = true
  },
  ch226002_06 = {
    id = 1862515730,
    name = "Skeleton",
    is_undead = true
  },
  ch226003 = {
    id = 2778171479,
    name = "Skeleton Lord",
    is_undead = true
  },
  ch226003_00 = {
    id = 422306432,
    name = "Skeleton Lord",
    is_undead = true
  },
  ch227000 = {
    id = 3402660597,
    name = "Lich",
    is_undead = true,
    is_boss = true
  },
  ch227000_00 = {
    id = 3566561083,
    name = "Lich",
    is_undead = true,
    is_boss = true
  },
  ch227001 = {
    id = 715429530,
    name = "Wight",
    is_undead = true,
    is_boss = true
  },
  ch227001_00 = {
    id = 186889532,
    name = "Wight",
    is_undead = true,
    is_boss = true
  },
  ch228000 = {
    id = 3664825389,
    name = "Undead",
    is_undead = true
  },
  ch228000_00 = {
    id = 2967309721,
    name = "Undead",
    is_undead = true
  },
  ch228000_01 = {
    id = 1089854000,
    name = "Undead",
    is_undead = true
  },
  ch228001 = {
    id = 52723289,
    name = "Undead"
  },
  ch228001_00 = {
    id = 2898068966,
    name = "Undead",
    is_undead = true
  },
  ch228001_01 = {
    id = 2515715031,
    name = "Undead",
    is_undead = true
  },
  ch228002 = {
    id = 1668345160,
    name = "Stout Undead",
    is_undead = true
  },
  ch228002_00 = {
    id = 237829752,
    name = "Stout Undead",
    is_undead = true
  },
  ch229000 = {
    id = 3871427245,
    name = "Dullahan",
    is_undead = true,
    is_boss = true
  },
  ch229000_00 = {
    id = 2629601821,
    name = "Dullahan",
    is_undead = true,
    is_boss = true
  },
  ch230000 = {
    id = 3118161942,
    name = "Rogue"
  },
  ch230000_01 = {
    id = 1678146412,
    name = "Rogue"
  },
  ch230000_02 = {
    id = 1999194350,
    name = "Rogue"
  },
  ch230000_03 = {
    id = 33337065,
    name = "Rogue"
  },
  ch230000_04 = {
    id = 2405515181,
    name = "Rogue"
  },
  ch230001 = {
    id = 3139077209,
    name = "Lost Mercenary"
  },
  ch230001_01 = {
    id = 3794841598,
    name = "Lost Mercenary"
  },
  ch230001_02 = {
    id = 328189375,
    name = "Lost Mercenary"
  },
  ch230001_03 = {
    id = 3129435526,
    name = "Lost Mercenary"
  },
  ch230001_04 = {
    id = 1434846056,
    name = "Lost Mercenary"
  },
  ch230001_05 = {
    id = 2738350696,
    name = "Lost Mercenary"
  },
  ch230001_06 = {
    id = 2368799945,
    name = "Lost Mercenary"
  },
  ch230002 = {
    id = 3353892892,
    name = "Lost Mercenary"
  },
  ch230002_01 = {
    id = 3740205120,
    name = "Lost Mercenary"
  },
  ch230002_02 = {
    id = 179954184,
    name = "Lost Mercenary"
  },
  ch230002_03 = {
    id = 3930224407,
    name = "Lost Mercenary"
  },
  ch230002_04 = {
    id = 4058460161,
    name = "Lost Mercenary"
  },
  ch230002_05 = {
    id = 1729485145,
    name = "Lost Mercenary"
  },
  ch230002_06 = {
    id = 2698864386,
    name = "Lost Mercenary"
  },
  ch230012 = {
    id = 2636845582,
    name = "Coral Snake"
  },
  ch230012_02 = {
    id = 144325129,
    name = "Coral Snake"
  },
  ch230012_04 = {
    id = 1588377750,
    name = "Coral Snake"
  },
  ch230100 = {
    id = 1046800430,
    name = "Scavenger"
  },
  ch230100_04 = {
    id = 368370889,
    name = "Scavenger"
  },
  ch240000 = {
    id = 2326588354,
    name = "Battahl Purgener",
    is_boss = true
  },
  ch240000_00 = {
    id = 894557148,
    name = "Battahl Purgener",
    is_boss = true
  },
  ch250000 = {
    id = 4200835371,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_00 = {
    id = 797468852,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_01 = {
    id = 2314122076,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_02 = {
    id = 2691537244,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_10 = {
    id = 597201144,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_11 = {
    id = 2487358235,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_12 = {
    id = 2142776531,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_20 = {
    id = 3906583030,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_21 = {
    id = 377282979,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_22 = {
    id = 884021677,
    name = "Cyclops",
    is_boss = true
  },
  ch250000_90 = {
    id = 835332328,
    name = "Cyclops",
    is_boss = true
  },
  ch251000 = {
    id = 2421448835,
    name = "Ogre",
    is_boss = true
  },
  ch251000_00 = {
    id = 2138374751,
    name = "Ogre",
    is_boss = true
  },
  ch251001 = {
    id = 2094960111,
    name = "Grim Ogre",
    is_boss = true
  },
  ch251001_00 = {
    id = 786298456,
    name = "Grim Ogre",
    is_boss = true
  },
  ch252000 = {
    id = 2727149558,
    name = "Golem",
    is_boss = true
  },
  ch252000_00 = {
    id = 2288155078,
    name = "Golem",
    is_boss = true
  },
  ch252000_01 = {
    id = 1156291195,
    name = "Golem",
    is_boss = true
  },
  ch252000_02 = {
    id = 2224608577,
    name = "Golem",
    is_boss = true
  },
  ch252000_03 = {
    id = 812385671,
    name = "Golem",
    is_boss = true
  },
  ch253000 = {
    id = 3136630913,
    name = "Griffin",
    is_boss = true
  },
  ch253000_00 = {
    id = 3547788120,
    name = "Griffin",
    is_boss = true
  },
  ch253001 = {
    id = 1436780457,
    name = "Sphinx",
    is_boss = true
  },
  ch253001_00 = {
    id = 3369196004,
    name = "Sphinx",
    is_boss = true
  },
  ch253010 = {
    id = 3796773925,
    name = "Vermund Purgener",
    is_boss = true
  },
  ch253010_00 = {
    id = 4243003424,
    name = "Vermund Purgener",
    is_boss = true
  },
  ch253011 = {
    id = 2719193164,
    name = "Island Encampment Purgener",
    is_boss = true
  },
  ch253011_00 = {
    id = 355142415,
    name = "Island Encampment Purgener",
    is_boss = true
  },
  ch254000 = {
    id = 920145308,
    name = "Chimera",
    is_boss = true
  },
  ch254000_00 = {
    id = 3550884773,
    name = "Chimera",
    is_boss = true
  },
  ch254001 = {
    id = 3926958653,
    name = "Gorechimera",
    is_boss = true
  },
  ch254001_00 = {
    id = 3236853785,
    name = "Gorechimera",
    is_boss = true
  },
  ch254100 = {
    id = 688186494,
    name = "Chimera",
    is_boss = true
  },
  ch254100_00 = {
    id = 1700400553,
    name = "Chimera",
    is_boss = true
  },
  ch254101 = {
    id = 525456013,
    name = "Gorechimera",
    is_boss = true
  },
  ch254101_00 = {
    id = 2114484143,
    name = "Gorechimera",
    is_boss = true
  },
  ch254200 = {
    id = 819242198,
    name = "Chimera",
    is_boss = true
  },
  ch254200_00 = {
    id = 165035972,
    name = "Chimera",
    is_boss = true
  },
  ch254201 = {
    id = 424837784,
    name = "Gorechimera",
    is_boss = true
  },
  ch254201_00 = {
    id = 2997168797,
    name = "Gorechimera",
    is_boss = true
  },
  ch255000 = {
    id = 1523627639,
    name = "Medusa",
    is_boss = true
  },
  ch255000_00 = {
    id = 3307750390,
    name = "Medusa",
    is_boss = true
  },
  ch255000_01 = {
    id = 4170025353,
    name = "Medusa",
    is_boss = true
  },
  ch255000_90 = {
    id = 114855116,
    name = "Medusa",
    is_boss = true
  },
  ch255010 = {
    id = 2757629441,
    name = "Sacred Arbor Purgener",
    is_boss = true
  },
  ch255010_00 = {
    id = 2475491578,
    name = "Sacred Arbor Purgener",
    is_boss = true
  },
  ch255011 = {
    id = 3585982719,
    name = "Volcanic Island Purgener",
    is_boss = true
  },
  ch255011_00 = {
    id = 3417537573,
    name = "Volcanic Island Purgener",
    is_boss = true
  },
  ch256000 = {
    id = 777260744,
    name = "Minotaur",
    is_boss = true
  },
  ch256000_00 = {
    id = 3061246416,
    name = "Minotaur",
    is_boss = true
  },
  ch256001 = {
    id = 1488712196,
    name = "Goreminotaur",
    is_boss = true
  },
  ch256001_00 = {
    id = 1057828479,
    name = "Goreminotaur",
    is_boss = true
  },
  ch257000 = {
    id = 2617990880,
    name = "Drake",
    is_boss = true
  },
  ch257000_00 = {
    id = 2133916449,
    name = "Drake",
    is_boss = true
  },
  ch257001 = {
    id = 3009322132,
    name = "Lesser Dragon",
    is_boss = true
  },
  ch257001_00 = {
    id = 3538966457,
    name = "Lesser Dragon",
    is_boss = true
  },
  ch258000 = {
    id = 2218318624,
    name = "Dragon",
    is_boss = true
  },
  ch258000_00 = {
    id = 2631267673,
    name = "Dragon",
    is_boss = true
  },
  ch258000_10 = {
    id = 1032736632,
    name = "Dragon",
    is_boss = true
  },
  ch258000_20 = {
    id = 1359728607,
    name = "Dragon",
    is_boss = true
  },
  ch258000_30 = {
    id = 1403005379,
    name = "Dragon",
    is_boss = true
  },
  ch258001 = {
    id = 1472891121,
    name = "Nex",
    is_boss = true
  },
  ch258001_00 = {
    id = 2099579791,
    name = "Nex",
    is_boss = true
  },
  ch259000 = {
    id = 2556420731,
    name = "Talos",
    is_boss = true
  },
  ch259000_00 = {
    id = 3285740536,
    name = "Talos",
    is_boss = true
  },
  ch259000_90 = {
    id = 1992394587,
    name = "Talos",
    is_boss = true
  },
  ch259000_91 = {
    id = 2741660177,
    name = "Talos",
    is_boss = true
  },
  ch260000 = {
    id = 3305878809,
    name = "Garm"
  },
  ch260000_00 = {
    id = 169713426,
    name = "Garm"
  },
  ch260001 = {
    id = 263786390,
    name = "Warg"
  },
  ch260001_00 = {
    id = 247902159,
    name = "Warg"
  },
  ch299003 = {
    id = 2755368963,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_00 = {
    id = 4073166252,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_10 = {
    id = 3285466677,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_11 = {
    id = 1830828078,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_12 = {
    id = 1638238999,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_13 = {
    id = 1094611796,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_14 = {
    id = 1016329036,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_15 = {
    id = 369023852,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_20 = {
    id = 677531604,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_21 = {
    id = 1209676654,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_22 = {
    id = 1944501456,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_30 = {
    id = 1065282196,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_31 = {
    id = 3896343726,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_32 = {
    id = 4173192605,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_40 = {
    id = 958755609,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_50 = {
    id = 614907740,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_51 = {
    id = 1931977881,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_52 = {
    id = 3404649426,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_60 = {
    id = 4049672477,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_61 = {
    id = 1407209575,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_62 = {
    id = 3832243964,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_90 = {
    id = 2189330139,
    name = "Ox",
    is_animal = true
  },
  ch299003_A_91 = {
    id = 1175099639,
    name = "Ox",
    is_animal = true
  },
  ch299003_B_00 = {
    id = 3790237688,
    name = "Ox",
    is_animal = true
  },
  ch299010 = {
    id = 2448464762,
    name = "Stag",
    is_animal = true
  },
  ch299010_A_00 = {
    id = 879783835,
    name = "Stag",
    is_animal = true
  },
  ch299011 = {
    id = 857350139,
    name = "Doe",
    is_animal = true
  },
  ch299011_A_00 = {
    id = 692713558,
    name = "Doe",
    is_animal = true
  },
  ch299020 = {
    id = 1005028787,
    name = "Goat",
    is_animal = true
  },
  ch299020_A_00 = {
    id = 1656656733,
    name = "Goat",
    is_animal = true
  },
  ch299020_B_00 = {
    id = 660614732,
    name = "Goat",
    is_animal = true
  },
  ch299030 = {
    id = 3543801350,
    name = "Pig",
    is_animal = true
  },
  ch299030_A_00 = {
    id = 3414342046,
    name = "Pig",
    is_animal = true
  },
  ch299031 = {
    id = 856977504,
    name = "Wild Boar",
    is_animal = true
  },
  ch299031_A_00 = {
    id = 929681477,
    name = "Wild Boar",
    is_animal = true
  },
  ch299031_B_00 = {
    id = 1101403807,
    name = "Wild Boar",
    is_animal = true
  },
  ch299200 = {
    id = 1825882043,
    name = "Rabbit",
    is_animal = true
  },
  ch299200_A_00 = {
    id = 3794158447,
    name = "Rabbit",
    is_animal = true
  },
  ch299200_B_00 = {
    id = 4037765830,
    name = "Rabbit",
    is_animal = true
  },
  ch299210 = {
    id = 4246695049,
    name = "Rat",
    is_animal = true
  },
  ch299210_A_00 = {
    id = 3671762608,
    name = "Rat",
    is_animal = true
  },
  ch299220 = {
    id = 4080486209,
    name = "Rooster",
    is_animal = true
  },
  ch299220_A_00 = {
    id = 261171242,
    name = "Rooster",
    is_animal = true
  },
  ch299221 = {
    id = 2452937962,
    name = "Chicken",
    is_animal = true
  },
  ch299221_A_00 = {
    id = 368362284,
    name = "Chicken",
    is_animal = true
  },
  ch299230 = {
    id = 3699103987,
    name = "Leapworm",
    is_animal = true
  },
  ch299230_A_00 = {
    id = 3025108868,
    name = "Leapworm",
    is_animal = true
  },
  ch299240 = {
    id = 2408295807,
    name = "Spider",
    is_animal = true
  },
  ch299240_A_00 = {
    id = 1639472460,
    name = "Spider",
    is_animal = true
  },
  ch299400 = {
    id = 3336645871,
    name = "Bat",
    is_animal = true
  },
  ch299400_A_00 = {
    id = 3479796288,
    name = "Bat",
    is_animal = true
  },
  ch299410 = {
    id = 3831640274,
    name = "Crow",
    is_animal = true
  },
  ch299410_A_00 = {
    id = 597330038,
    name = "Crow",
    is_animal = true
  },
  ch299420 = {
    id = 561151372,
    name = "Seabird",
    is_animal = true
  },
  ch299420_A_00 = {
    id = 1054074961,
    name = "Seabird",
    is_animal = true
  },
  ch299430 = {
    id = 2489368601,
    name = "Bird",
    is_animal = true
  },
  ch299430_A_00 = {
    id = 1454396558,
    name = "Bird",
    is_animal = true
  },
  ch299600 = {
    id = 3331845572,
    name = "Fish",
    is_animal = true
  },
  ch299600_A_00 = {
    id = 310693883,
    name = "Fish",
    is_animal = true
  },
  ch299610 = {
    id = 482197764,
    name = "Butterfly",
    is_animal = true
  },
  ch299610_A_00 = {
    id = 2978377446,
    name = "Butterfly",
    is_animal = true
  },
  ch299620 = {
    id = 1474873777,
    name = "Grasshopper",
    is_animal = true
  },
  ch299620_A_00 = {
    id = 282151500,
    name = "Grasshopper",
    is_animal = true
  }
}

--thanks to lingsamuel
local CJK_GLYPH_RANGES = {
    0x0020, 0x00FF, -- Basic Latin + Latin Supplement
    0x0400, 0x04FF, -- Cyrillic
    0x2000, 0x206F, -- General Punctuation
    0x3000, 0x30FF, -- CJK Symbols and Punctuations, Hiragana, Katakana
    0x31F0, 0x31FF, -- Katakana Phonetic Extensions
    0xFF00, 0xFFEF, -- Half-width characters
    0x4e00, 0x9FAF, -- CJK Ideograms
    0,
}
--必须有CJK_GLYPH_RANGES才能支持中文字符
--字号过大就会崩溃，不同字体支持字号不一样，中文字体支持的字号比较小？
--simsun:约30，times:至少250 MS明朝：60
local font = imgui.load_font( config.font, config.fontsize,CJK_GLYPH_RANGES)

local on=false

local function Log(...)
    print(...)
    --log.info(...)
end


re.on_frame(function()
	---Hotkeys for Controller and Keyboard---
    if hk.check_hotkey("keyboardKey2728",false,true) or ((hk.check_hotkey("controllerKeyShoulder2728",  true,false) and hk.check_hotkey("controllerKeyNotShoulder2728",  false,true))) then
        on=not on
    end
    if on then
		---Entity Holders---
        local player_listh = sdk.get_managed_singleton("app.CharacterListHolder")
        local npcm = sdk.get_managed_singleton("app.NPCManager")
		local enemyman = sdk.get_managed_singleton("app.EnemyManager")
		local gimmickman = sdk.get_managed_singleton("app.GimmickManager")
		
		--Setup--
        local chars = player_listh:getAllCharacters()
        local ct = chars:get_Count()
		local enemies = enemyman:getAllEnemies()
		local et = enemies:get_Count()
		local allinteractables = gimmickman:get_ManagedGimmicks()
		local ait = allinteractables:get_Count()
		local treasureboxes = gimmickman:get_TreasureBoxGimmicks()
		local tc = treasureboxes:get_Count()
		
		--Future?--
		
		--local testmonstermanager=sdk.get_managed_singleton("app.MonsterManager")
        --Log(tostring(ct))
        imgui.push_font(font)
		
		----- ENEMY ESP REGION -----
		if config.EnemyShow == true then
			for i=0,et-1 do
				local enem=enemies:get_Item(i)
				--Log(tostring(enem))
				--Log(tostring(enem:get_DistanceSqFromPlayer()))
				local d=enem:get_Chara()
				--local e=enem:get_Monster() -- Maybe Used Later or Related to Wild Life 
				--Log(tostring(d))
				if enem ~=nil and d~= nil then
					local joint=enem:get_Transform()--get_GameObject():get_Transform()--:getJointByName("Head_0")
					local pos=joint:get_Position() --Not using Head as some enemys don't have one and it's slow as this is PER FRAME
					local flatpos=draw.world_to_screen(pos)
					local dist=d:get_DistanceSqFromPlayer()
					if flatpos ~= nil then --and dist ~= nil then
						local width = 100 * (dist  / 100);
						if width > 125 then
							width = 125
						end
						local height = 100 * (dist / 100);
						if height > 125 then
							height = 125
						end
						draw.outline_rect(flatpos.x - (width/2), flatpos.y - height, width, height, config.ecolor)
						local text = enemname[d:get_CharaIDString()].name .. "\nHP: " .. d:get_Hp() .. "/" .. d:get_OriginalMaxHp() .. "\nDistance:" .. dist
						if text == nil or text == "nil" then
							text = "Enemy - Unknown"
						end
						draw.text(text, flatpos.x - (width/2), flatpos.y - height - 60, config.ecolor)
						--Hard coded height - 60 will need to be adjusted, could do fontsize * 3 (line count maybe)
					end		
				end
			end
		end
		
		----- FRIENDLY ESP REGION -----
		if config.FriendShow == true then
			for i=0,ct-1 do
				
				local char=chars:get_Item(i)
				--Log(tostring(char:get_DistanceSqFromPlayer()))
				local d=npcm:getNPCData(char:get_CharaID())
				if d ~=nil then
					local joint=char:get_Transform()--get_GameObject():get_Transform()--:getJointByName("Head_0")
					local pos=joint:get_Position() -- You can use the above it you want, I found the Joint took longer as it's per frame
					
					local flatpos=draw.world_to_screen(pos)
					local dist=char:get_DistanceSqFromPlayer()
					if flatpos ~= nil and dist ~= nil then
						local width = 100 * (dist  / 100);
						if width > 125 then
							width = 125
						end
						local height = 100 * (dist / 100);
						if height > 125 then
							height = 125
						end
						draw.outline_rect(flatpos.x - (width/2), flatpos.y - height, width, height, config.fcolor)
						local text=d:get_Name()
						if text == "???" then
							text = "Pawn"
						end
						draw.text(text, flatpos.x - (width/2), flatpos.y - height - 20, config.fcolor)
					end
				end
			end
		end
		
		----- CHEST ESP REGION -----
		if config.ChestShow == true then
			for i=0,tc-1 do
				
				local chestItem = treasureboxes:get_Item(i) -- app.gm80_001 / GimmickBase (For All Items)
				--Log(tostring(chestItem))
				if chestItem ~=nil then
					--local chestItem = chestItem:get_Transform()
					local pos = chestItem:get_Trans():get_Position() -- Renamed transform for some reason but sure
					local flatpos = draw.world_to_screen(pos)
					local dist = chestItem:get_DistanceXZSqFromPlayer()
					if flatpos ~= nil and dist ~= nil then
						local width = 100 * (dist  / 100);
						if width > 125 then
							width = 125
						end
						local height = 100 * (dist / 100);
						if height > 125 then
							height = 125
						end
						draw.outline_rect(flatpos.x - (width/2), flatpos.y - height, width, height, config.tcolor)
						local text = "Chest\nDistance: " .. dist 
						draw.text(text, flatpos.x - (width/2), flatpos.y - height - 40, config.tcolor)
					end
				end
			end
		end
		
		----- ALL INTERACTABLE ESP REGION -----
		if config.ShowAllInteractables == true then
			for i=0,ait-1 do
				
				local anyItem = allinteractables:get_Item(i) -- app.gm80_001 / GimmickBase (For All Items)
				--Log(tostring(anyItem))
				if anyItem ~=nil then
					--local anyItem = anyItem:get_Transform()
					local pos = anyItem:get_Trans():get_Position() -- Renamed transform for some reason but sure
					local flatpos = draw.world_to_screen(pos)
					local dist = anyItem:get_DistanceXZSqFromPlayer()
					if flatpos ~= nil and dist ~= nil then
						local width = 100 * (dist  / 100);
						if width > 125 then
							width = 125
						end
						local height = 100 * (dist / 100);
						if height > 125 then
							height = 125
						end
						draw.outline_rect(flatpos.x - (width/2), flatpos.y - height, width, height, config.acolor)
						local text = "Interactable\nDistance: " .. dist 
						draw.text(text, flatpos.x - (width/2), flatpos.y - height - 40, config.acolor)
					end
				end
			end
		end
		
        imgui.pop_font()
		
    end
end)

myapi.DrawIt(modname,configfile,_config,config,nil,true)
