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
local override_allow = {}
local override_deny = {}
for it in settings.startup["pk-fracking-module-allowlist"]
  .value:gmatch("[^,]+")
do
  override_allow[it] = true
end
for it in settings.startup["pk-fracking-module-denylist"]
  .value:gmatch("[^,]+") 
do
  override_deny[it] = true
end
log(serpent.line(override_deny))

for _,drill in pairs(data.raw["mining-drill"]) do
  if not override_deny[drill.name] then
    if drill.allowed_module_categories then
      -- non-destructively add
      table.insert(drill.allowed_module_categories, "pk-fracking-modules")
    end
    -- Otherwise, it is `nil`, which by default allows all module categories
  else
    -- don't mess with it if it has a custom list
    if not drill.allowed_module_categories then
      drill.allowed_module_categories = amc_but_fracking
    end
  end
end
for _,proto_type in ipairs{
  "beacon", "lab",
  "assembling-machine", "rocket-silo", "furnace",
  -- Mining drills handled above
} do
  for _,proto in pairs(data.raw[proto_type]) do
    -- Don't mess with the module categories of entities that have custom ones
    local remove_fracking = not proto.allowed_module_categories or override_deny[proto.name]
    if not override_allow[proto.name] and remove_fracking then
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
