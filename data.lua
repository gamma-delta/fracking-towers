local fracking_gfx = require "prototypes/graphics.lua"
local item_sounds = require("__base__/prototypes/item_sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")


local function effectivityinator()
  local out = {}
  for i = 1,8 do
    table.insert(out, i / i)
  end
  table.insert(out, 0)
  return out
end

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
    icon = "__pk-fracking-tower__/graphics/icon.png",
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

    graphics_set = require("prototypes/graphics.lua"),
    radius_visualisation_picture = beacon.radius_visualisation_picture,
    icons_positioning = {{
      inventory_index = defines.inventory.beacon_modules,
      shift = {0, 0},
      multi_row_initial_height_modifier = -0.3, max_icons_per_row = 2
    }},

    open_sound = {filename = "__base__/sound/open-close/beacon-open.ogg", volume = 0.25},
    close_sound = {filename = "__base__/sound/open-close/beacon-close.ogg", volume = 0.25},
    -- TODO: working sound

    -- thanks nonstandard beacons
    energy_source = {
      type = "fluid",
      burns_fluid = true,
      scale_fluid_usage = false,
      -- big mining drill is 40.
      -- these are gonna SUCK to use.
      emissions_per_minute = {pollution=100},
      fluid_box = {
        volume = 100,
        production_type = "input",
        -- TODO pipe pictures
        always_draw_covers = false,

        filter = "lubricant",
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
        }
      }
    },
    -- this makes the math easy.
    -- every multiple of 1kw is one lubricant per second.
    energy_usage = "20kW",

    module_slots = 4,
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    -- "consumption" is energy consumption. yay
    allowed_effects = {"productivity", "consumption", "pollution"},
    allowed_module_categories = {"pk-fracking-modules"},
    supply_area_distance = 15,
    profile = effectivityinator(),
    beacon_counter = "total",
  },
  {
    type = "item",
    name = "pk-fracking-tower",
    icon = "__pk-fracking-tower__/graphics/icon.png",
    subgroup = "module",
    order = "a[fracking-tower]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "pk-fracking-tower",
    stack_size = 5,
    weight = 100 * kg,
    stack_size = 20,
    random_tint_color = item_tints.iron_rust
  }
}

local function declare_module(tier, prod)
  data:extend{{
    type = "module",
    name = "pk-fracking-module-" .. tier,
    localised_description = {"item-description.pk-fracking-module"},
    icon = "__pk-fracking-tower__/graphics/icon-module-" .. tier .. ".png",
    subgroup = "module",
    -- Right after productivity
    order = "cz-" .. tier,
    stack_size = 50,
    weight = 20 * kg,
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,

    effect = {
      productivity = prod,
      pollution = 5 * prod,
      consumption = 2 * prod,
    },
    tier = tier,
    category = "pk-fracking-modules",
  }}
end
declare_module(1, 0.1)
declare_module(2, 0.2)
declare_module(3, 0.25)
