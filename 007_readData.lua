--Page 106
local count = 0
function Entry(_) count = count + 1 end
dofile("data007.txt")
print(count)

local authors = {}
function Entry(b) authors[b[1]] = true end
dofile("data007.txt")
for name in pairs(authors) do print(name) end
