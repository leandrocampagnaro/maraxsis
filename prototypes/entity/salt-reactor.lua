local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
    {
      type = "fusion-generator",
      name = "maraxsis-salt-reactor",
      factoriopedia_description = {"factoriopedia-description.maraxsis-salt-reactor"},
      icon = "__maraxsis__/graphics/icons/salt-reactor.png",
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "maraxsis-salt-reactor"},
      max_health = 1000,
      impact_category = "metal",
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
  
      resistances = {
        {
          type = "fire",
          percent = 80
        }
      },
  
      collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
      selection_box = {{-3, -3}, {3, 3}},
      damaged_trigger_effect = hit_effects.entity(),
  
  
      working_sound = {
        sound = {
          filename = "__maraxsis__/sounds/salt-reactor.ogg",
          volume = 1,
          speed_smoothing_window_size = 60,
          advanced_volume_control = {attenuation = "exponential"},
          audible_distance_modifier = 1,
        },
        use_doppler_shift = false,
        match_speed_to_activity = true,
        activity_to_speed_modifiers = {multiplier = 1.2},
        match_volume_to_activity = true,
        max_sounds_per_prototype = 3,
        fade_in_ticks = 4,
        fade_out_ticks = 20
      },
  
      vehicle_impact_sound = sounds.generic_impact,
  
      max_fluid_usage = 10,
    }
  })
  

data:extend {{
    type = "fusion-generator",
    name = "maraxsis-salt-reactor",
    icon = "__maraxsis__/graphics/icons/salt-reactor.png",
    maraxsis_buildability_rules = {water = true, dome = true, coral = true, trench = true, trench_entrance = false, trench_lava = false},
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "maraxsis-salt-reactor"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    working_sound = {
        sound = {
            filename = "__maraxsis__/sounds/salt-reactor.ogg",
            volume = 1,
        },
        apparent_volume = 1.5,
        max_sounds_per_type = 3,
        audible_distance_modifier = 1,
        fade_in_ticks = 4,
        fade_out_ticks = 20
    },
    resistances = {
        {
            type = "fire",
            percent = 80
        }
    },
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3, -3}, {3, 3}},
    icon_draw_specification = {shift = {0, -0.5}, scale = 1.5},
    icons_positioning = {{
        inventory_index = defines.inventory.furnace_modules, shift = {0, 0.9}, max_icons_per_row = 3
    }},
    graphics_set = require ("__maraxsis__.prototypes.entity.salt-reactor-pictures").generator_graphics_set,
    --graphics_set = require ("__space-age__.prototypes.entity.fusion-system-pictures").generator_graphics_set,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      output_flow_limit = "12MW",
    },
    input_fluid_box =
    {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
            { flow_direction ="input", position = { -1.5, -2.5   }, direction = defines.direction.north },
            { flow_direction ="input", position = {  1.5, -2.5   }, direction = defines.direction.north },
            { flow_direction ="input", position = { -1.5, 2.5   }, direction = defines.direction.south },
            { flow_direction ="input", position = {  1.5, 2.5   }, direction = defines.direction.south },
        },
        secondary_draw_orders = {north = -1},
        volume = 1000,
        filter = "lava",
    },
    output_fluid_box =
    {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
            { flow_direction ="output", position = {  2.5,   -1.5 }, direction = defines.direction.east  },
            { flow_direction ="output", position = {  2.5,    1.5 }, direction = defines.direction.east  },
            { flow_direction ="output", position = { -2.5,    1.5 }, direction = defines.direction.west  },
            { flow_direction ="output", position = { -2.5,   -1.5 }, direction = defines.direction.west  },
        },
        volume = 1000,
        filter = "lava",
    },
    max_fluid_usage = 1000/second,
}}

data:extend {{
    type = "recipe-category",
    name = "maraxsis-salt-reactor"
}}

data:extend {{
    type = "recipe",
    name = "maraxsis-salt-reactor",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item",  name = "maraxsis-glass-panes",    amount = 100},
        {type = "item",  name = "tungsten-plate",          amount = 100},
        {type = "item",  name = "processing-unit",         amount = 100},
        {type = "fluid", name = "maraxsis-brackish-water", amount = 300},
    },
    results = {
        {type = "item", name = "maraxsis-salt-reactor", amount = 1},
    },
    category = "maraxsis-hydro-plant",
    surface_conditions = maraxsis.surface_conditions(),
}}

data:extend {{
    type = "item",
    name = "maraxsis-salt-reactor",
    icon = "__maraxsis__/graphics/icons/salt-reactor.png",
    icon_size = 64,
    place_result = "maraxsis-salt-reactor",
    stack_size = 10,
}}

data:extend {{
    type = "technology",
    name = "maraxsis-salt-reactor",
    icon = "__maraxsis__/graphics/technology/salt-reactor.png",
    icon_size = 256,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "maraxsis-salt-reactor"
        }
    },
    prerequisites = {"maraxsis-hydro-plant"},
    research_trigger = {
        type = "craft-item",
        item = "maraxsis-salt",
        count = 100
    },
    order = "d-e",
}}
