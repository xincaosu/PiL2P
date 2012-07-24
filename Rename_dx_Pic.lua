-- 本程序的的作用是将从读秀下载的数据图片改名，以防止在制作电子书籍的时候，
-- 发生正文出现在目录前面之类的错误。
-- 注意：本程序需要copy到书籍图片目录下运行！
--       如果发生错误，请立即运行“unren.bat”进行恢复！
local lfs = require"lfs"

local currDir = lfs.currentdir()
local before = {}   -- 存放除书的正文之外的图片名称
local after = {}    -- 存放书的正文图片名称
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

-- 改名，并生成能恢复改名操作的“unren.bat”批处理文件
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










