--Page 75
co1 = coroutine.create(function (a,b)
    print(coroutine.yield(a+b, a-b))
    print(coroutine.yield(a+2, a+3, b+2))
  end)

--���������ʹ�ã�"a=20, b=10"��"30"������
--resume����"yield(a+b, a-b)"��ʵ�Σ�"20+10, 20-10"
print(coroutine.resume(co1, 20, 10, 30))

--ִ����"print(coroutine.yield(a+b, a-b))"��"yield(a+b, a-b)"����"100, 200, 300"
--resume����"yield(a+2, a+3, b+2)"��ʵ�Σ�"20+2, 20+3, 10+2"
print(coroutine.resume(co1, 100, 200, 300))

print(coroutine.status(co1))

--ִ����"print(coroutine.yield(a+2, a+3, b+2))"��"yield(a+2, a+3, b+2)"����"nil"
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
