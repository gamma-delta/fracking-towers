-- In order for a fluid power source to work,
-- lubricant needs to either be above ambient temp,
-- or have a fuel value.
-- this is miserable and awful.
-- i'm picking fuel value, so that you don't have mixed lubricant
-- temperatures if you add and remove this mod.
data.raw["fluid"]["lubricant"].fuel_value = "1kJ"

-- AUGHH URGH ARUGH
local all_module_categories = {}
local amc_but_fracking = {}
for name,_ in pairs(data.raw["module-category"]) do
  table.insert(all_module_categories, name)
  if name ~= "pk-fracking-modules" then
    table.insert(amc_but_fracking, name)
  end
end
print(serpent.line(amc_but_fracking))

for _,drill in pairs(data.raw["mining-drill"]) do
  if drill.effect_reciever then
    if drill.allowed_module_categories then
      -- TODO: a blacklist for developers?
      table.insert(drill.allowed_module_categories, "pk-fracking-modules")
    else
      drill.allowed_module_categories = all_module_categories
    end
  end
end
for _,proto_type in ipairs{
  "beacon", "lab",
  "assembling-machine", "rocket-silo", "furnace",
  -- Mining drills handled above
} do
  for _,proto in pairs(data.raw[proto_type]) do
    -- Dont modify if it has a custom AMC
    if not proto.allowed_module_categories then
      proto.allowed_module_categories = amc_but_fracking
    end
  end
end

for level=1,4 do
  local tech = data.raw["technology"]["mining-productivity-" .. level]
  if tech then
    tech.hidden = true
    tech.enabled = false
  end
end

if mods["space-age"] then
  require "compat/space-age.lua"
end
