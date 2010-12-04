hud = {}

function hud:draw()
	hud:timer()
	hud:score()
end



function hud:timer()
	--advPrint('Time: '..tostring(game.timer), (love.graphics.getWidth()/2)-(6*15),0,{0,0,0})
end

function hud:score()
	--advPrint('Score: '..tostring(player.score), 10,0,{0,0,0})
end