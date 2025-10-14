local item_sounds = require("__base__/prototypes/item_sounds")

data:extend{
  {
    type = "item",
    name = "pk-fracking-tower",
    icon = "__pk-fracking-tower__/graphics/icon-tower.png",
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
