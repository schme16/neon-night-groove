



--local bound = {right = love.graphics.newImage('img/player/right/walkingBounding.png'), left = love.graphics.newImage('img/player/left/walkingBounding.png')}
game = {state = 'newGame', maxTime = 60, }

backgrounds = {}




---------------------------------------------------------------------------------------------------------
------------------------------------------Game Functions-----------------------------------------------
---------------------------------------------------------------------------------------------------------

function game:run() --calls the game state 
	if game.state == 'running' then 
		if cam then
			cam:draw(function() if game then game:draw() end end)
		end
	end
	game[game.state]()
end

function game:running(paused) --is run when the game is `running`


		if cam then cam:setPos(vector( player.getX(),(love.graphics.getHeight()/2))) end
		

	--there is a bug in the timer where even when paused it will count down, I'll fix this a little later
	
	game:draw()
	hud:draw()

end


function game:draw()
	game:backgrounds()
end

function game:backgrounds()
	local r,g,b,a = love.graphics.getColor()
	
		
	for i,v in ipairs(map) do
		
		love.graphics.setColor(math.random(1,255),math.random(1,255),math.random(1,255),255)
		debugVal = i*os.time()
		love.graphics.polygon( 'line', v )
	end
	
	love.graphics.setColor(r,g,b,a)
end

function game:start() --called when you start a game
	
end

function game:newGame() --called when you start a NEW game
	game:buildMap()
	game.state = 'running'
	

end

function game:loadGame() --called when you start LOAD a game
	
end

function game:paused()
	game:running(true)
end

function game:buildMap()
	map = {}
	local d = 45
	
	for k = -1,18 do	
	
		local x = -100-(34)
		local y = (d*k)
		local startrow = 45
		
		for i = 1, 18 do
			x = x+d*1.5
			--y = (k*d)
			makeHex(x,y, d)
		end
		
	
	end

	
	for k = -1, 18 do	
	
		local x = -100-(68)
		local y = math.round((d*k)+d*1.5)
		local startrow = 45
		
		for i = 1, 18 do
			x = x+d*1.5
			--y = (k*d)
			makeHex(x,y, d)
		end
		
	
	end
	


end


function makeHex(x,y, diameter)
	d = diameter/2
	hex = {
		(x-d) ,y,
		x-(d/2) ,y-d,
		x+(d/2) ,y-d,
		x+d ,y,
		x+(d/2) ,y+d,
		x-(d/2) ,y+d,
	}
	table.insert(map,hex)
	
end



function game.determineSpeed(speed)
	return math.ceil(math.round((speed * dt),0))
end

function game:playerDeath()
	error('Times Up!!!!!')
end












