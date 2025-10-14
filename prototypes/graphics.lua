local pfx = "__pk-fracking-tower__/graphics/entity/"

-- heroes in a half-shell
local function sequence_splicer(tab)
  local out = {}
  for _,entry in ipairs(tab) do
    if type(entry) == "table" then
      for _,entry2 in ipairs(entry) do
        table.insert(out, entry2)
      end
    else
      table.insert(out, entry)
    end
  end
  return out
end
local function range(start, _end, step)
  -- negative for loops do work apparently
  local out = {}
  for i=start,_end,step do
    table.insert(out, i)
  end
  return out
end
local function x(num, count)
  local out = {}
  for i=1,count do
    table.insert(out, num)
  end
  return out
end
local sequence = sequence_splicer({
  -- speed up into it
  x(1, 5), x(2, 4), x(3, 3), x(4, 3), x(5, 2), 6, 7, 8, 9, 10,
  -- small blockage
  x(11, 2), x(12, 3), x(13, 3), x(14, 3), x(15, 2), x(16, 2), x(17, 2),
  18, 19, 20,
  -- zoom down to near the end
  range(21, 50, 1),
  -- slowing down ...
  x(52, 2), x(54, 2), x(55, 3), x(56, 3), x(57, 4), x(58, 4), x(59, 5),
  x(60, 10),
  -- and back up
  x(59, 5), x(58, 5), x(57, 5), x(56, 5), x(55, 4), x(54, 4), x(53, 3), x(52, 3),
  x(51, 3),
  -- ease into end ...
  range(49, 10, -1),
  x(10, 2), x(9, 3), x(8, 4), x(7, 5), x(6, 5), x(5, 5), x(4, 5), x(3, 5), x(2, 5),
  x(1, 5),
  -- at this point it is 226 long.
  -- round up to 240
  x(1, 4 + 10),
})
-- Everything renders in the wrong place for smoe reason
local shift = {1, -0.5}

return {
  animation_list = {
    {
      render_layer = "floor-mechanics",
      always_draw = true,
      animation = util.sprite_load(pfx .. "shadow", {
        frame_count = 60,
        draw_as_shadow = true,
        scale = 0.5,
        -- Everything renders too far to the left and i don't know why.
        shift = shift,
      }),
    },
    {
      render_layer = "object",
      always_draw = true,
      animation = {
        layers = {
          util.sprite_load(pfx .. "fan", {
            frame_count = 10,
            animation_speed = 0.5,
            repeat_count = 240 / 10,
            scale = 0.5,
            shift = shift,
          }),
          util.sprite_load(pfx .. "fracking-tower", {
            frame_count = 60,
            animation_speed = 0.5,
            frame_sequence = sequence,
            scale = 0.5,
            shift = shift,
          }),
        }
      }
    }
  }
}
