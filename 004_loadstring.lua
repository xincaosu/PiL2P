--Page 63
f = loadstring("i = i + 1")

--�������һ�б�ע�͵�������ᱨ����Ϊ"i = i + 1"����ʹ��ȫ�ֱ���
i = 5

function foo (i)
  f()
  f()
  return i  --�˴������βΡ�i��
end

print(foo(6))
print(i)

--output: 6 7
