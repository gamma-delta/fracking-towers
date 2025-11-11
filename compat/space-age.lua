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
-- Using table.insert means we'll have slightly redundant tech links,
-- but it's less fragile.
table.insert(tech2.prerequisites, "space-science-pack")

local tech3 = data.raw["technology"]["pk-fracking-module-3"]
tech3.unit = {
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
-- In base, modules 3 require purple science, but not in spage.
-- Go figure!
tech3.prerequisites = {"pk-fracking-module-2", "metallurgic-science-pack", "carbon-fiber"}

local tech_tower = data.raw["technology"]["pk-fracking-tower"]
table.insert(tech_tower.prerequisites, "space-science-pack")
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
recipe3.ingredients = {
  {type="item", name="pk-fracking-module-2", amount=4},
  {type="item", name="processing-unit", amount=5},
  {type="item", name="big-mining-drill", amount=5},
  {type="item", name="carbon-fiber", amount=5},
  {type="fluid", name="lubricant", amount=100},
}
