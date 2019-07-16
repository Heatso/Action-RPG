-- By Ryan Trozzolo (Heatso)
sw = {
x = 0,
y = 0,
o = 36, --offset,
tmr = 10,
dbg = false,
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

function sw.load()
	require("player")
end



function sw.getboxx()
return sw.box.x
end
function sw.getboxy()
return sw.box.y
end
function sw.getboxw()
return sw.box.w
end
function sw.getvis()
return sw.vis
end

function sw.timer()
if sw.vis == true then
	if sw.tmr > 0 then
		sw.tmr = sw.tmr - 1
	else
		sw.vis = false
	end
else
	sw.tmr = 10
	end
end



function sw.update()
	if love.keyboard.isDown("space") then
		sw.vis = true
	else
		sw.vis = false
	end
	sw.timer()
	
	sw.x = pl.getX()
	sw.y = pl.getY()
	
	if pl.getdir() == "e" then
	sw.box.x = sw.x + 44
	sw.box.y = sw.y + 8
	elseif pl.getdir() == "n" then
	sw.box.x = sw.x + 8
	sw.box.y = sw.y - 32
	elseif pl.getdir() == "s" then
	sw.box.x = sw.x + 8
	sw.box.y = sw.y + 44
	elseif pl.getdir() == "w" then
	sw.box.x = sw.x - 32
	sw.box.y = sw.y + 8
	end
end




function sw.draw()
	if sw.vis == true then
		if pl.getdir() == "n" then
			love.graphics.draw(sw.img.n, sw.x, sw.y - sw.o)
		elseif pl.getdir() == "s" then
			love.graphics.draw(sw.img.s, sw.x, sw.y + sw.o)
		elseif pl.getdir() == "e" then
			love.graphics.draw(sw.img.e, sw.x + sw.o, sw.y)
		elseif pl.getdir() == "w" then
			love.graphics.draw(sw.img.w, sw.x - sw.o, sw.y)
		end
	end
	if sw.dbg == true then
		love.graphics.rectangle("line", sw.box.x, sw.box.y, sw.box.w, sw.box.w)
	end
end
