-- By Ryan Trozzolo (Heatso)
function love.load()
	require("player")
	require("swipe")
	require("enemy")
	require("timer")
	love.graphics.setDefaultFilter("nearest") --blocky!
	pixeltest = love.graphics.newImage("pixeltest.png")
	pl.load()
	sw.load()
	en.load(76,31)
	
end

function love.update(dt)
	function love.keypressed(key)
		if key == 'f12' then
			if not love.window.getFullscreen() then
				love.window.setFullscreen(true)
			elseif love.window.getFullscreen() then
			love.window.setFullscreen(false)
		end
	end
end

	pl.update()
	sw.update()
	en.update()
	timer.update()
end


function love.draw()
	love.graphics.draw(pixeltest, 256, 256)
	pl.draw(0,0)
	sw.draw()
	en.draw()
	
end