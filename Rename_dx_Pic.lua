-- ������ĵ������ǽ��Ӷ������ص�����ͼƬ�������Է�ֹ�����������鼮��ʱ��
-- �������ĳ�����Ŀ¼ǰ��֮��Ĵ���
-- ע�⣺��������Ҫcopy���鼮ͼƬĿ¼�����У�
--       ��������������������С�unren.bat�����лָ���
local lfs = require"lfs"

local currDir = lfs.currentdir()
local before = {}   -- ��ų��������֮���ͼƬ����
local after = {}    -- ����������ͼƬ����
local bo = {cov=1, bok=2, leg=3, fow=4}
bo["!00"] = 5

local function mySort(x1, x2)
  local ix1 = bo[x1:match("...")]
  local ix2 = bo[x2:match("...")]
  return (ix1 == ix2) and (x1 < x2) or (ix1 < ix2)
end

for v in lfs.dir(currDir) do
  if (v:find("^0.*%.jpg$")) or (v:find("^0.*%.png$")) then
    after[#after+1] = v
  elseif (v:find("%.jpg$")) or (v:find("%.png$")) then
    before[#before+1] = v
  end
end

table.sort(before, mySort)
table.sort(after)

-- �������������ָܻ����������ġ�unren.bat���������ļ�
file = io.open("unren.bat", "w")
for ib, vb in ipairs(before) do
  newName = (#after < 1000) and 
    string.format( "a%s.%s", string.format('%03d', ib), vb:match("...$") ) or 
    string.format( "a%s.%s", string.format('%04d', ib), vb:match("...$") )
  file:write( string.format([=[ren "%s" "%s"]=], newName, vb).."\n" )
  os.rename(vb, newName)
end
for ia, va in ipairs(after) do
  newName = (#after < 1000) and 
    ( "d"..va:match(string.rep(".", 7)..'$') ) or
    ( "d"..va:match(string.rep(".", 8)..'$') )
  file:write( string.format([=[ren "%s" "%s"]=], newName, va).."\n" )
  os.rename(va, newName)
end
file:close()










