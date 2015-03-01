--This script handles all other github scripts. It will remove old versions and download current ones. 

local function get(repoFile,saveTo)
   print("https://raw.github.com/jmurrayufo/ComputerCraft/master/"..repoFile)
   local download = http.get("https://raw.github.com/jmurrayufo/ComputerCraft/master/"..repoFile) --This will make 'download' hold the contents of the file.
   if download then --checks if download returned true or false
      local handle = download.readAll() --Reads everything in download
      download.close() --remember to close the download!
      local file = fs.open(saveTo,"w") --opens the file defined in 'saveTo' with the permissions to write.
      file.write(handle) --writes all the stuff in handle to the file defined in 'saveTo'
      file.close() --remember to close the file!
     else --if returned false
      print("Unable to download the file "..repoFile)
      print("Make sure you have the HTTP API enabled or")
      print("an internet connection!")
   end --end the if
end --close the function

--get("startup.lua","startup")

get("reactor.lua","react")

print("fin")