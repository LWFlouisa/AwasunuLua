function encrire(input)
  current_output = input
end

-- Generate biome types
function gcrumb(n1, n2, n3, d1, d2, d3, t1, t2, t3, bn1, bn2, bn3)
  biome_blocks = {
    {{n1, n1, n1},
     {n1, n1, n2},
     {n1, n1, n3}},

    {{n2, n2, n1},
     {n2, n2, n2},
     {n2, n2, n3}},

    {{n3, n3, n1},
     {n3, n3, n2},
     {n3, n3, n3}},
  }

  biome_descriptions = {
    {{d1, d1, d1},
     {d1, d1, d2},
     {d1, d1, d3}},

    {{d2, d2, d1},
     {d2, d2, d2},
     {d2, d2, d3}},

    {{d3, d3, d1},
     {d3, d3, d2},
     {d3, d3, d3}},
  }

  biome_tiles = {
    {{t1, t1, t1},
     {t1, t1, t2},
     {t1, t1, t3}},

    {{t2, t2, t1},
     {t2, t2, t2},
     {t2, t2, t3}},

    {{t3, t3, t1},
     {t3, t3, t2},
     {t3, t3, t3}},
  }

  biome_names = {
    {{bn1, bn1, bn1},
     {bn1, bn1, bn2},
     {bn1, bn1, bn3}},

    {{bn2, nb2, bn1},
     {bn2, bn2, bn2},
     {bn2, bn2, bn3}},

    {{bn3, bn3, bn1},
     {bn3, bn3, bn2},
     {bn3, bn3, bn3}},
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

  -- Chooses a biome name
  biome_name        = biome_names[cur_row][cur_col][cur_arr]

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
    name = biome_name,
    node_top = current_node,
    depth_top = 1,
    node_filler = current_node,
    depth_filler = 1,
    node_riverbed = current_node,
    depth_riverbed = 2,
    node_dungeon = "default:cobble",
    node_dungeon_alt = "default:mossycobble",
    node_dungeon_stair = "stairs:stair_cobble",
    y_max = 31000,
    y_min = 4,
    heat_point = 38,
    humidity_point = 0,
  })
end

function gsand(n1, n2, n3, d1, d2, d3, t1, t2, t3, bn1, bn2, bn3)
  biome_blocks = {
    {{n1, n1, n1},
     {n1, n1, n2},
     {n1, n1, n3}},

    {{n2, n2, n1},
     {n2, n2, n2},
     {n2, n2, n3}},

    {{n3, n3, n1},
     {n3, n3, n2},
     {n3, n3, n3}},
  }

  biome_descriptions = {
    {{d1, d1, d1},
     {d1, d1, d2},
     {d1, d1, d3}},

    {{d2, d2, d1},
     {d2, d2, d2},
     {d2, d2, d3}},

    {{d3, d3, d1},
     {d3, d3, d2},
     {d3, d3, d3}},
  }

  biome_tiles = {
    {{t1, t1, t1},
     {t1, t1, t2},
     {t1, t1, t3}},

    {{t2, t2, t1},
     {t2, t2, t2},
     {t2, t2, t3}},

    {{t3, t3, t1},
     {t3, t3, t2},
     {t3, t3, t3}},
  }

  biome_names = {
    {{bn1, bn1, bn1},
     {bn1, bn1, bn2},
     {bn1, bn1, bn3}},

    {{bn2, nb2, bn1},
     {bn2, bn2, bn2},
     {bn2, bn2, bn3}},

    {{bn3, bn3, bn1},
     {bn3, bn3, bn2},
     {bn3, bn3, bn3}},
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

  -- Chooses a biome name
  biome_name        = biome_names[cur_row][cur_col][cur_arr]

  minetest.register_node(current_node, {
    description = current_description,
    tiles = {current_tile, current_tile, current_tile},
    groups = {oddly_breakable_by_hand = 2},

    paramtype2 = "facedir",
    is_ground_content = true,
    groups = {crumbly = 1, sand = 3},
    sounds = default.node_sound_sand_defaults(),

    on_place = minetest.rotate_node
  })

  minetest.register_biome({
    name = biome_name,
    node_top = current_node,
    depth_top = 1,
    node_filler = current_node,
    depth_filler = 1,
    node_riverbed = current_node,
    depth_riverbed = 2,
    node_dungeon = "default:cobble",
    node_dungeon_alt = "default:mossycobble",
    node_dungeon_stair = "stairs:stair_cobble",
    y_max = 31000,
    y_min = 4,
    heat_point = 38,
    humidity_point = 0,
  })
end

-- Generate Crafting types
function nsl_create_craft(new_name, node1_1, node1_2, node1_3,
                                    node2_1, node2_2, node2_3,
                                    node3_1, node3_2, node3_3)

  first_node = {
    {{node1_1, node1_1, node1_1},
     {node1_1, node1_1, node1_2},
     {node1_1, node1_1, node1_3}},

    {{node1_2, node1_2, node1_1},
     {node1_2, node1_2, node1_2},
     {node1_2, node1_2, node1_3}},

    {{node1_3, node1_3, node1_1},
     {node1_3, node1_3, node1_2},
     {node1_3, node1_3, node1_3}},
  }

  second_node = {
    {{node2_1, node2_1, node2_1},
     {node2_1, node2_1, node2_2},
     {node2_1, node2_1, node2_3}},

    {{node2_2, node2_2, node2_1},
     {node2_2, node2_2, node2_2},
     {node2_2, node2_2, node2_3}},

    {{node2_3, node2_3, node2_1},
     {node2_3, node2_3, node2_2},
     {node2_3, node2_3, node2_3}},
  }

  third_node = {
    {{node1_1, node1_1, node1_1},
     {node1_1, node1_1, node1_2},
     {node1_1, node1_1, node1_3}},

    {{node1_2, node1_2, node1_1},
     {node1_2, node1_2, node1_2},
     {node1_2, node1_2, node1_3}},

    {{node1_3, node1_3, node1_1},
     {node1_3, node1_3, node1_2},
     {node1_3, node1_3, node1_3}},
  }

  row_options = 3
  col_options = 3
  arr_options = 3

  cur_row = math.random(row_options)
  cur_col = math.random(col_options)
  cur_arr = math.random(arr_options)

  node1 = first_node[cur_row][cur_col][cur_arr]
  node2 = second_node[cur_row][cur_col][cur_arr]
  node3 = third_node[cur_row][cur_col][cur_arr]

  minetest.register_craft({
    output = new_name,
    recipe = {
      {node1, node2, node1},
      {node2, node3, node2},
      {node1, node2, node1},
    },
  })
end
