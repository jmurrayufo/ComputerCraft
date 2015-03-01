local download = http.get("https://raw.github.com/jmurrayufo/jmurrayTestBed/master/README") --This will make 'download' hold the contents of the file.
local handle = download.readAll() --Reads everything in download
download.close() --remember to close download!
 
local file = fs.open("startup","w") --opens the file 'startup' with the permissions to write.
file.write(handle) --writes all the stuff in handle to the file 'startup'.
file.close() --remember to close download!