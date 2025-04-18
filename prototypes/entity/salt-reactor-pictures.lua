require ("util")


local function generator_pictures()

  return
  {
    layers =
    {
      util.sprite_load("__maraxsis__/graphics/entity/salt-reactor/salt-reactor",
      {
        priority = "high",
        scale = 0.5,
      }),
      util.sprite_load("__maraxsis__/graphics/entity/salt-reactor/salt-reactor-sh",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5
      })
    }
  }
end

local function generator_pictures_input(direction, fluid_input)
  local fluid_input_string = ""
  if fluid_input ~= 0 then
    fluid_input_string = "-input-".. fluid_input
  end
  return
  {
    layers =
    {
        util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string,
      {
        priority = "high",
        scale = 0.5,
      }),
      util.sprite_load("__space-age__/graphics/entity/fusion-generator/".. direction .. "/fusion-generator-" .. direction .. fluid_input_string .. "-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5
      })
    }
  }
end

local function generator_working_light(direction, fluid_input)
    return
    {
        layers = 
        {
            util.sprite_load("__maraxsis__/graphics/entity/salt-reactor/salt-reactor-emission", 
            {
                priority = "high",
                blend_mode = "additive",
                draw_as_glow = true,
                scale = 0.5
            })
        }
    }
end

return
{
  generator_graphics_set =
  {
    glow_color = {1,0,0.4,1},
    north_graphics_set =
    {
      animation = generator_pictures("north"),
      working_light = generator_working_light("north"),
      --fusion_effect_uv_map = generator_uv_map("north", {0, 0.5}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("north", 1),
          working_light = generator_working_light("north",1),
          --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
          sprite = generator_pictures_input("north",2),
          working_light = generator_working_light("north",2),
          --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
        {
            sprite = generator_pictures_input("north", 1),
            working_light = generator_working_light("north",1),
            --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
            sprite = generator_pictures_input("north",2),
            working_light = generator_working_light("north",2),
            --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
      }
    },
    east_graphics_set =
    {
      animation = generator_pictures("east"),
      working_light = generator_working_light("east"),
      --fusion_effect_uv_map = generator_uv_map("east", {-1,-0}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("east", 1),
          working_light = generator_working_light("east",1),
          --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
          sprite = generator_pictures_input("east",2),
          working_light = generator_working_light("east",2),
          --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
        {
            sprite = generator_pictures_input("east", 1),
            working_light = generator_working_light("east",1),
            --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
            sprite = generator_pictures_input("east",2),
            working_light = generator_working_light("east",2),
            --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
      }
    },
    south_graphics_set =
    {
      animation = generator_pictures("south"),
      working_light = generator_working_light("south"),
      --fusion_effect_uv_map = generator_uv_map("south", {0,-1}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("south", 1),
          working_light = generator_working_light("south",1),
          --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
          sprite = generator_pictures_input("south",2),
          working_light = generator_working_light("south",2),
          --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
        {
            sprite = generator_pictures_input("south", 1),
            working_light = generator_working_light("south",1),
            --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
            sprite = generator_pictures_input("south",2),
            working_light = generator_working_light("south",2),
            --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
      }
    },
    west_graphics_set =
    {
      animation = generator_pictures("west"),
      working_light = generator_working_light("west"),
      --fusion_effect_uv_map = generator_uv_map("west", {1,0}),
      fluid_input_graphics = {
        {
          sprite = generator_pictures_input("west", 1),
          working_light = generator_working_light("west",1),
          --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
          sprite = generator_pictures_input("west",2),
          working_light = generator_working_light("west",2),
          --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
        {
            sprite = generator_pictures_input("west", 1),
            working_light = generator_working_light("west",1),
            --fusion_effect_uv_map = generator_uv_map("north", {-1,2},1),
        },
        {
            sprite = generator_pictures_input("west",2),
            working_light = generator_working_light("west",2),
            --fusion_effect_uv_map = generator_uv_map("north", {1,2},2)
        },
      }
    },
    --light = {intensity = 1.0, size = 7, shift = {0, 0}, color = {r = 1, g = 0.5, b = 0}}
  }
}