getgenv().ussing_AimcddjjnjI92930hnjmL_AIMCHEAT_AIMBOT = true

local PlayerMode = false

local plr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
getgenv().Toggle = false
getgenv().AutoFire = false

function notBehindWall(target)
	local ray = Ray.new(plr.Character.Head.Position, (target.Position - plr.Character.Head.Position).Unit * 999)
	local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {plr.Character}, false, true)
	if part then
		local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
		end
		if humanoid and target and humanoid.Parent == target.Parent then
			local pos, visible = camera:WorldToScreenPoint(target.Position)
			if visible then
				return true
			end
			--return true
		end
	end
end

function getunique()
	local i = 0
	local teams = {}
	for _,i in pairs(game.Players:GetPlayers()) do
		if not table.find(teams, i.Team) then
			teams[#teams+1] = i.Team
		end
	end
	return #teams, teams
end

function findClosestNotObstructed()
	local un = getunique()

	local closest = 999999
	local obj = nil
	for _,i in pairs(game.Workspace:GetChildren()) do
		if PlayerMode then

		else
			if i:FindFirstChild("Humanoid") and i.Humanoid.Health > 0 and i:FindFirstChild("HumanoidRootPart") then
				local char = i
				if (i.HumanoidRootPart.Position-plr.Character.PrimaryPart.Position).Magnitude < closest then
					if notBehindWall(i.HumanoidRootPart) and Toggle and getgenv().ussing_AimcddjjnjI92930hnjmL_AIMCHEAT_AIMBOT then
						if un < 2 then
							closest = (i.HumanoidRootPart.Position-plr.Character.PrimaryPart.Position).Magnitude
							obj = i	
						else
							if game.Players:GetPlayerFromCharacter(i).Team ~= game.Players.LocalPlayer.Team then
								closest = (i.HumanoidRootPart.Position-plr.Character.PrimaryPart.Position).Magnitude
								obj = i
							end
						end
					end
				end
			end
		end
	end
	return obj
end
