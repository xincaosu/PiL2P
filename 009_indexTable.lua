--Page 123 (english edition)
a = {}
a.testkey = "hello";
b = {}
c = {}
setmetatable(b, {__index = a})
setmetatable(c, {__index = b})
print(c.testkey)

