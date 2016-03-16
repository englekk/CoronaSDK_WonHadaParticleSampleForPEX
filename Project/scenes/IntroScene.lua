local pex = require "com.ponywolf.pex"

--##############################  Main Code Begin  ##############################--
local composer = require( "composer" )

local scene = composer.newScene()

-- "scene:create()"
function scene:create( event )
	local sceneGroup = self.view

	-- 여기서부터 시작
	local particle = pex.load("images/particle.pex","images/texture.png")

	local finalEmitter = nil

	local function on_RuntimeTouch(e)
		local emitter = display.newEmitter(particle)
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
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )

-- -------------------------------------------------------------------------------

return scene
--##############################  Main Code End  ##############################--