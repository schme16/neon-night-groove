
--You must require the love modules in threads to use them.
require("love.thread")
require("love.filesystem")


--To perform thread operations, you have to find yourself.
local this_thread = love.thread.getThread()


function loadGameFiles()
	
		


	for i,v in ipairs(love.filesystem.enumerate( 'inc' )) do
		--local func = love.filesystem.load('inc/'..v)
		this_thread:send("func", 'inc/'..v )
		
	end
end


 --This waits for the main process to send a signal to start.

while this_thread:demand("run") do
   loadGameFiles()
end
