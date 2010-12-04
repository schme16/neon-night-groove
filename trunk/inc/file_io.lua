file = {}

function file.Write(p, t, a)

   local fyle, err = io.open(p, "w")
   if err then error(err) end
   if not a then
      fyle:write(tostring(t))
   else
      fyle:write(file.Read(p)..tostring(t))
   end
   fyle:close()

end

function file.Exists(p)

   local file, err = io.open(p, "r")
   if err and string.find(err, "No such file or directory") then return false end
   file:close()
   return true

end

function file.Read(p, l)

   if not file.Exists(p) then return end
   local file, err = io.open(p, "r")
   local r
   if not l then
      r = file:read()
   else
      r = {}
      while true do
         local line = file:read("*line")
         if not line then break end
         table.insert(r, line)
      end
   end
   file:close()
   return r

end