--Page 63
f = loadstring("i = i + 1")

--如果下面一行被注释掉，程序会报错，因为"i = i + 1"必须使用全局变量
i = 5

function foo (i)
  f()
  f()
  return i  --此处返回形参“i”
end

print(foo(6))
print(i)

--output: 6 7
