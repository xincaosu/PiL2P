--Page 109
function serialize(o, indent)
  indent = indent or 0
  local idtString = string.rep(" ", indent)
  indent = indent + 2
  if type(o) == "number" then
    io.write(o)
  elseif type(o) == "string" then
    io.write(string.format("%q", o))
  elseif type(o) == "table" then
    io.write("{\n")
    for k, v in pairs(o) do
      io.write(idtString, "  ", k, " = ")
      serialize(v, indent)
      io.write(",\n")
    end
    io.write(idtString, "}")
  else
    error("cannot serialize a " .. type(o))
  end
end

local obj = {
  deviceType = 1,
  Id = "100456534375",
  fatherId = "106756524178",
  meterType = 12,
  request = {"11001", "12001"}
}

serialize(obj)

