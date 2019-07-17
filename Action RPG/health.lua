h = {
x = 0,
y = 0,
state = 0,
img = love.graphics.newImage("images/hpdisp.png"),
width = 48,
quad = {
state3 = love.graphics.newQuad(0,0,48,16,48,64),
state2 = love.graphics.newQuad(0,16,48,16,48,64),
state1 = love.graphics.newQuad(0,32,48,16,48,64),
state0 = love.graphics.newQuad(0,48,48,16,48,64)
}
}
function h.load(x,y)
h.x = x
h.y = y
require ('player')
end

function h.update()
h.state = pl.gethp()
end

function h.getWidth()
return h.width
end

function h.draw()
	if h.state == 0 then
		love.graphics.draw(h.img,h.quad.state0,h.x,h.y)
	elseif h.state == 1 then
		love.graphics.draw(h.img,h.quad.state1,h.x,h.y)
	elseif h.state == 2 then
		love.graphics.draw(h.img,h.quad.state2,h.x,h.y)
	elseif h.state == 3 then
		love.graphics.draw(h.img,h.quad.state3,h.x,h.y)
	end
end


