-- By Ryan Trozzolo (Heatso)
sw2 = {
x = 0,
y = 0,
o = 36, --offset,
tmr = 10,
dbg = true,
img = {
	n = love.graphics.newImage("images/player/attackn.png"),
	s = love.graphics.newImage("images/player/attacks.png"),
	e = love.graphics.newImage("images/player/attacke.png"),
	w = love.graphics.newImage("images/player/attackw.png")
},
vis = false, -- visible?
box = {
	x = 0,
	y = 0,
	w = 18
},

}

function sw2.load()
	require("player2")
end



function sw2.getboxx()
return sw2.box.x
end
function sw2.getboxy()
return sw2.box.y
end
function sw2.getboxw()
return sw2.box.w
end
function sw2.getvis()
return sw2.vis
end

function sw2.timer()
if sw2.vis == true then
	if sw2.tmr > 0 then
		sw2.tmr = sw2.tmr - 1
	else
		sw2.vis = false
	end
else
	sw2.tmr = 10
	end
end



function sw2.update()
	if love.keyboard.isDown("kp0") then
		sw2.vis = true
	else
		sw2.vis = false
	end
	sw2.timer()
	
	sw2.x = pl.getX()
	sw2.y = pl.getY()
	
	if pl2.getdir() == "e" then
	sw2.box.x = sw2.x + 44
	sw2.box.y = sw2.y + 8
	elseif pl2.getdir() == "n" then
	sw2.box.x = sw2.x + 8
	sw2.box.y = sw2.y - 32
	elseif pl.getdir() == "s" then
	sw2.box.x = sw2.x + 8
	sw2.box.y = sw2.y + 44
	elseif pl2.getdir() == "w" then
	sw2.box.x = sw2.x - 32
	sw2.box.y = sw2.y + 8
	end
end




function sw2.draw()
	if sw2.vis == true then
		if pl2.getdir() == "n" then
			love.graphics.draw(sw2.img.n, sw2.x, sw2.y - sw2.o)
		elseif pl2.getdir() == "s" then
			love.graphics.draw(sw2.img.s, sw2.x, sw2.y + sw2.o)
		elseif pl2.getdir() == "e" then
			love.graphics.draw(sw2.img.e, sw2.x + sw2.o, sw2.y)
		elseif pl2.getdir() == "w" then
			love.graphics.draw(sw2.img.w, sw2.x - sw2.o, sw2.y)
		end
	end
	if sw2.dbg == true then
		love.graphics.rectangle("line", sw2.box.x, sw2.box.y, sw2.box.w, sw2.box.w)
	end
end
