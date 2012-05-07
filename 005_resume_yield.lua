--Page 75
co1 = coroutine.create(function (a,b)
    print(coroutine.yield(a+b, a-b))
    print(coroutine.yield(a+2, a+3, b+2))
  end)

--传入参数，使得："a=20, b=10"；"30"被丢弃
--resume返回"yield(a+b, a-b)"的实参："20+10, 20-10"
print(coroutine.resume(co1, 20, 10, 30))

--执行完"print(coroutine.yield(a+b, a-b))"，"yield(a+b, a-b)"返回"100, 200, 300"
--resume返回"yield(a+2, a+3, b+2)"的实参："20+2, 20+3, 10+2"
print(coroutine.resume(co1, 100, 200, 300))

print(coroutine.status(co1))

--执行完"print(coroutine.yield(a+2, a+3, b+2))"，"yield(a+2, a+3, b+2)"返回"nil"
print(coroutine.resume(co1))

co2 = coroutine.create(function ()
    print("co", coroutine.yield())
  end)
coroutine.resume(co2)
coroutine.resume(co2, 4, 5)

--output:
--[[
true  30  10
100 200 300
true  22  23  12
suspended

true
co  4 5
]]
