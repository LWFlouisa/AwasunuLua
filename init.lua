dofile(modpath, "awasunu.lua")

-------------------------------------------------------------------------------------------------------
--                                        Alien Environments                                         --
-------------------------------------------------------------------------------------------------------
biome_blocks = {
  {{"awasunulua:blacksand", "awasunulua:blacksand",       "awasunulua:blacksand"},
   {"awasunulua:blacksand", "awasunulua:blacksand", "awasunulua:oiled_glass_top"},
   {"awasunulua:blacksand", "awasunulua:blacksand",        "awasunulua:oddblock"}},
   
  {{"awasunulua:oiled_glass_top", "awasunulua:oiled_glass_top",       "awasunulua:blacksand"},
   {"awasunulua:oiled_glass_top", "awasunulua:oiled_glass_top", "awasunulua:oiled_glass_top"},
   {"awasunulua:oiled_glass_top", "awasunulua:oiled_glass_top",        "awasunulua:oddblock"}},
   
  {{"awasunulua:oddblock", "awasunulua:oddblock",    "awasunulua:blacksand"},
   {"awasunulua:oddblock", "awasunulua:oddblock",  "awasunulua:fuckedblock"},
   {"awasunulua:oddblock", "awasunulua:oddblock",     "awasunulua:oddblock"}},
}

biome_descriptions = {
  {{"This is an odd block.", "This is an odd block.",    "This is an odd block."},
   {"This is an odd block.", "This is an odd block.", "This is an fucked block."},
   {"This is an odd block.", "This is an odd block.",  "This is an merde block."}},
   
  {{"This is an fucked block.", "This is an fucked block.",    "This is an odd block."},
   {"This is an fucked block.", "This is an fucked block.", "This is an fucked block."},
   {"This is an fucked block.", "This is an fucked block.",  "This is an merde block."}},
   
  {{"This is an fucked block.", "This is an fucked block.",    "This is an odd block."},
   {"This is an fucked block.", "This is an fucked block.", "This is an fucked block."},
   {"This is an fucked block.", "This is an fucked block.",  "This is an merde block."}},
}

biome_tiles = {
  {{"awasunulua:blacksand.png", "awasunulua:blacksand.png",       "awasunulua:blacksand.png"},
   {"awasunulua:blacksand.png", "awasunulua:blacksand.png", "awasunulua:oiled_glass_top.png"},
   {"awasunulua:blacksand.png", "awasunulua:blacksand.png",        "awasunulua:oddblock.png"}},
   
  {{"awasunulua:oiled_glass_top.png", "awasunulua:oiled_glass_top.png",       "awasunulua:blacksand.png"},
   {"awasunulua:oiled_glass_top.png", "awasunulua:oiled_glass_top.png", "awasunulua:oiled_glass_top.png"},
   {"awasunulua:oiled_glass_top.png", "awasunulua:oiled_glass_top.png",        "awasunulua:oddblock.png"}},
   
  {{"awasunulua:oddblock.png", "awasunulua:oddblock.png",    "awasunulua:blacksand.png"},
   {"awasunulua:oddblock.png", "awasunulua:oddblock.png",  "awasunulua:fuckedblock.png"},
   {"awasunulua:oddblock.png", "awasunulua:oddblock.png",     "awasunulua:oddblock.png"}},
}

row_options = 3
col_options = 3
arr_options = 3

cur_row = math.random(row_options)
cur_col = math.random(col_options)
cur_arr = math.random(arr_options)

current_node        = block_name[cur_row][cur_col][cur_arr]
current_description = block_description[cur_row][cur_col][cur_arr]
current_tile        = block_tiles[cur_row][cur_col][cur_arr]

minetest.register_node(current_node, {
  description = current_description,
  tiles = {current_tile, current_tile, current_tile},
  groups = {oddly_breakable_by_hand = 2},

  paramtype2 = "facedir",
  is_ground_content = true,
  groups = {crumbly = 3, sand = 1},
  sounds = default.node_sound_sand_defaults(),

  on_place = minetest.rotate_node
})

minetest.register_biome({
  name = "Void Desert",
  node_top = "awasunulua:newbiome",
  depth_top = 1,
  node_filler = "awasunulua:newbiome",
  depth_filler = 1,
  node_riverbed = "awasunulua:newbiome",
  depth_riverbed = 2,
  node_dungeon = "default:cobble",
  node_dungeon_alt = "default:mossycobble",
  node_dungeon_stair = "stairs:stair_cobble",
  y_max = 31000,
  y_min = 4,
  heat_point = 38,
  humidity_point = 0,
})

minetest.register_node("awasunulua:ethereal_tree", {
  description = "An ethereal tree log.",

  tiles = {"ethereal_tree.png", "ethereal_tree_top.png", "ethereal_tree_top.png"},
		
  paramtype2 = "facedir",
  is_ground_content = false,
  groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
  sounds = default.node_sound_wood_defaults(),

  on_place = minetest.rotate_node
	
})

-------------------------------------------------------------------------------------------------------
--                                     Sets Everything Into Motion                                   --
-------------------------------------------------------------------------------------------------------
minetest.register_craft({
  output = "default:permafrost",
  recipe = {
    {"default:dirt",  "default:ice",  "default:dirt"},
    {"default:ice",  "default:dirt", "default:ice"},
    {"default:dirt",  "default:ice",  "default:dirt"},
  },
})

minetest.register_craft({
  output = "default:permafrost_with_stones ",
  recipe = {
    {"default:stone",  "default:ice",  "default:stone"},
    {"default:ice",  "default:dirt", "default:ice"},
    {"default:dirt",  "default:ice",  "default:dirt"},
  },
})

-------------------------------------------------------------------------------------------------------
--                                          Slippery Rails                                           --
-------------------------------------------------------------------------------------------------------
slipper_degrees = {
  {{12, 12, 12},
   {12, 12, 27},
   {12, 12, 32}},
   
  {{27, 27, 12},
   {27, 27, 27},
   {27, 27, 32}},
   
  {{27, 27, 12},
   {27, 27, 27},
   {27, 27, 32}},
}

cur_row = math.random(3)
cur_col = math.random(3)
cur_arr = math.random(3)

current_slipperyness = slipper_degrees[cur_row][cur_col][cur_arr]

carts:register_rail("awasunulua:sliprail", {
	description = S("Slippery Rail. Caution: Not designed for human players."),
	tiles = {
		"slippery_rail_straight_brk.png", "slippery_rail_curved_brk.png",
		"slippery_rail_t_junction_brk.png", "slippery_rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 780})

-------------------------------------------------------------------------------------------------------
--                                            Experimental                                           --
-------------------------------------------------------------------------------------------------------
nsl_create_craft("awasunulua:stonesand", "default:stone", "default:wood", "default:sand",
                                         "default:stone", "default:wood", "default:sand",
                                         "default:stone", "default:wood", "default:sand")

nsl_create_craft("awasunulua:pinechest", "default:wood", "default:pine", "default:sand",
                                         "default:wood", "default:pine", "default:sand",
                                         "default:wood", "default:pine", "default:sand")
