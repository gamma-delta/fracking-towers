local tech2 = data.raw["technology"]["pk-fracking-module-2"]
tech2.unit = {
  time = 30,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1},
  },
  count = 200
}
tech2.prerequisites = {"pk-fracking-module-1", "space-science-pack"}

local tech3 = data.raw["technology"]["pk-fracking-module-3"]
tech2.unit = {
  time = 60,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"agricultural-science-pack", 1},
  },
  count = 2000,
}
tech3.prerequisites = {"pk-fracking-module-2", "metallurgic-science-pack", "agricultural-science-pack"}

local tech_tower = data.raw["technology"]["pk-fracking-tower"]
tech_tower.unit = {
  time = 30,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1},
  },
  count = 200,
}

-- is additional_categories stable yet?
data.raw["recipe"]["pk-fracking-module-1"].category = "metallurgy-or-assembling"
data.raw["recipe"]["pk-fracking-module-2"].category = "crafting-with-fluid-or-metallurgy"
data.raw["recipe"]["pk-fracking-tower"].category = "crafting-with-fluid-or-metallurgy"

local recipe3 = data.raw["recipe"]["pk-fracking-module-3"]
recipe3.category = "metallurgy"
table.insert(recipe3.ingredients, {type="item", name="tungsten-plate", amount=1}}
