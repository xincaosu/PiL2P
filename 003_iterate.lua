--Page 55
function values(t)
  local i = 0
  return function ()
    i = i + 1
    return t[i]
  end
end

t = {10, 20, 30}
iter = values(t)
local a = iter()
while a ~= nil do
  print(a)
  a = iter()
end

