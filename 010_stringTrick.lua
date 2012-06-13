--Page 189 (english edition)
test = [[char s[] = "a /* b * c * d * e "; /* a tricky string */]]

function code (s)
  return string.gsub(s, [==[(["'])(.*)%1]==],
    function (x1, x2)
      return x1..string.gsub(x2, "%*", "\1")..x1
    end)
end

function decode (s)
  return (string.gsub(s, [==[(["'])(.*)%1]==],
    function (x1, x2)
      return x1..string.gsub(x2, "\1", "*")..x1
    end))
end

print(decode(string.gsub(code(test), "/%*.-%*/", "<COMMENT>")))
