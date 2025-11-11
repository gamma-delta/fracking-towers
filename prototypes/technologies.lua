data:extend{
  {
    type = "technology",
    name = "pk-fracking-module-1",
    icon = "__pk-fracking-tower__/graphics/tech-module-1.png",
    icon_size = 256,
    prerequisites = {"modules"},
    unit = {
      -- this is the cost of MP 1
      time = 60,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      count = 250,
    },
    effects = {{type="unlock-recipe", recipe="pk-fracking-module-1"}},
    upgrade = true,
  },
  {
    type = "technology",
    name = "pk-fracking-tower",
    icon = "__pk-fracking-tower__/graphics/tech-tower.png",
    icon_size = 256,
    prerequisites = {"pk-fracking-module-1", "lubricant"},
    unit = {
      time = 60,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      count = 100,
    },
    effects = {{type="unlock-recipe", recipe="pk-fracking-tower"}},
  },
  {
    type = "technology",
    name = "pk-fracking-module-2",
    icon = "__pk-fracking-tower__/graphics/tech-module-2.png",
    icon_size = 256,
    prerequisites = {"pk-fracking-module-1", "processing-unit"},
    unit = {
      time = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      count = 100,
    },
    effects = {{type="unlock-recipe", recipe="pk-fracking-module-2"}},
    upgrade = true,
  },
  {
    type = "technology",
    name = "pk-fracking-module-3",
    icon = "__pk-fracking-tower__/graphics/tech-module-3.png",
    icon_size = 256,
    prerequisites = {"pk-fracking-module-2", "processing-unit", "production-science-pack", "electric-engine-unit"},
    unit = {
      time = 60,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      count = 300,
    },
    effects = {{type="unlock-recipe", recipe="pk-fracking-module-3"}},
    upgrade = true,
  },
}
