local pex = require "assets.pex"

local particle = pex.load("assets/particle.pex","assets/texture.png")

local finalEmitter = nil

local function on_RuntimeTouch(e)
	local emitter = display.newEmitter(particle)
	emitter.startParticleSize = 200
	emitter.duration = 0.01
	emitter.x, emitter.y = e.x, e.y

	local phase = e.phase
	if phase == "began" then
		if finalEmitter then finalEmitter:removeSelf() end
	elseif phase == "ended" then
		emitter.duration = -1
		finalEmitter = emitter
	end
end
Runtime:addEventListener("touch", on_RuntimeTouch)