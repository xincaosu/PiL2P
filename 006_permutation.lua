--Page 79
function printList(lst)
  for i = 1,#lst do
    io.write(lst[i], " ")
  end
  io.write("\n")
end

function premgen(lst, len)
  local n = len or #lst
  if n <= 1 then
    coroutine.yield(lst)
    return
  end
  for i = 1,n do
    lst[i], lst[n] = lst[n], lst[i]
    premgen(lst, n-1)
    lst[i], lst[n] = lst[n], lst[i]
  end
end

function permutations(lst)
  return coroutine.wrap(function () premgen(lst) end)
end

for s in permutations{"a", "b", "c"} do
  printList(s)
end
