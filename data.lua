require "prototypes/items.lua"
require "prototypes/recipes.lua"
require "prototypes/technologies.lua"

local fracking_gfx = require "prototypes/graphics.lua"
local hit_effects = require("__base__/prototypes/entity/hit-effects")

local smoke_pos = {-0.75, -2.2}

local beacon = data.raw["beacon"]["beacon"]
data:extend{
  {
    type = "module-category",
    name = "pk-fracking-modules",
  },
  {
    type = "beacon",
    name = "pk-fracking-tower",
    order = "a[fracking-tower]",
    icon = "__pk-fracking-tower__/graphics/icon-tower.png",
    flags = {"placeable-player", "player-creation", "not-rotatable"},
    fast_replaceable_group = "pk-fracking-tower",
    minable = {mining_time=0.5, result="pk-fracking-tower"},
    max_health = 150,
    -- no one cares
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    impact_category = "metal",

    base_picture = fracking_gfx.base,
    animation = fracking_gfx.animation,
    radius_visualisation_picture = beacon.radius_visualisation_picture,
    icons_positioning = {{
      inventory_index = defines.inventory.beacon_modules,
      shift = {0, 0},
      multi_row_initial_height_modifier = -0.3, max_icons_per_row = 2
    }},

    open_sound = {filename = "__base__/sound/open-close/drill-open.ogg", volume = 0.25},
    close_sound = {filename = "__base__/sound/open-close/drill-close.ogg", volume = 0.25},
    working_sound = {
      main_sounds = {
        {
          sound = {filename="__base__/sound/train-wheels.ogg", volume=1},
        },
        {
          sound = {filename="__base__/sound/pumpjack-1.ogg", volume=1},
        },
      }
    },

    -- thanks nonstandard beacons
    energy_source = {
      type = "fluid",
      burns_fluid = false,
      scale_fluid_usage = true,
      maximum_temperature = 500,
      -- big mining drill is 40.
      -- these are gonna SUCK to use.
      emissions_per_minute = {pollution=100},
      fluid_box = {
        volume = 100,
        production_type = "input",
        pipe_covers = pipecoverspictures(),

        filter = "steam",
        minimum_temperature = 100,
        pipe_connections = {{
          flow_direction = "input",
          position = {0, 1},
          direction = defines.direction.south
        }}
      },
      smoke = {
        {
          name = "smoke",
          frequency = 20,
          position = {0, -2},
          starting_vertical_speed = 0.05,
          north_position = smoke_pos,
          east_position = smoke_pos,
          south_position = smoke_pos,
          west_position = smoke_pos,
        }
      }
    },
    -- 1 boiler outputs 1.8MW
    -- 1 heating tower outputs 40*2.5=100MW
    -- 1 nuclear reactor outputs 40MW, w/o neighbors
    -- 1 acid neutralizationizer outputs 194 MW (WHY IS IT SO MUCH)
    -- Cool steam requires ~33 water to the MW;
    -- hot steam requires ~10.
    -- (and an offshore pump makes 1200 water/second, so that's unlikely
    -- to be your bottleneck.)
    energy_usage = "10MW",

    module_slots = 8,
    distribution_effectivity = 2,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    allowed_effects = {"productivity", "pollution"},
    allowed_module_categories = {"pk-fracking-modules"},
    supply_area_distance = 9,
    profile = beacon.profile,
    beacon_counter = "same_type",
  },
}
