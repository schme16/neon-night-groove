--Neon Night Groove Main File


function love.load()

	love.graphics.setColorMode( 'replace' )
	love.graphics.setBackgroundColor(0,0,0)
	
	loadGameFiles()
end

function love.update(delta)
	dt = delta
	--capFPS(delta, 60)
--	keyboard.last = keyboard.isDown()

end

function love.draw()
	if game then game:run() end
	if gameDebug then gameDebug:run() end
end
	


function love.keypressed(key, u)
   --Debug
   if key == "rctrl" then --set to whatever key you want to use
      gameDebug.toggle()
   end  

end

function love.mousepressed( x, y, key )
	if key=='l' then end
	debugVal = x..' - '..y

end

function capFPS(delta, max)
	local ms = (1000 / 60) - (delta * 1000)
    if ms > 0 then
		love.timer.sleep(ms)
	end 
end


function loadGameFiles()
	for i,v in ipairs(love.filesystem.enumerate( 'inc' )) do
		local func = love.filesystem.load('inc/'..v)
			func()
	end
end


