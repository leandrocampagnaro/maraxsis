data:extend {{
    type = "recipe",
    name = "maraxsis-geothermal-sulfur",
    ingredients = {
        {type = "fluid", name = "steam", amount = 100},
        {type = "fluid", name = "lava",  amount = 100},
    },
    results = {
        {type = "item", name = "sulfur", amount = 2},
    },
    energy_required = 2,
    enabled = false,
    category = "maraxsis-hydro-plant",
    surface_conditions = {{
        property = "pressure",
        min = 400000,
        max = 400000,
    }},
    icon = "__maraxsis__/graphics/icons/geothermal-sulfur.png",
    icon_size = 64,
    allow_productivity = true,
}}


data:extend {{
    type = "recipe",
    name = "maraxsis-forced-petrogenesis",
    ingredients = {
        {type = "item", name = "maraxsis-tropical-fish", amount = 4},
        {type = "fluid", name = "lava",  amount = 100},
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 10},
    },
    energy_required = 1,
    enabled = false,
    category = "maraxsis-hydro-plant",
    surface_conditions = {{
        property = "pressure",
        min = 400000,
        max = 400000,
    }},
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    icon_size = 64,
    allow_productivity = true,
}}
