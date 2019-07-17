-- By Ryan Trozzolo (Heatso)
function love.load()
	require("player")
	require("swipe")
	require("enemy")
	require("timer")
	require("health")
	love.graphics.setDefaultFilter("nearest") --blocky!
	pixeltest = love.graphics.newImage("images/pixeltest.png")
	pl.load()
	sw.load()
	en.load(76,31)
	h.load(love.graphics.getWidth()- h.getWidth(),0)
	
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
	h.update()
	timer.update()
end


function love.draw()
	love.graphics.draw(pixeltest, 256, 256)
	pl.draw(0,0)
	sw.draw()
	en.draw()
	h.draw()
	
end