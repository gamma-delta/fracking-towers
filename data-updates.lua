-- In order for a fluid power source to work,
-- lubricant needs to either be above ambient temp,
-- or have a fuel value.
-- this is miserable and awful.
-- i'm picking fuel value, so that you don't have mixed lubricant
-- temperatures if you add and remove this mod.
data.raw["fluid"]["lubricant"].fuel_value = "1kJ"

for _,drill in pairs(data.raw["mining-drill"]) do
  if drill.allowed_module_categories then
    table.insert(drill.allowed_module_categories, "pk-fracking-modules")
  end
  -- If there's no allowed modules, don't add fracking
end
