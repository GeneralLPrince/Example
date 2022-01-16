local ServerScriptService = game:GetService("ServerScriptService")
local TweenService = game:GetService("TweenService")
local Services = ServerScriptService.Services
local FireService = require(Services.FireService)
local FPFolder = workspace.FireParts
local FP = {}

local v = FireService.CreateFire(FPFolder.Starter)
if v then
	FP = v
end


spawn(function()
	while true do
		for i,FirePart in pairs(FP) do
			local TimeOfBurning = FirePart["Time"]
			local Part = FirePart["Object"]
			local TouchingParts = FirePart["PartsTouching"]
			local Stage = FirePart["Stage"]
			if Stage == "Stage 1" then
				if os.time() >= TimeOfBurning + 10 then -- The time when the part was burning + 10 seconds
					print("Playing")
					TweenService:Create(Part.Fire, TweenInfo.new(8), {Heat = 6}):Play()
					TweenService:Create(Part.Fire, TweenInfo.new(8), {Size = 8}):Play()
					TweenService:Create(Part, TweenInfo.new(30), {Color = Color3.fromRGB(70, 57, 48)}):Play()
					FirePart["Stage"] = "Stage 2"
				end
			end
			
			if Stage == "Stage 2" then
				if os.time() >= TimeOfBurning + 45 then -- The time when the part was burning + 10 seconds
					print("Playing")
					TweenService:Create(Part.Fire, TweenInfo.new(8), {Size = 11}):Play()
					TweenService:Create(Part, TweenInfo.new(20), {Color = Color3.fromRGB(61, 49, 42)}):Play()
					FirePart["Stage"] = "Stage 2.1"
				end
			end
			
			if Stage == "Stage 2.1" then
				if os.time() >= TimeOfBurning + 65 then
					if TouchingParts then
						for i,vPart in pairs(TouchingParts) do
							if not FP[vPart] then
								local v = FireService.CreateFire(vPart)
								if v then
									FP = v
								end
							end
						end
					end
					FirePart["Stage"] = "Stage 3"
				end
			end
			
			if Stage == "Stage 3" then
				if os.time() >= TimeOfBurning + 90 then -- The time when the part was burning + 10 seconds
					print("Playing")
					TweenService:Create(Part.Fire, TweenInfo.new(8), {Size = 14}):Play()
					TweenService:Create(Part.Fire, TweenInfo.new(2), {Heat = 8}):Play()
					TweenService:Create(Part, TweenInfo.new(20), {Color = Color3.fromRGB(48, 38, 33)}):Play()
					FirePart["Stage"] = "Stage 4"
				end
			end
			
			if Stage == "Stage 4" then
				if os.time() >= TimeOfBurning + 120 then -- The time when the part was burning + 10 seconds
					print("Playing")
					TweenService:Create(Part.Fire, TweenInfo.new(14), {Size = 3}):Play()
					TweenService:Create(Part.Fire, TweenInfo.new(10), {Heat = 5}):Play()
					TweenService:Create(Part, TweenInfo.new(20), {Color = Color3.fromRGB(48, 38, 33)}):Play()
					FirePart["Stage"] = "Stage 5" 
				end
			end
		end
		wait()
	end
end)