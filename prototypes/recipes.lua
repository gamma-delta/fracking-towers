data:extend{
  {
    type = "recipe",
    name = "pk-fracking-module-1",
    icon = "__pk-fracking-tower__/graphics/icon-module-1.png",
    enabled = false,
    ingredients = {
      -- Don't make this too expensive -- it should be easy to "get up and go"
      -- note you can use this w/o fracking towers
      {type="item", name="advanced-circuit", amount=5},
      {type="item", name="burner-mining-drill", amount=5},
    },
    energy_required = 15,
    results = {{type="item", name="pk-fracking-module-1", amount=1}},
  },
  {
    type = "recipe",
    name = "pk-fracking-tower",
    icon = "__pk-fracking-tower__/graphics/icon-tower.png",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {type="item", name="electric-mining-drill", amount=5},
      {type="item", name="iron-gear-wheel", amount=20},
      {type="item", name="steel-plate", amount=20},
      {type="fluid", name="lubricant", amount=100},
    },
    energy_required = 15,
    results = {{type="item", name="pk-fracking-tower", amount=1}},
  },
  {
    type = "recipe",
    name = "pk-fracking-module-2",
    icon = "__pk-fracking-tower__/graphics/icon-module-2.png",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {type="item", name="pk-fracking-module-1", amount=4},
      {type="item", name="electric-mining-drill", amount=5},
      {type="item", name="processing-unit", amount=5},
      {type="fluid", name="lubricant", amount=20},
    },
    energy_required = 30,
    results = {{type="item", name="pk-fracking-module-2", amount=1}},
  },
  {
    type = "recipe",
    name = "pk-fracking-module-3",
    icon = "__pk-fracking-tower__/graphics/icon-module-3.png",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {type="item", name="pk-fracking-module-2", amount=4},
      {type="item", name="electric-engine-unit", amount=5},
      {type="item", name="processing-unit", amount=5},
      {type="fluid", name="lubricant", amount=100},
    },
    energy_required = 60,
    results = {{type="item", name="pk-fracking-module-3", amount=1}},
  },
}
