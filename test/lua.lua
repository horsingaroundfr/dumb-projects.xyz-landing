local l_Players_0 = game:GetService("Players");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("TextChatService");
local v5 = false;
local v6 = nil;
if not l_Players_0.LocalPlayer:FindFirstChild("PlayerGui") then
    return;
else
    local v7 = "2hxKqA3b7b";
    local v8 = "fivethree_ui.txt";
    local v9 = false;
    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v9 (ref), v8 (ref)
        v9 = readfile(v8) == "true";
    end);
    if not v9 then
        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_HttpService_0 (ref), v7 (ref), v8 (ref)
            http.request({
                Url = "http://127.0.0.1:6463/rpc?v=1", 
                Method = "POST", 
                Headers = {
                    ["Content-Type"] = "application/json", 
                    Origin = "https://discord.com"
                }, 
                Body = l_HttpService_0:JSONEncode({
                    cmd = "INVITE_BROWSER", 
                    args = {
                        code = v7
                    }, 
                    nonce = l_HttpService_0:GenerateGUID(false)
                })
            });
            writefile(v8, "true");
        end);
    end;
    local v10 = false;
    if v10 then
        getfenv().getfenv = function() --[[ Line: 0 ]] --[[ Name:  ]]
            return setmetatable({}, {
                __index = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    return function() --[[ Line: 0 ]] --[[ Name:  ]]
                        return true;
                    end;
                end
            });
        end;
    end;
    local l_HttpService_1 = game:GetService("HttpService");
    local l_Players_1 = game:GetService("Players");
    local l_LocalPlayer_0 = l_Players_1.LocalPlayer;
    local l_UserInputService_1 = game:GetService("UserInputService");
    local l_RunService_0 = game:GetService("RunService");
    local l_TweenService_1 = game:GetService("TweenService");
    local v17 = {
        TabWidth = 160, 
        Size = {
            580, 
            460
        }, 
        Theme = "Darker", 
        Acrylic = false, 
        Transparency = true, 
        MinimizeKey = "RightShift", 
        ShowNotifications = true, 
        ShowWarnings = true, 
        RenderingMode = "RenderStepped", 
        AutoImport = true
    };
    local v31 = {
        ImportSettings = function(_) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v10 (ref), l_HttpService_1 (ref), v17 (ref)
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v10 (ref), l_HttpService_1 (ref), v17 (ref)
                if not v10 and getfenv().isfile and getfenv().readfile and getfenv().isfile("UISettings.Luasec") and getfenv().readfile("UISettings.Luasec") then
                    local v19 = l_HttpService_1:JSONDecode(getfenv().readfile("UISettings.Luasec"));
                    for v20, v21 in next, v19 do
                        v17[v20] = v21;
                        task.wait(0.1);
                    end;
                end;
            end);
        end, 
        ExportSettings = function(_) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v10 (ref), l_HttpService_1 (ref), v17 (ref)
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v10 (ref), l_HttpService_1 (ref), v17 (ref)
                if not v10 and getfenv().isfile and getfenv().readfile and getfenv().writefile then
                    getfenv().writefile("UISettings.Luasec", l_HttpService_1:JSONEncode(v17));
                end;
            end);
        end, 
        ExportConfigurations = function(_) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v10 (ref), l_HttpService_1 (ref)
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v10 (ref), l_HttpService_1 (ref)
                if not v10 and getfenv().writefile then
                    local v24 = {};
                    for v25, v26 in next, Configuration do
                        if v25 == "FoVColour" or v25 == "NameESPOutlineColour" or v25 == "ESPColour" or v25 == "SelectedColor" or v25 == "SelectedOutdoorColor" or v25 == "BoxColor" or v25 == "TracerColor" or v25 == "NameColor" then
                            v24[v25] = ColorsHandler:PackColour(v26);
                        else
                            v24[v25] = v26;
                        end;
                        task.wait(0.1);
                    end;
                    if Configuration.SelectedSkinModel then
                        v24.SelectedSkinModel = Configuration.SelectedSkinModel;
                    end;
                    v24.SelectedSkybox = Configuration.SelectedSkybox;
                    local v27 = nil;
                    if getgenv().skippedLagPoll then
                        v27 = string.format("%s.Luasec_skipped", game.GameId);
                    else
                        v27 = string.format("%s.Luasec", game.GameId);
                    end;
                    getfenv().writefile(v27, l_HttpService_1:JSONEncode(v24));
                end;
            end);
        end, 
        SaveAllSettings = function(v28) --[[ Line: 0 ]] --[[ Name:  ]]
            if not Configuration then
                warn("SaveAllSettings: Configuration table is nil, cannot save settings.");
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v28 (ref)
                    v28:ExportSettings();
                    v28:ExportConfigurations();
                    if Configuration.AntiKatana ~= nil then
                        ImportedConfiguration.AntiKatana = Configuration.AntiKatana;
                    end;
                    if Configuration.AntiKatanaSound ~= nil then
                        ImportedConfiguration.AntiKatanaSound = Configuration.AntiKatanaSound;
                    end;
                    if Configuration.InventoryViewer ~= nil then
                        ImportedConfiguration.InventoryViewer = Configuration.InventoryViewer;
                    end;
                    if Configuration.FastEquip ~= nil then
                        ImportedConfiguration.FastEquip = Configuration.FastEquip;
                    end;
                    if Configuration.SkinChanger ~= nil then
                        ImportedConfiguration.SkinChanger = Configuration.SkinChanger;
                    end;
                    if Configuration.SelectedSkin ~= nil then
                        ImportedConfiguration.SelectedSkin = Configuration.SelectedSkin;
                    end;
                    v28:SaveToDataStore(ImportedConfiguration);
                end);
                if not l_status_0 then
                    warn("SaveAllSettings failed:", l_result_0);
                end;
                return;
            end;
        end
    };
    v31:ImportSettings();
    v17.__LAST_RUN__ = os.date();
    v31:ExportSettings();
    local v36 = {
        PackColour = function(_, v33) --[[ Line: 0 ]] --[[ Name:  ]]
            if typeof(v33) == "Color3" then
                return {
                    R = v33.R * 255, 
                    G = v33.G * 255, 
                    B = v33.B * 255
                };
            elseif typeof(v33) == "table" and v33.R and v33.G and v33.B then
                return v33;
            else
                return {
                    R = 255, 
                    G = 255, 
                    B = 255
                };
            end;
        end, 
        UnpackColour = function(_, v35) --[[ Line: 0 ]] --[[ Name:  ]]
            if typeof(v35) == "table" and v35.R and v35.G and v35.B then
                return Color3.fromRGB(v35.R, v35.G, v35.B);
            elseif typeof(v35) == "Color3" then
                return v35;
            else
                return Color3.fromRGB(255, 255, 255);
            end;
        end
    };
    local v37 = {};
    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v10 (ref), v17 (ref), v37 (ref), l_HttpService_1 (ref), v36 (ref)
        if not v10 and getfenv().isfile and getfenv().readfile and getfenv().isfile(string.format("%s.Luasec", game.GameId)) and getfenv().readfile(string.format("%s.Luasec", game.GameId)) and v17.AutoImport then
            v37 = l_HttpService_1:JSONDecode(getfenv().readfile(string.format("%s.Luasec", game.GameId)));
            for v38, v39 in next, v37 do
                if v38 == "FoVColour" or v38 == "NameESPOutlineColour" or v38 == "ESPColour" then
                    v37[v38] = v36:UnpackColour(v39);
                elseif v38 == "SelectedSkinModel" then
                    Configuration.SelectedSkinModel = v39;
                end;
            end;
        end;
    end);
    local v40 = {
        Watermark = v37.Watermark
    };
    if v40.Watermark == nil then
        v40.Watermark = true;
    end;
    v40.BlatantEnabled = v37.BlatantEnabled or false;
    v40.TeleportMode = v37.TeleportMode or "Instant";
    v40.TeleportHeight = v37.TeleportHeight or 5;
    v40.TeleportDistance = v37.TeleportDistance or 5;
    v40.MaxTeleportRange = v37.MaxTeleportRange or 500;
    v40.OrbitMode = v37.OrbitMode or false;
    v40.OrbitSpeed = v37.OrbitSpeed or 1;
    v40.OrbitDistance = v37.OrbitDistance or 5;
    v40.OrbitHeight = v37.OrbitHeight or 3;
    v40.TargetESP = v37.TargetESP or false;
    v40.AutoTeleport = v37.AutoTeleport or false;
    v40.TeleportInterval = v37.TeleportInterval or 3;
    v40.TeleportKey = v37.TeleportKey or "X";
    v40.AutoTargetClosestEnemy = v37.AutoTargetClosestEnemy or false;
    v40.AutoTargetClosestTeammate = v37.AutoTargetClosestTeammate or false;
    v40.ESPEnabled = v37.ESPEnabled or false;
    v40.TeamCheck = v37.TeamCheck or false;
    v40.BoxFillTransparency = v37.BoxFillTransparency or 0.5;
    v40.BoxOutlineTransparency = v37.BoxOutlineTransparency or 0;
    v40.BoxColor = v37.BoxColor or Color3.fromRGB(255, 0, 0);
    v40.TracerColor = v37.TracerColor or Color3.new(1, 1, 1);
    v40.ResolutionChangerEnabled = v37.ResolutionChangerEnabled or false;
    v40.ResolutionChangerStrength = v37.ResolutionChangerStrength or 0.5;
    v40.InfiniteJumpEnabled = v37.InfiniteJumpEnabled or false;
    v40.WalkspeedEnabled = v37.WalkspeedEnabled or false;
    v40.WalkspeedValue = v37.WalkspeedValue or 16;
    v40.NoClipEnabled = v37.NoClipEnabled or false;
    v40.FlyingEnabled = v37.FlyingEnabled or false;
    v40.FlyingSpeed = v37.FlyingSpeed or 50;
    v40.DeviceSpoof = v37.DeviceSpoof;
    v40.SilentAim = v37.SilentAim or false;
    v40.Aimbot = v37.Aimbot or false;
    v40.OnePressAimingMode = v37.OnePressAimingMode or false;
    v40.AimKey = v37.AimKey or "RMB";
    v40.AimMode = v37.AimMode or "Mouse";
    v40.OffAimbotAfterKill = v37.OffAimbotAfterKill or false;
    v40.AimPartDropdownValues = v37.AimPartDropdownValues or {
        "Head", 
        "HumanoidRootPart"
    };
    v40.AimPart = v37.AimPart or "Head";
    v40.RandomAimPart = v37.RandomAimPart or false;
    v40.TimeControlEnabled = v37.TimeControlEnabled or false;
    v40.TimeSliderValue = v37.TimeSliderValue or 12;
    v40.ShadowsEnabled = v37.ShadowsEnabled or false;
    v40.AmbientColorEnabled = v37.AmbientColorEnabled or false;
    v40.SelectedColor = v37.SelectedColor or Color3.fromRGB(127, 127, 127);
    v40.RainbowModeEnabled = v37.RainbowModeEnabled or false;
    v40.RainbowSpeed = v37.RainbowSpeed or 1;
    v40.OutdoorAmbientEnabled = v37.OutdoorAmbientEnabled or false;
    v40.SelectedOutdoorColor = v37.SelectedOutdoorColor or Color3.fromRGB(127, 127, 127);
    v40.FogEnabled = v37.FogEnabled or false;
    v40.FogColor = v37.FogColor or Color3.fromRGB(191, 191, 191);
    v40.FogStart = v37.FogStart or 0;
    v40.FogEnd = v37.FogEnd or 1000;
    v40.RealisticRenderingEnabled = v37.RealisticRenderingEnabled or false;
    v40.MaterialOverrides = v37.MaterialOverrides or false;
    v40.CustomMaterial = v37.CustomMaterial or Enum.Material.SmoothPlastic;
    v40.CustomReflectance = v37.CustomReflectance or 0;
    v40.BloomEnabled = v37.BloomEnabled or false;
    v40.BloomIntensity = v37.BloomIntensity or 1;
    v40.BloomSize = v37.BloomSize or 24;
    v40.BloomThreshold = v37.BloomThreshold or 2;
    v40.DepthOfFieldEnabled = v37.DepthOfFieldEnabled or false;
    v40.DOFFarIntensity = v37.DOFFarIntensity or 0.75;
    v40.DOFNearIntensity = v37.DOFNearIntensity or 0.75;
    v40.DOFFocusDistance = v37.DOFFocusDistance or 51.6;
    v40.SensitivityEnabled = v37.SensitivityEnabled;
    if v40.SensitivityEnabled == nil then
        v40.SensitivityEnabled = true;
    end;
    v40.SensitivityValue = v37.SensitivityValue or 0.2;
    v40.UseOffset = v37.UseOffset or false;
    v40.OffsetType = v37.OffsetType or "Static";
    v40.StaticOffsetIncrement = v37.StaticOffsetIncrement or 10;
    v40.DynamicOffsetIncrement = v37.DynamicOffsetIncrement or 10;
    v40.AutoOffset = v37.AutoOffset or false;
    v40.MaxAutoOffset = v37.MaxAutoOffset or 50;
    v40.UseSensitivity = v37.UseSensitivity;
    if v40.UseSensitivity == nil then
        v40.UseSensitivity = true;
    end;
    v40.Sensitivity = v37.Sensitivity or 10;
    v40.UseNoise = v37.UseNoise or false;
    v40.NoiseFrequency = v37.NoiseFrequency or 50;
    v40.TriggerBot = v37.TriggerBot or false;
    v40.OnePressTriggeringMode = v37.OnePressTriggeringMode or false;
    v40.SmartTriggerBot = v37.SmartTriggerBot or false;
    v40.TriggerKey = v37.TriggerKey or "E";
    v40.TriggerBotChance = v37.TriggerBotChance or 100;
    v40.TriggerBotDelay = v37.TriggerBotDelay or 0;
    v40.AliveCheck = v37.AliveCheck or false;
    v40.GodCheck = v37.GodCheck or false;
    v40.TeamCheck = v37.TeamCheck or false;
    v40.FriendCheck = v37.FriendCheck or false;
    v40.FollowCheck = v37.FollowCheck or false;
    v40.VerifiedBadgeCheck = v37.VerifiedBadgeCheck or false;
    v40.WallCheck = v37.WallCheck or false;
    v40.FoVCheck = v37.FoVCheck or false;
    v40.FoVRadius = v37.FoVRadius or 100;
    v40.MagnitudeCheck = v37.MagnitudeCheck or false;
    v40.TriggerMagnitude = v37.TriggerMagnitude or 500;
    v40.WhitelistedGroupCheck = v37.WhitelistedGroupCheck or false;
    v40.WhitelistedGroup = v37.WhitelistedGroup or 0;
    v40.BlacklistedGroupCheck = v37.BlacklistedGroupCheck or false;
    v40.BlacklistedGroup = v37.BlacklistedGroup or 0;
    v40.IgnoredPlayersCheck = v37.IgnoredPlayersCheck or false;
    v40.IgnoredPlayersDropdownValues = v37.IgnoredPlayersDropdownValues or {};
    v40.IgnoredPlayers = v37.IgnoredPlayers or {};
    v40.TargetPlayersCheck = v37.TargetPlayersCheck or false;
    v40.TargetPlayersDropdownValues = v37.TargetPlayersDropdownValues or {};
    v40.TargetPlayers = v37.TargetPlayers or {};
    v40.FoV = v37.FoV or false;
    v40.FoVKey = v37.FoVKey or "R";
    v40.FoVThickness = v37.FoVThickness or 2;
    v40.FoVOpacity = v37.FoVOpacity or 0.8;
    v40.FoVFilled = v37.FoVFilled or false;
    v40.FoVColour = v37.FoVColour or Color3.fromRGB(255, 255, 255);
    v40.DesyncEnabled = v37.DesyncEnabled or false;
    v40.DesyncMode = v37.DesyncMode or "Normal";
    v40.DesyncStrength = v37.DesyncStrength or 1;
    v40.DesyncUpdateRate = v37.DesyncUpdateRate or 10;
    v40.DesyncYaw = v37.DesyncYaw or 0;
    v40.DesyncPitch = v37.DesyncPitch or 0;
    v40.DesyncJitter = v37.DesyncJitter or false;
    v40.DesyncJitterStrength = v37.DesyncJitterStrength or 1;
    v40.DesyncAutoDirection = v37.DesyncAutoDirection or false;
    v40.DesyncCustomRotation = v37.DesyncCustomRotation or CFrame.new();
    v40.DesyncBreakWalk = v37.DesyncBreakWalk or false;
    v40.DesyncLeanMode = v37.DesyncLeanMode or "None";
    v40.DesyncFakeLag = v37.DesyncFakeLag or false;
    v40.DesyncFakeLagAmount = v37.DesyncFakeLagAmount or 0;
    local l_LocalPlayer_1 = l_Players_1.LocalPlayer;
    local l_l_LocalPlayer_1_Mouse_0 = l_LocalPlayer_1:GetMouse();
    local v43 = l_UserInputService_1.KeyboardEnabled and l_UserInputService_1.MouseEnabled;
    local v44 = {
        "%s", 
        "%s", 
        " %s", 
        "%s", 
        "%s", 
        "%s", 
        "%s", 
        "%s", 
        "%s", 
        "%s", 
        "%s", 
        "%s"
    };
    local _ = function(v45) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: l_Players_1 (ref)
        if typeof(v45) == "string" and #v45 > 0 then
            for _, v47 in next, l_Players_1:GetPlayers() do
                if string.sub(string.lower(v47.Name), 1, #string.lower(v45)) == string.lower(v45) then
                    return v47.Name;
                end;
            end;
        end;
        return "";
    end;
    local v49 = "";
    local v50 = nil;
    local v51 = false;
    local v52 = true;
    local v53 = os.clock();
    local v54 = false;
    local v55 = nil;
    local v56 = nil;
    local l_MouseDeltaSensitivity_0 = l_UserInputService_1.MouseDeltaSensitivity;
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local v61 = false;
    if typeof(script) == "Instance" and script:FindFirstChild("Fluent") and script:FindFirstChild("Fluent"):IsA("ModuleScript") then
        v50 = require(script:FindFirstChild("Fluent"));
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
            return game:HttpGet("https://twix.cyou/Fluent.txt", true);
        end);
        if l_status_1 and typeof(l_result_1) == "string" and string.find(l_result_1, "dawid") then
            v50 = getfenv().loadstring(l_result_1)();
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                return game:HttpGet("https://twix.cyou/AimbotStatus.json", true);
            end);
            if l_status_2 and typeof(l_result_2) == "string" and pcall(l_HttpService_1.JSONDecode, l_HttpService_1, l_result_2) and typeof(l_HttpService_1:JSONDecode(l_result_2).message) == "string" then
                v49 = l_HttpService_1:JSONDecode(l_result_2).message;
            end;
        else
            return;
        end;
    end;
    local v66 = nil;
    v66 = l_UserInputService_1:GetPropertyChangedSignal("MouseDeltaSensitivity"):Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v50 (ref), v66 (ref), v54 (ref), v10 (ref), v43 (ref), v40 (ref), l_MouseDeltaSensitivity_0 (ref), l_UserInputService_1 (ref)
        if not v50 then
            v66:Disconnect();
        elseif not v54 or not v10 and getfenv().mousemoverel and v43 and v40.AimMode == "Mouse" then
            l_MouseDeltaSensitivity_0 = l_UserInputService_1.MouseDeltaSensitivity;
        end;
    end);
    local l_v50_0 = v50;
    local l_CreateWindow_0 = v50.CreateWindow;
    local v69 = {};
    local l_format_0 = string.format;
    local v71 = "Luasec";
    local v72 = string.format(v44[os.date("*t").month], "Luasec");
    local v73;
    if #v49 <= 0 or not v49 then
        v73 = "  ";
    else
        v73 = v49;
    end;
    v69.Title = l_format_0(v71, v72, v73);
    v69.SubTitle = "By @ Luasec Development";
    v69.TabWidth = v17.TabWidth;
    v69.Size = UDim2.fromOffset(table.unpack(v17.Size));
    v69.Theme = v17.Theme;
    v69.Acrylic = v17.Acrylic;
    v69.MinimizeKey = v17.MinimizeKey;
    l_CreateWindow_0 = l_CreateWindow_0(l_v50_0, v69);
    task.wait(0.1);
    l_v50_0 = {
        Aimbot = l_CreateWindow_0:AddTab({
            Title = "Aimbot", 
            Icon = "crosshair"
        })
    };
    task.wait(0.1);
    l_CreateWindow_0:SelectTab(1);
    task.wait(0.1);
    l_v50_0.Aimbot:AddParagraph({
        Title = string.format("%s ", string.format(v44[os.date("*t").month], "Luasec")), 
        Content = "Luasec\nhttps://discord.gg/luasec"
    });
    task.wait(0.1);
    v40.MaxTrackingDistance = v37.MaxTrackingDistance or 1000;
    l_v50_0.Misc = l_CreateWindow_0:AddTab({
        Title = "Misc", 
        Icon = "box"
    });
    task.wait(0.1);
    l_v50_0.Misc:AddParagraph({
        Title = string.format("%s ", string.format(v44[os.date("*t").month], "Luasec")), 
        Content = "Luasec\nhttps://discord.gg/luasec"
    });
    task.wait(0.1);
    v69 = l_v50_0.Misc:AddSection("Particles");
    task.wait(0.1);
    v69:AddButton({
        Title = "No Flash", 
        Description = "Removes flashbang effects", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v50 (ref)
            if game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc:FindFirstChild("FlashbangEffect") then
                game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc.FlashbangEffect:Destroy();
                v50:Notify({
                    Title = "Flashbang Removed", 
                    Content = "Flashbang effects have been disabled", 
                    Duration = 2
                });
            else
                v50:Notify({
                    Title = "Already Removed", 
                    Content = "Flashbang effects are already disabled", 
                    Duration = 2
                });
            end;
        end
    });
    task.wait(0.1);
    v69:AddButton({
        Title = "No Smoke", 
        Description = "Removes smoke effects", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v50 (ref)
            if game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc:FindFirstChild("SmokeClouds") then
                game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc.SmokeClouds:Destroy();
                v50:Notify({
                    Title = "Smoke Removed", 
                    Content = "Smoke effects have been disabled", 
                    Duration = 2
                });
            else
                v50:Notify({
                    Title = "Already Removed", 
                    Content = "Smoke effects are already disabled", 
                    Duration = 2
                });
            end;
        end
    });
    task.wait(0.1);
    l_format_0 = l_v50_0.Misc:AddSection("Device Spoofer");
    task.wait(0.1);
    v71 = {
        Computer = "MouseKeyboard", 
        Mobile = "Touch", 
        Console = "Gamepad", 
        VR = "VR"
    };
    do
        local l_l_CreateWindow_0_0, l_v71_0, l_v73_0 = l_CreateWindow_0, v71, v73;
        l_format_0:AddDropdown("DeviceSpoofDropdown", {
            Title = "Spoof Device", 
            Description = "Select a device type to spoof", 
            Values = {
                "Computer", 
                "Mobile", 
                "Console", 
                "VR"
            }, 
            Multi = false, 
            Default = v40.DeviceSpoof, 
            Callback = function(v77) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref), v31 (ref)
                v40.DeviceSpoof = v77;
                v31:ExportSettings();
            end
        }):OnChanged(function(v78) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_v71_0 (ref), v50 (ref)
            local v79 = l_v71_0[v78];
            if v79 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v79 (ref)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Fighter"):WaitForChild("SetControls"):FireServer(v79);
                end);
                if l_status_3 then
                    v50:Notify({
                        Title = "Device Spoofed", 
                        Content = "Now spoofed as " .. v78, 
                        Duration = 2
                    });
                else
                    v50:Notify({
                        Title = "Spoof Failed", 
                        Content = "Could not spoof device: " .. tostring(l_result_3), 
                        Duration = 2
                    });
                end;
            end;
        end);
        task.wait(0.1);
        v72 = l_v50_0.Misc:AddSection("Weapon Features");
        task.wait(0.1);
        l_v73_0 = nil;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = false;
        local v86 = nil;
        local v87 = false;
        local v88 = nil;
        local function v92(v89) --[[ Line: 0 ]] --[[ Name:  ]]
            local l_status_4, l_result_4 = pcall(require, v89);
            if l_status_4 then
                return l_result_4;
            else
                warn("Weapon Features Hook: Failed to require", v89, "-", l_result_4);
                return nil;
            end;
        end;
        local function v99() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v83 (ref), l_v73_0 (ref), v82 (ref)
            if v83 then
                return true;
            elseif not l_v73_0 or not v82 or not game:GetService("Players").LocalPlayer then
                return false;
            elseif not game:GetService("Players").LocalPlayer.Character then
                return false;
            else
                local l_l_v73_0_Fighter_0 = l_v73_0:GetFighter(game:GetService("Players").LocalPlayer);
                if not l_l_v73_0_Fighter_0 then
                    return false;
                else
                    if not v83 then
                        local v94 = nil;
                        local l_PlayerScripts_0 = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerScripts");
                        if l_PlayerScripts_0 and l_PlayerScripts_0:FindFirstChild("Modules") and l_PlayerScripts_0.Modules:FindFirstChild("ItemTypes") and l_PlayerScripts_0.Modules.ItemTypes:FindFirstChild("Gun") then
                            local l_status_5, l_result_5 = pcall(require, l_PlayerScripts_0.Modules.ItemTypes.Gun);
                            if l_status_5 and type(l_result_5) == "table" and (type(l_result_5.Equip) == "function" or type(l_result_5.StartReloading) == "function") then
                                v94 = l_result_5;
                            end;
                        end;
                        if v94 then
                            v83 = v94;
                        elseif l_l_v73_0_Fighter_0.EquippedItem and l_l_v73_0_Fighter_0.EquippedItem.Info and l_l_v73_0_Fighter_0.EquippedItem.Info.Type == v82.Types.Gun then
                            local v98 = getmetatable(l_l_v73_0_Fighter_0.EquippedItem);
                            if v98 and v98.__index and (type(v98.__index.Equip) == "function" or type(v98.__index.StartReloading) == "function") then
                                v83 = v98.__index;
                            elseif v98 and (type(v98.Equip) == "function" or type(v98.StartReloading) == "function") then
                                v83 = v98;
                            end;
                        end;
                    end;
                    return v83 ~= nil;
                end;
            end;
        end;
        local function v102(v100, ...) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v84 (ref)
            if not v84 then
                warn("Fast Equip Hook: Original missing.");
                return;
            elseif not v100 then
                warn("Fast Equip Hook: 'self' is nil.");
                return v84(v100, ...);
            else
                local v101 = {
                    pcall(v84, v100, ...)
                };
                if not v101[1] then
                    warn("Fast Equip Hook: Error calling original Equip:", v101[2]);
                    return unpack(v101, 2);
                else
                    if v100.ViewModel and type(v100.ViewModel.StopAnimation) == "function" then
                        pcall(v100.ViewModel.StopAnimation, v100.ViewModel, "Equip", 0);
                    end;
                    if v100.ViewModel then
                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v100 (ref)
                            if v100.ViewModel._is_equipping ~= nil then
                                v100.ViewModel._is_equipping = false;
                            end;
                        end);
                    end;
                    return unpack(v101, 2);
                end;
            end;
        end;
        local function v107(v103, v104) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v86 (ref)
            if not v86 then
                warn("Instant Reload Hook: Original missing.");
                return;
            elseif not v103 then
                warn("Instant Reload Hook: 'self' is nil.");
                return v86(v103, v104);
            else
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v103 (ref)
                    if v103._reload_delay then
                        v103._reload_delay = 0;
                    end;
                end);
                local v105 = {
                    pcall(v86, v103, v104)
                };
                if not v105[1] then
                    warn("Instant Reload Hook: Error calling original StartReloading:", v105[2]);
                    return unpack(v105, 2);
                else
                    local v106 = tick() - 1;
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v103 (ref), v106 (ref)
                        if v103._reload_cooldown then
                            v103._reload_cooldown = v106;
                        end;
                    end);
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v103 (ref), v106 (ref)
                        if v103._reload_cancel_expiration then
                            v103._reload_cancel_expiration = v106;
                        end;
                    end);
                    return unpack(v105, 2);
                end;
            end;
        end;
        local function v111() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v83 (ref), v40 (ref), v85 (ref), v84 (ref), v102 (ref), v87 (ref), v86 (ref), v107 (ref)
            if not v83 then
                return false;
            else
                local v108 = false;
                local v109 = false;
                if v40.FastEquip then
                    if not v85 then
                        if type(v83.Equip) == "function" then
                            if not v84 then
                                v84 = v83.Equip;
                            end;
                            v83.Equip = v102;
                            v85 = true;
                            v108 = true;
                        else
                            warn("Fast Equip Hook: Gun.Equip not a function.");
                        end;
                    else
                        v108 = true;
                    end;
                elseif v85 and v84 then
                    v83.Equip = v84;
                    v85 = false;
                end;
                if v40.InstantReload then
                    if not v87 then
                        if type(v83.StartReloading) == "function" then
                            if not v86 then
                                v86 = v83.StartReloading;
                            end;
                            v83.StartReloading = v107;
                            v87 = true;
                            v109 = true;
                        else
                            warn("Instant Reload Hook: Gun.StartReloading not a function.");
                        end;
                    else
                        v109 = true;
                    end;
                elseif v87 and v86 then
                    v83.StartReloading = v86;
                    v87 = false;
                end;
                local v110;
                if not v108 then
                    v110 = v109;
                else
                    v110 = v108;
                end;
                return v110;
            end;
        end;
        local function v118() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v40 (ref), v85 (ref), v87 (ref), v88 (ref), l_RunService_0 (ref), v82 (ref), v92 (ref), l_v73_0 (ref), v99 (ref), v111 (ref), v83 (ref)
            local v112 = v40.FastEquip or v40.InstantReload;
            if not v85 then
                local _ = v87;
            end;
            if v112 and not v88 then
                v88 = l_RunService_0.Stepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v40 (ref), v85 (ref), v87 (ref), v88 (ref), v82 (ref), v92 (ref), l_v73_0 (ref), v99 (ref), v111 (ref)
                    if (not v40.FastEquip or not v85) and v40.InstantReload then
                        local _ = v87;
                    end;
                    local v115 = v40.FastEquip and not v85 or v40.InstantReload and not v87;
                    if not v40.FastEquip and not v40.InstantReload or not v115 then
                        if v88 then
                            v88:Disconnect();
                            v88 = nil;
                        end;
                        return;
                    else
                        if not v82 then
                            local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
                            if l_ReplicatedStorage_0 and l_ReplicatedStorage_0:FindFirstChild("Modules") then
                                v82 = v92(l_ReplicatedStorage_0.Modules.ItemLibrary);
                            end;
                        end;
                        if not l_v73_0 then
                            local l_LocalPlayer_2 = game:GetService("Players").LocalPlayer;
                            if l_LocalPlayer_2 and l_LocalPlayer_2:FindFirstChild("PlayerScripts") and l_LocalPlayer_2.PlayerScripts:FindFirstChild("Controllers") then
                                l_v73_0 = v92(l_LocalPlayer_2.PlayerScripts.Controllers.FighterController);
                            end;
                        end;
                        if v82 and l_v73_0 and v99() then
                            v111();
                        end;
                        return;
                    end;
                end);
            elseif not v112 and v88 then
                v88:Disconnect();
                v88 = nil;
                if v83 then
                    v111();
                end;
            end;
        end;
        v40.FastEquip = v37.FastEquip or false;
        v72:AddToggle("FastEquip", {
            Title = "Fast Equip", 
            Description = "Instantly equip weapons with no animation delay [ SOLARA AND XENO UNSUPPORTED ]", 
            Default = v40.FastEquip
        }):OnChanged(function(v119) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v40 (ref), v99 (ref), v111 (ref), v118 (ref), v50 (ref), v31 (ref)
            v40.FastEquip = v119;
            if v99() then
                v111();
            end;
            v118();
            if v119 then
                v50:Notify({
                    Title = "Fast Equip Enabled", 
                    Content = "Equip animations will be skipped", 
                    Duration = 2
                });
            else
                v50:Notify({
                    Title = "Fast Equip Disabled", 
                    Content = "Equip animations restored", 
                    Duration = 2
                });
            end;
            v31:ExportSettings();
        end);
        v40.InstantReload = v37.InstantReload or false;
        v72:AddToggle("InstantReload", {
            Title = "Instant Reload", 
            Description = "Bypass reload delay for faster shooting [ SOLARA AAND XENO UNSUPPORTED ]", 
            Default = v40.InstantReload
        }):OnChanged(function(v120) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v40 (ref), v99 (ref), v111 (ref), v118 (ref), v50 (ref), v31 (ref)
            v40.InstantReload = v120;
            if v99() then
                v111();
            end;
            v118();
            if v120 then
                v50:Notify({
                    Title = "Instant Reload Enabled", 
                    Content = "Reload delays will be bypassed", 
                    Duration = 2
                });
            else
                v50:Notify({
                    Title = "Instant Reload Disabled", 
                    Content = "Reload delays restored", 
                    Duration = 2
                });
            end;
            v31:ExportSettings();
        end);
        v118();
        local v121 = l_v50_0.Misc:AddSection("Other");
        v121:AddButton({
            Title = "Claim all rewards", 
            Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                local l_Data_0 = game:GetService("ReplicatedStorage").Remotes.Data;
                l_Data_0.ClaimLikeReward:FireServer();
                l_Data_0.ClaimFavoriteReward:FireServer();
                l_Data_0.ClaimNotificationsReward:FireServer();
                l_Data_0.ClaimWelcomeBackGift:FireServer();
            end
        });
        v121:AddButton({
            Title = "Claim all codes", 
            Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                local l_Data_1 = game:GetService("ReplicatedStorage").Remotes.Data;
                l_Data_1.VerifyTwitter:FireServer();
                for _, v125 in ipairs({
                    "5B_VISITS_WHATTTTTT", 
                    "FREE83"
                }) do
                    l_Data_1.RedeemCode:InvokeServer(v125);
                end;
            end
        });
        local v126 = l_v50_0.Aimbot:AddSection("Aimbot");
        v126:AddToggle("Aimbot", {
            Title = "Aimbot", 
            Description = "Toggles the Aimbot", 
            Default = v40.Aimbot
        }):OnChanged(function(v127) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v40 (ref), v43 (ref), v54 (ref)
            v40.Aimbot = v127;
            if not v43 then
                v54 = v127;
            end;
        end);
        v126:AddSlider("MaxTrackingDistance", {
            Title = "Max Tracking Distance", 
            Description = "Sets the maximum distance the aimbot can track (in studs)", 
            Default = v40.MaxTrackingDistance, 
            Min = 1, 
            Max = 5000, 
            Rounding = 1, 
            Callback = function(v128) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref)
                v40.MaxTrackingDistance = v128;
            end
        });
        if v43 then
            v126:AddToggle("OnePressAimingMode", {
                Title = "One-Press Mode", 
                Description = "Uses the One-Press Mode instead of the Holding Mode", 
                Default = v40.OnePressAimingMode
            }):OnChanged(function(v129) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref)
                v40.OnePressAimingMode = v129;
            end);
            local v131 = v126:AddKeybind("AimKey", {
                Title = "Aim Key", 
                Description = "Changes the Aim Key", 
                Default = v40.AimKey, 
                ChangedCallback = function(v130) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v40 (ref)
                    v40.AimKey = v130;
                end
            });
            v40.AimKey = v131.Value ~= "RMB" and Enum.KeyCode[v131.Value] or Enum.UserInputType.MouseButton2;
        end;
        local v133 = v126:AddDropdown("AimMode", {
            Title = "Aim Mode", 
            Description = "Changes the Aim Mode", 
            Values = {
                "Camera"
            }, 
            Default = v40.AimMode, 
            Callback = function(v132) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref)
                v40.AimMode = v132;
            end
        });
        if getfenv().mousemoverel and v43 then
            table.insert(v133.Values, "Mouse");
            v133:BuildDropdownList();
        else
            v51 = true;
        end;
        local v135 = v126:AddToggle("SilentAim", {
            Title = "Silent Aim", 
            Description = "Toggle silent aim (Spam Click)", 
            Default = v40.SilentAim, 
            Callback = function(v134) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v5 (ref), v40 (ref), v6 (ref)
                v5 = v134;
                v40.SilentAim = v134;
                getgenv().SilentAimEnabled = v134;
                if v134 then
                    if not v6 then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/EndOverdosing/Luasec-API/refs/heads/main/rivals-modern/silent-aim.lua", true))();
                        v6 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v5 (ref)
                            getgenv().SilentAimEnabled = v5;
                        end);
                    else
                        getgenv().SilentAimEnabled = true;
                    end;
                else
                    getgenv().SilentAimEnabled = false;
                end;
            end
        });
        local function _() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            getgenv().SilentAimEnabled = false;
        end;
        local l_Players_2 = game:GetService("Players");
        local l_RunService_1 = game:GetService("RunService");
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_UserInputService_2 = game:GetService("UserInputService");
        local l_LocalPlayer_3 = l_Players_2.LocalPlayer;
        local l_l_LocalPlayer_3_Mouse_0 = l_LocalPlayer_3:GetMouse();
        local v143 = true;
        getgenv().RagebotEnabled = false;
        local v144 = nil;
        local v145 = nil;
        local v146 = 0.01;
        local function _() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_UserInputService_2 (ref)
            return l_UserInputService_2:GetFocusedTextBox() == nil;
        end;
        local function v148() --[[ Line: 0 ]] --[[ Name:  ]]
            return false;
        end;
        local function v150(v149) --[[ Line: 0 ]] --[[ Name:  ]]
            return v149.Character and v149.Character:FindFirstChild("HumanoidRootPart") and v149.Character.HumanoidRootPart:FindFirstChild("TeammateLabel");
        end;
        local function v153(v151) --[[ Line: 0 ]] --[[ Name:  ]]
            if not v151.Character then
                return false;
            else
                local l_Humanoid_0 = v151.Character:FindFirstChild("Humanoid");
                return l_Humanoid_0 and l_Humanoid_0.Health > 0;
            end;
        end;
        local function v160(v154, v155) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_LocalPlayer_3 (ref)
            local l_Position_0 = v155.Position;
            local v157 = (v154.Position - l_Position_0).Unit * 1000;
            local v158 = RaycastParams.new();
            v158.FilterType = Enum.RaycastFilterType.Blacklist;
            v158.FilterDescendantsInstances = {
                l_LocalPlayer_3.Character
            };
            local v159 = workspace:Raycast(l_Position_0, v157, v158);
            return v159 and v159.Instance and v159.Instance:IsDescendantOf(v154.Parent);
        end;
        local function v162(v161) --[[ Line: 0 ]] --[[ Name:  ]]
            return v161.Character and v161.Character:FindFirstChildOfClass("ForceField") ~= nil;
        end;
        local function v169() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_Players_2 (ref), l_LocalPlayer_3 (ref), v153 (ref), v143 (ref), v150 (ref), l_CurrentCamera_0 (ref)
            local v163 = nil;
            local l_huge_0 = math.huge;
            for _, v166 in ipairs(l_Players_2:GetPlayers()) do
                if v166 ~= l_LocalPlayer_3 and v153(v166) and (not v143 or not v150(v166)) then
                    local l_Character_0 = v166.Character;
                    if l_Character_0 and l_Character_0:FindFirstChild("Head") then
                        local l_Magnitude_0 = (l_Character_0.Head.Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
                        if l_Magnitude_0 < l_huge_0 then
                            v163 = v166;
                            l_huge_0 = l_Magnitude_0;
                        end;
                    end;
                end;
            end;
            return v163;
        end;
        local v170 = Functions or {
            antikatana = function() --[[ Line: 0 ]] --[[ Name:  ]]
                return false;
            end
        };
        l_l_LocalPlayer_3_Mouse_0.Button1Down:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v169 (ref), v162 (ref), v160 (ref), l_LocalPlayer_3 (ref), v145 (ref)
            if getgenv().RagebotEnabled then
                local v171 = v169();
                if v171 and v171.Character and v171.Character:FindFirstChild("Head") and not v162(v171) then
                    local l_Head_0 = v171.Character.Head;
                    if v160(l_Head_0, l_LocalPlayer_3.Character.HumanoidRootPart) then
                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, l_Head_0.Position);
                        v145 = workspace.CurrentCamera.CFrame;
                    end;
                end;
            end;
        end);
        l_l_LocalPlayer_3_Mouse_0.Button1Up:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v145 (ref)
            if getgenv().RagebotEnabled and v145 then
                workspace.CurrentCamera.CFrame = v145;
            end;
        end);
        local function v174() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v144 (ref), l_RunService_1 (ref), v170 (ref), v169 (ref), v162 (ref), v160 (ref), l_LocalPlayer_3 (ref), v148 (ref), v146 (ref)
            if v144 then
                v144:Disconnect();
            end;
            v144 = l_RunService_1.RenderStepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v170 (ref), v169 (ref), v162 (ref), v160 (ref), l_LocalPlayer_3 (ref), v148 (ref), v146 (ref)
                if not v170:antikatana() then
                    local v173 = v169();
                    if getgenv().RagebotEnabled and v173 and v173.Character and v173.Character:FindFirstChild("Head") and not v162(v173) and v160(v173.Character.Head, l_LocalPlayer_3.Character.HumanoidRootPart) and not v148() then
                        mouse1click();
                        task.wait(v146);
                    end;
                end;
            end);
        end;
        local v175 = v40 or {
            RageBot = false
        };
        local v176 = getgenv or function() --[[ Line: 0 ]] --[[ Name:  ]]
            return _G;
        end;
        if v176().RagebotEnabled == nil then
            v176().RagebotEnabled = false;
        end;
        local v177 = v126 or {};
        local v179 = v177:AddToggle("RageBot", {
            Title = "Rage Bot", 
            Description = "Toggle rage bot (auto target and click)", 
            Default = v175.RageBot, 
            Callback = function(v178) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v176 (ref), v175 (ref), v174 (ref), v144 (ref)
                v176().RagebotEnabled = v178;
                v175.RageBot = v178;
                if v178 then
                    v174();
                elseif v144 then
                    v144:Disconnect();
                    v144 = nil;
                end;
            end
        });
        v177:AddKeybind("RageBotKeybind", {
            Title = "Rage Bot Keybind", 
            Description = "Press key to toggle Rage Bot", 
            Default = "Y", 
            Mode = "Toggle", 
            Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v179 (ref), v176 (ref)
                v179:SetValue(not v176().RagebotEnabled);
            end
        });
        if v175.RageBot and v179 and v179.Set then
            local v180 = "Set";
            local l_v179_0 = v179;
            v179[v180](l_v179_0, v175.RageBot);
        end;
        v177:AddToggle("OffAimbotAfterKill", {
            Title = "Off After Kill", 
            Description = "Disables the Aiming Mode after killing a Target", 
            Default = v175.OffAimbotAfterKill
        }):OnChanged(function(v182) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.OffAimbotAfterKill = v182;
        end);
        local _ = v177:AddDropdown("AimPart", {
            Title = "Aim Part", 
            Description = "Changes the Aim Part", 
            Values = v175.AimPartDropdownValues, 
            Default = v175.AimPart, 
            Callback = function(v183) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.AimPart = v183;
            end
        });
        v177:AddToggle("RandomAimPart", {
            Title = "Random Aim Part", 
            Description = "Selects every second a Random Aim Part from Dropdown", 
            Default = v175.RandomAimPart
        }):OnChanged(function(v185) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.RandomAimPart = v185;
        end);
        local v186 = l_v50_0.Aimbot:AddSection("Sensitivity");
        v186:AddToggle("UseSensitivity", {
            Title = "Use Sensitivity", 
            Description = "Toggles the Sensitivity", 
            Default = v175.UseSensitivity
        }):OnChanged(function(v187) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.UseSensitivity = v187;
        end);
        v186:AddSlider("Sensitivity", {
            Title = "Sensitivity", 
            Description = "Smoothes out the Mouse / Camera Movements when Aiming", 
            Default = v175.Sensitivity, 
            Min = 1, 
            Max = 100, 
            Rounding = 1, 
            Callback = function(v188) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.Sensitivity = v188;
            end
        });
        task.wait(0.1);
        l_v50_0.Bots = l_l_CreateWindow_0_0:AddTab({
            Title = "Bots", 
            Icon = "bot"
        });
        task.wait(0.1);
        l_v50_0.Bots:AddParagraph({
            Title = string.format("%s   ", string.format(v44[os.date("*t").month], "Luasec")), 
            Content = "Luasec\nhttps://discord.gg/luasec"
        });
        if getfenv().mouse1click and v43 then
            local v189 = l_v50_0.Bots:AddSection("TriggerBot");
            v189:AddToggle("TriggerBot", {
                Title = "TriggerBot", 
                Description = "Toggles the TriggerBot", 
                Default = v175.TriggerBot
            }):OnChanged(function(v190) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.TriggerBot = v190;
            end);
            v189:AddToggle("OnePressTriggeringMode", {
                Title = "One-Press Mode", 
                Description = "Uses the One-Press Mode instead of the Holding Mode", 
                Default = v175.OnePressTriggeringMode
            }):OnChanged(function(v191) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.OnePressTriggeringMode = v191;
            end);
            v189:AddToggle("SmartTriggerBot", {
                Title = "Smart TriggerBot", 
                Description = "Uses the TriggerBot only when Aiming", 
                Default = v175.SmartTriggerBot
            }):OnChanged(function(v192) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.SmartTriggerBot = v192;
            end);
            local v194 = v189:AddKeybind("TriggerKey", {
                Title = "Trigger Key", 
                Description = "Changes the Trigger Key", 
                Default = v175.TriggerKey, 
                ChangedCallback = function(v193) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref)
                    v175.TriggerKey = v193;
                end
            });
            v175.TriggerKey = v194.Value ~= "RMB" and Enum.KeyCode[v194.Value] or Enum.UserInputType.MouseButton2;
            v189:AddSlider("TriggerBotChance", {
                Title = "TriggerBot Chance", 
                Description = "Changes the Hit Chance for TriggerBot", 
                Default = v175.TriggerBotChance, 
                Min = 1, 
                Max = 100, 
                Rounding = 1, 
                Callback = function(v195) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref)
                    v175.TriggerBotChance = v195;
                end
            });
            v189:AddSlider("TriggerBotDelay", {
                Title = "Click Delay (seconds)", 
                Description = "Delay between triggerbot clicks", 
                Default = v175.TriggerBotDelay, 
                Min = 0, 
                Max = 5, 
                Rounding = 1, 
                Callback = function(v196) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref)
                    v175.TriggerBotDelay = v196;
                end
            });
        else
            v51 = true;
        end;
        task.wait(0.1);
        l_v50_0.Checks = l_l_CreateWindow_0_0:AddTab({
            Title = "Checks", 
            Icon = "list-checks"
        });
        task.wait(0.1);
        l_v50_0.Checks:AddParagraph({
            Title = string.format("%s   ", string.format(v44[os.date("*t").month], "Luasec")), 
            Content = "Luasec\nhttps://discord.gg/luasec"
        });
        local v197 = l_v50_0.Checks:AddSection("Simple Checks");
        v197:AddToggle("AliveCheck", {
            Title = "Alive Check", 
            Description = "Toggles the Alive Check", 
            Default = v175.AliveCheck
        }):OnChanged(function(v198) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.AliveCheck = v198;
        end);
        v197:AddToggle("GodCheck", {
            Title = "God Check", 
            Description = "Toggles the God Check", 
            Default = v175.GodCheck
        }):OnChanged(function(v199) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.GodCheck = v199;
        end);
        v197:AddToggle("TeamCheck", {
            Title = "Team Check", 
            Description = "Toggles the Team Check", 
            Default = v175.TeamCheck
        }):OnChanged(function(v200) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.TeamCheck = v200;
        end);
        v197:AddToggle("FriendCheck", {
            Title = "Friend Check", 
            Description = "Toggles the Friend Check", 
            Default = v175.FriendCheck
        }):OnChanged(function(v201) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.FriendCheck = v201;
        end);
        v197:AddToggle("FollowCheck", {
            Title = "Follow Check", 
            Description = "Toggles the Follow Check", 
            Default = v175.FollowCheck
        }):OnChanged(function(v202) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.FollowCheck = v202;
        end);
        v197:AddToggle("VerifiedBadgeCheck", {
            Title = "Verified Badge Check", 
            Description = "Toggles the Verified Badge Check", 
            Default = v175.VerifiedBadgeCheck
        }):OnChanged(function(v203) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.VerifiedBadgeCheck = v203;
        end);
        v197:AddToggle("WallCheck", {
            Title = "Wall Check", 
            Description = "Toggles the Wall Check", 
            Default = v175.WallCheck
        }):OnChanged(function(v204) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.WallCheck = v204;
        end);
        local v205 = l_v50_0.Checks:AddSection("Advanced Checks");
        v205:AddToggle("FoVCheck", {
            Title = "FoV Check", 
            Description = "Toggles the FoV Check", 
            Default = v175.FoVCheck
        }):OnChanged(function(v206) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.FoVCheck = v206;
        end);
        v205:AddSlider("FoVRadius", {
            Title = "FoV Radius", 
            Description = "Changes the FoV Radius", 
            Default = v175.FoVRadius, 
            Min = 10, 
            Max = 1000, 
            Rounding = 1, 
            Callback = function(v207) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.FoVRadius = v207;
            end
        });
        v205:AddToggle("MagnitudeCheck", {
            Title = "Magnitude Check", 
            Description = "Toggles the Magnitude Check", 
            Default = v175.MagnitudeCheck
        }):OnChanged(function(v208) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.MagnitudeCheck = v208;
        end);
        v205:AddSlider("TriggerMagnitude", {
            Title = "Trigger Magnitude", 
            Description = "Distance between the Native and the Target Character", 
            Default = v175.TriggerMagnitude, 
            Min = 10, 
            Max = 1000, 
            Rounding = 1, 
            Callback = function(v209) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.TriggerMagnitude = v209;
            end
        });
        v205:AddToggle("WhitelistedGroupCheck", {
            Title = "Whitelisted Group Check", 
            Description = "Toggles the Whitelisted Group Check", 
            Default = v175.WhitelistedGroupCheck
        }):OnChanged(function(v210) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.WhitelistedGroupCheck = v210;
        end);
        v205:AddInput("WhitelistedGroup", {
            Title = "Whitelisted Group", 
            Description = "After typing, press Enter", 
            Default = v175.WhitelistedGroup, 
            Numeric = true, 
            Finished = true, 
            Placeholder = "Group Id", 
            Callback = function(v211) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.WhitelistedGroup = #tostring(v211) > 0 and tonumber(v211) or 0;
            end
        });
        v205:AddToggle("BlacklistedGroupCheck", {
            Title = "Blacklisted Group Check", 
            Description = "Toggles the Blacklisted Group Check", 
            Default = v175.BlacklistedGroupCheck
        }):OnChanged(function(v212) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.BlacklistedGroupCheck = v212;
        end);
        v205:AddInput("BlacklistedGroup", {
            Title = "Blacklisted Group", 
            Description = "After typing, press Enter", 
            Default = v175.BlacklistedGroup, 
            Numeric = true, 
            Finished = true, 
            Placeholder = "Group Id", 
            Callback = function(v213) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref)
                v175.BlacklistedGroup = #tostring(v213) > 0 and tonumber(v213) or 0;
            end
        });
        local v214 = {
            "Swift", 
            "Wave", 
            "Velocity", 
            "Potassium", 
            "Ascendant", 
            "Sirhurt", 
            "Seliware", 
            "AWP"
        };
        local function v218() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v214 (ref)
            local v215 = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "Unknown";
            for _, v217 in ipairs(v214) do
                if string.find(v215, v217) then
                    return true;
                end;
            end;
            return false;
        end;
        local v219 = l_v50_0.Checks:AddSection("Anti-Katana");
        v175.AntiKatana = v37.AntiKatana or false;
        v175.AntiKatanaSound = v37.AntiKatanaSound or true;
        v176().DeflectingEnemies = v176().DeflectingEnemies or {};
        v176().isDeflectSoundPlaying = v176().isDeflectSoundPlaying or false;
        v176().currentDeflectSound = v176().currentDeflectSound or nil;
        local v220 = v219:AddToggle("AntiKatana", {
            Title = "Anti-Katana", 
            Description = "Blocks shots when enemy katana users are deflecting [ XENO AND SOLARA NOT SUPPORTED]", 
            Default = v175.AntiKatana
        });
        v220:OnChanged(function(v221) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v218 (ref), v176 (ref), v50 (ref), v220 (ref)
            v175.AntiKatana = v221;
            if v221 and v218() then
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v176 (ref), v175 (ref), v50 (ref)
                    local l_Players_3 = game:GetService("Players");
                    local _ = game:GetService("ReplicatedStorage");
                    local l_RunService_2 = game:GetService("RunService");
                    local v225 = nil;
                    local v226 = nil;
                    local l_LocalPlayer_4 = l_Players_3.LocalPlayer;
                    local v228 = nil;
                    local v229 = nil;
                    local v230 = nil;
                    local v231 = nil;
                    local v232 = false;
                    local v233 = false;
                    v176().DeflectingEnemies = v176().DeflectingEnemies or {};
                    local function v237(v234) --[[ Line: 0 ]] --[[ Name:  ]]
                        local l_status_6, l_result_6 = pcall(require, v234);
                        if l_status_6 then
                            return l_result_6;
                        else
                            warn("Anti-Katana: Failed to require", v234, "-", l_result_6);
                            return nil;
                        end;
                    end;
                    local function v242() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v229 (ref), l_LocalPlayer_4 (ref), v226 (ref), v237 (ref)
                        if v229 then
                            return true;
                        else
                            local l_PlayerScripts_1 = l_LocalPlayer_4:FindFirstChild("PlayerScripts");
                            if l_PlayerScripts_1 then
                                local l_Modules_0 = l_PlayerScripts_1:FindFirstChild("Modules");
                                if l_Modules_0 then
                                    local l_ItemTypes_0 = l_Modules_0:FindFirstChild("ItemTypes");
                                    if l_ItemTypes_0 then
                                        local l_Gun_0 = l_ItemTypes_0:FindFirstChild("Gun");
                                        if l_Gun_0 then
                                            v226 = v237(l_Gun_0);
                                            if v226 and type(v226) == "table" and type(v226.StartShooting) == "function" then
                                                v229 = v226;
                                                return true;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            return false;
                        end;
                    end;
                    local function v244() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v228 (ref), v225 (ref)
                        if v228 then
                            return v228;
                        elseif not v225 then
                            return nil;
                        elseif type(v225) == "table" and type(v225.ReplicateFromServer) == "function" then
                            v228 = v225;
                            return v228;
                        else
                            local v243 = getmetatable(v225);
                            if v243 and v243.__index and type(v243.__index.ReplicateFromServer) == "function" then
                                v228 = v243.__index;
                                return v228;
                            else
                                warn("Anti-Katana: Could not find ReplicateFromServer function in required Katana module or its metatable.");
                                return nil;
                            end;
                        end;
                    end;
                    local function v251(v245, ...) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v231 (ref), v176 (ref), v175 (ref)
                        if not v245 or not v231 then
                            warn("Gun Hook: Invalid context or original function lost.");
                            return v231 and v231(v245, ...) or nil;
                        else
                            local v246 = false;
                            local v247 = tick();
                            for _, v249 in pairs(v176().DeflectingEnemies) do
                                if v247 < v249 then
                                    v246 = true;
                                    if v175.AntiKatanaSound and not v176().isDeflectSoundPlaying and v245 and type(v245.CreateSound) == "function" then
                                        local l_v245_Sound_0 = v245:CreateSound("rbxassetid://1848354536", 0.6, 1, true, 1);
                                        if l_v245_Sound_0 then
                                            l_v245_Sound_0.Looped = true;
                                            l_v245_Sound_0:Play();
                                            v176().currentDeflectSound = l_v245_Sound_0;
                                            v176().isDeflectSoundPlaying = true;
                                        end;
                                    end;
                                    return false;
                                end;
                            end;
                            if not v246 and v176().isDeflectSoundPlaying then
                                if v176().currentDeflectSound then
                                    v176().currentDeflectSound:Stop();
                                    v176().currentDeflectSound:Destroy();
                                    v176().currentDeflectSound = nil;
                                end;
                                v176().isDeflectSoundPlaying = false;
                            end;
                            if not v246 then
                                return v231(v245, ...);
                            else
                                return;
                            end;
                        end;
                    end;
                    local function v260(v252, v253, ...) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v230 (ref), v176 (ref)
                        if not v252 or not v252.ClientFighter or not v252.Info or not v230 then
                            warn("Anti-Katana Hook: Invalid context or original function lost.");
                            if v230 then
                                return v230(v252, v253, ...);
                            else
                                return;
                            end;
                        elseif v252.Name == "Katana" and not v252.ClientFighter.IsLocalPlayer and v253 == "StartAiming" then
                            local l_ClientFighter_0 = v252.ClientFighter;
                            local l_Player_0 = l_ClientFighter_0.Player;
                            local v256 = l_Player_0 and l_Player_0.UserId or l_ClientFighter_0:Get("ObjectID");
                            if v256 then
                                local v257 = v252.Info.DeflectDuration or 1;
                                local v258 = tick() + v257 + 0.1;
                                v176().DeflectingEnemies[v256] = v258;
                                do
                                    local l_v258_0 = v258;
                                    task.delay(v257 + 0.15, function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v176 (ref), v256 (ref), l_v258_0 (ref)
                                        if v176().DeflectingEnemies and v176().DeflectingEnemies[v256] == l_v258_0 then
                                            v176().DeflectingEnemies[v256] = nil;
                                        end;
                                    end);
                                end;
                            else
                                warn("Anti-Katana: Could not get enemy ID for deflecting Katana user.");
                            end;
                            return v230(v252, v253, ...);
                        elseif v252.Name == "Katana" and not v252.ClientFighter.IsLocalPlayer and v253 == "DeflectHit" then
                            return;
                        else
                            return v230(v252, v253, ...);
                        end;
                    end;
                    local function v262() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v232 (ref), v244 (ref), v230 (ref), v260 (ref)
                        if v232 then
                            return true;
                        else
                            local v261 = v244();
                            if not v261 then
                                return false;
                            elseif not v230 then
                                if type(v261.ReplicateFromServer) ~= "function" then
                                    warn("Anti-Katana: Cannot hook! katanaClass.ReplicateFromServer is not a function, it is a", type(v261.ReplicateFromServer));
                                    return false;
                                else
                                    v230 = v261.ReplicateFromServer;
                                    if not v230 then
                                        warn("Anti-Katana: FAILED TO STORE ORIGINAL FUNCTION (it's nil after assignment)!");
                                        return false;
                                    else
                                        v261.ReplicateFromServer = v260;
                                        v232 = true;
                                        return true;
                                    end;
                                end;
                            else
                                return false;
                            end;
                        end;
                    end;
                    local function v263() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v233 (ref), v242 (ref), v231 (ref), v229 (ref), v251 (ref)
                        if v233 then
                            return true;
                        elseif v242() and not v231 then
                            if type(v229.StartShooting) ~= "function" then
                                warn("Gun Hook: Cannot hook! Gun.StartShooting is not a function");
                                return false;
                            else
                                v231 = v229.StartShooting;
                                v229.StartShooting = v251;
                                v233 = true;
                                return true;
                            end;
                        else
                            return false;
                        end;
                    end;
                    local v264 = nil;
                    v264 = l_RunService_2.Stepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v232 (ref), v233 (ref), v264 (ref), v225 (ref), l_LocalPlayer_4 (ref), v237 (ref), v262 (ref), v263 (ref)
                        if v232 and v233 then
                            v264:Disconnect();
                            return;
                        else
                            if not v225 then
                                local l_PlayerScripts_2 = l_LocalPlayer_4:FindFirstChild("PlayerScripts");
                                if l_PlayerScripts_2 then
                                    local l_Modules_1 = l_PlayerScripts_2:FindFirstChild("Modules");
                                    if l_Modules_1 then
                                        local l_Items_0 = l_Modules_1:FindFirstChild("Items");
                                        if l_Items_0 then
                                            local l_Katana_0 = l_Items_0:FindFirstChild("Katana");
                                            if l_Katana_0 then
                                                v225 = v237(l_Katana_0);
                                            else
                                                warn("Anti-Katana: Katana script not found in PlayerScripts.Modules.Items.");
                                            end;
                                        else
                                            warn("Anti-Katana: Items folder not found in PlayerScripts.Modules.");
                                        end;
                                    else
                                        warn("Anti-Katana: Modules folder not found in PlayerScripts.");
                                    end;
                                end;
                            end;
                            if v225 then
                                v262();
                            end;
                            if not v233 then
                                v263();
                            end;
                            return;
                        end;
                    end);
                    v50:Notify({
                        Title = "Anti-Katana Enabled", 
                        Content = "Now blocking shots when enemies use katana deflect", 
                        Duration = 2
                    });
                end);
            elseif not v218() and v221 then
                v220:SetValue(false);
                v50:Notify({
                    Title = "Executor Not Supported", 
                    Content = "This feature requires a supported executor", 
                    Duration = 3
                });
            end;
        end);
        v219:AddToggle("AntiKatanaSound", {
            Title = "Deflect Sound", 
            Description = "Plays sound when shots are blocked by katana deflect", 
            Default = v175.AntiKatanaSound
        }):OnChanged(function(v269) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref)
            v175.AntiKatanaSound = v269;
        end);
        local v270 = l_v50_0.Misc:AddSection("Inventory Viewer");
        v175.InventoryViewer = v37.InventoryViewer or false;
        local v271 = v270:AddToggle("InventoryViewer", {
            Title = "Inventory Viewer", 
            Description = "Shows enemy inventory with equipped items [ SOLARA AND XENO UNSUPPORTED ]", 
            Default = v175.InventoryViewer
        });
        v271:OnChanged(function(v272) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v218 (ref), v176 (ref), v50 (ref), v271 (ref)
            v175.InventoryViewer = v272;
            if v272 and v218() then
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v176 (ref), v272 (ref), v50 (ref)
                    print("Setting up Billboard Inventory Display...");
                    local l_Players_4 = game:GetService("Players");
                    local l_ReplicatedStorage_2 = game:GetService("ReplicatedStorage");
                    local l_RunService_3 = game:GetService("RunService");
                    local v276 = v176().MaxDisplaySlots or 5;
                    local v277 = "InventoryBillboard";
                    local v278 = UDim2.new(0, 50, 0, 50);
                    local v279 = UDim.new(0, 6);
                    local v280 = Color3.fromRGB(255, 255, 0);
                    local v281 = 2;
                    local v282 = Color3.fromRGB(255, 255, 255);
                    local v283 = 0.8;
                    local v284 = UDim.new(0.2, 0);
                    local v285 = nil;
                    local v286 = nil;
                    local l_LocalPlayer_5 = l_Players_4.LocalPlayer;
                    local function v291(v288) --[[ Line: 0 ]] --[[ Name:  ]]
                        local l_status_7, l_result_7 = pcall(require, v288);
                        if l_status_7 then
                            return l_result_7;
                        else
                            warn("Billboard Display: Failed to require", v288, "-", l_result_7);
                            return nil;
                        end;
                    end;
                    local function v304() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_Players_4 (ref)
                        local v292 = nil;
                        local l_huge_1 = math.huge;
                        local l_Character_1 = l_Players_4.LocalPlayer.Character;
                        local l_CurrentCamera_1 = workspace.CurrentCamera;
                        if not l_Character_1 or not l_Character_1:FindFirstChild("HumanoidRootPart") then
                            return nil;
                        else
                            local _ = l_Character_1.HumanoidRootPart;
                            for _, v298 in l_Players_4:GetPlayers() do
                                if v298 ~= l_Players_4.LocalPlayer and v298.Character and v298.Character:FindFirstChild("HumanoidRootPart") then
                                    local l_Character_2 = v298.Character;
                                    local v300 = l_Character_2:FindFirstChild("Head") or l_Character_2:FindFirstChild("HumanoidRootPart");
                                    if v300 then
                                        local v301, v302 = l_CurrentCamera_1:WorldToViewportPoint(v300.Position);
                                        if v302 then
                                            local l_Magnitude_1 = (Vector2.new(l_CurrentCamera_1.ViewportSize.X / 2, l_CurrentCamera_1.ViewportSize.Y / 2) - Vector2.new(v301.X, v301.Y)).Magnitude;
                                            if l_Magnitude_1 < l_huge_1 then
                                                v292 = l_Character_2;
                                                l_huge_1 = l_Magnitude_1;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            return v292;
                        end;
                    end;
                    if not v285 then
                        v285 = v291(l_LocalPlayer_5.PlayerScripts.Controllers.FighterController);
                    end;
                    if not v286 then
                        v286 = v291(l_ReplicatedStorage_2.Modules.ItemLibrary);
                    end;
                    local v305 = {};
                    local function v316(v306) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v277 (ref), v278 (ref), v279 (ref), v276 (ref), v282 (ref), v283 (ref), v284 (ref), v280 (ref), v281 (ref), v305 (ref)
                        if not v306 or not v306:FindFirstChild("Head") then
                            return nil;
                        else
                            local l_Head_1 = v306.Head;
                            local l_l_Head_1_FirstChild_0 = l_Head_1:FindFirstChild(v277);
                            if l_l_Head_1_FirstChild_0 then
                                l_l_Head_1_FirstChild_0.Enabled = true;
                                return l_l_Head_1_FirstChild_0;
                            else
                                local l_BillboardGui_0 = Instance.new("BillboardGui");
                                l_BillboardGui_0.Name = v277;
                                l_BillboardGui_0.Adornee = l_Head_1;
                                l_BillboardGui_0.Size = UDim2.new(0, (v278.X.Offset + v279.Offset) * v276, 0, v278.Y.Offset + 10);
                                l_BillboardGui_0.StudsOffset = Vector3.new(0, 2.5, 0);
                                l_BillboardGui_0.AlwaysOnTop = true;
                                l_BillboardGui_0.LightInfluence = 0;
                                l_BillboardGui_0.ResetOnSpawn = false;
                                l_BillboardGui_0.Enabled = true;
                                local l_Frame_0 = Instance.new("Frame");
                                l_Frame_0.Name = "Container";
                                l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
                                l_Frame_0.BackgroundTransparency = 1;
                                l_Frame_0.Parent = l_BillboardGui_0;
                                local l_UIListLayout_0 = Instance.new("UIListLayout");
                                l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
                                l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                                l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
                                l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
                                l_UIListLayout_0.Padding = v279;
                                l_UIListLayout_0.Parent = l_Frame_0;
                                for v312 = 1, v276 do
                                    local l_ImageLabel_0 = Instance.new("ImageLabel");
                                    l_ImageLabel_0.Name = "Slot_" .. v312;
                                    l_ImageLabel_0.Size = v278;
                                    l_ImageLabel_0.BackgroundColor3 = v282;
                                    l_ImageLabel_0.BackgroundTransparency = v283;
                                    l_ImageLabel_0.Image = "";
                                    l_ImageLabel_0.Visible = false;
                                    l_ImageLabel_0.LayoutOrder = v312;
                                    l_ImageLabel_0.Parent = l_Frame_0;
                                    local l_UICorner_0 = Instance.new("UICorner");
                                    l_UICorner_0.CornerRadius = v284;
                                    l_UICorner_0.Parent = l_ImageLabel_0;
                                    local l_UIStroke_0 = Instance.new("UIStroke");
                                    l_UIStroke_0.Name = "Highlight";
                                    l_UIStroke_0.Color = v280;
                                    l_UIStroke_0.Thickness = v281;
                                    l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                                    l_UIStroke_0.Enabled = false;
                                    l_UIStroke_0.Parent = l_ImageLabel_0;
                                end;
                                l_BillboardGui_0.Parent = l_Head_1;
                                v305[v306] = l_BillboardGui_0;
                                print("Created Billboard for", v306.Name);
                                return l_BillboardGui_0;
                            end;
                        end;
                    end;
                    local function v319() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v305 (ref)
                        print("Cleaning up inventory billboards...");
                        for _, v318 in pairs(v305) do
                            if v318 and v318.Parent then
                                v318:Destroy();
                            end;
                        end;
                        v305 = {};
                    end;
                    local v320 = nil;
                    local v353 = l_RunService_3.Stepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v272 (ref), v319 (ref), v286 (ref), v291 (ref), l_ReplicatedStorage_2 (ref), v285 (ref), l_LocalPlayer_5 (ref), v304 (ref), v320 (ref), v305 (ref), l_Players_4 (ref), v316 (ref), v276 (ref)
                        if not v272 then
                            inventoryUpdateConnection:Disconnect();
                            v319();
                            return;
                        else
                            if not v286 or type(v286) ~= "table" then
                                v286 = v291(l_ReplicatedStorage_2.Modules.ItemLibrary);
                                if not v286 then
                                    return;
                                end;
                            end;
                            if not v285 or type(v285) ~= "table" then
                                v285 = v291(l_LocalPlayer_5.PlayerScripts.Controllers.FighterController);
                                if not v285 then
                                    return;
                                end;
                            end;
                            local v321 = v304();
                            if v321 ~= v320 then
                                if v320 and v305[v320] then
                                    v305[v320].Enabled = false;
                                end;
                                v320 = v321;
                                if not v320 then
                                    return;
                                end;
                            end;
                            if not v320 then
                                for v322, v323 in pairs(v305) do
                                    if typeof(v322) == "Instance" and v322.Parent and v323 then
                                        v323.Enabled = false;
                                    elseif not typeof(v322) == "Instance" or not v322.Parent then
                                        if v323 then
                                            v323:Destroy();
                                        end;
                                        v305[v322] = nil;
                                    end;
                                end;
                                return;
                            else
                                local l_l_Players_4_PlayerFromCharacter_0 = l_Players_4:GetPlayerFromCharacter(v320);
                                if not l_l_Players_4_PlayerFromCharacter_0 then
                                    return;
                                else
                                    local l_v285_Fighter_0 = v285:GetFighter(l_l_Players_4_PlayerFromCharacter_0);
                                    if not l_v285_Fighter_0 then
                                        return;
                                    else
                                        local v326 = v316(v320);
                                        if not v326 then
                                            return;
                                        else
                                            local l_Container_0 = v326:FindFirstChild("Container");
                                            if not l_Container_0 then
                                                return;
                                            else
                                                local l_EquippedItem_0 = l_v285_Fighter_0.EquippedItem;
                                                local v329 = l_EquippedItem_0 and l_EquippedItem_0.Name or nil;
                                                local v330 = l_v285_Fighter_0.Loadout or l_v285_Fighter_0.Slots or l_v285_Fighter_0.Items or l_v285_Fighter_0.EquippedItems;
                                                local v331 = 0;
                                                local v332 = {};
                                                if type(v330) == "table" then
                                                    local v333 = table.find(getmetatable(v330) or {}, "__len") ~= nil;
                                                    local v334 = {};
                                                    if v333 then
                                                        for v335, v336 in ipairs(v330) do
                                                            table.insert(v334, {
                                                                key = v335, 
                                                                value = v336
                                                            });
                                                        end;
                                                    else
                                                        local v337 = {};
                                                        for v338, v339 in pairs(v330) do
                                                            table.insert(v337, {
                                                                key = v338, 
                                                                value = v339
                                                            });
                                                        end;
                                                        table.sort(v337, function(v340, v341) --[[ Line: 0 ]] --[[ Name:  ]]
                                                            if tonumber(v340.key) and tonumber(v341.key) then
                                                                return tonumber(v340.key) < tonumber(v341.key);
                                                            else
                                                                return tostring(v340.key) < tostring(v341.key);
                                                            end;
                                                        end);
                                                        v334 = v337;
                                                    end;
                                                    for _, v343 in ipairs(v334) do
                                                        if v276 > v331 then
                                                            local l_value_0 = v343.value;
                                                            local v345 = nil;
                                                            if type(l_value_0) == "string" then
                                                                v345 = l_value_0;
                                                            elseif type(l_value_0) == "table" and l_value_0.Name then
                                                                v345 = l_value_0.Name;
                                                            elseif l_value_0 and l_value_0:IsA("Tool") then
                                                                v345 = l_value_0.Name;
                                                            end;
                                                            if v345 and not v332[v345] then
                                                                v332[v345] = true;
                                                                v331 = v331 + 1;
                                                                local l_l_Container_0_FirstChild_0 = l_Container_0:FindFirstChild("Slot_" .. v331);
                                                                local v347 = l_l_Container_0_FirstChild_0 and l_l_Container_0_FirstChild_0:FindFirstChild("Highlight");
                                                                if l_l_Container_0_FirstChild_0 and v347 then
                                                                    local v348 = "rbxassetid://0";
                                                                    local v349 = v286.ViewModels[v345];
                                                                    if v349 and v349.Image then
                                                                        v348 = v349.Image;
                                                                    else
                                                                        warn("Billboard Inventory: No ViewModel Image found for", v345);
                                                                    end;
                                                                    l_l_Container_0_FirstChild_0.Image = v348;
                                                                    l_l_Container_0_FirstChild_0.Visible = true;
                                                                    v347.Enabled = v345 == v329;
                                                                end;
                                                            end;
                                                        else
                                                            break;
                                                        end;
                                                    end;
                                                end;
                                                for v350 = v331 + 1, v276 do
                                                    local l_l_Container_0_FirstChild_1 = l_Container_0:FindFirstChild("Slot_" .. v350);
                                                    if l_l_Container_0_FirstChild_1 then
                                                        l_l_Container_0_FirstChild_1.Visible = false;
                                                        local l_Highlight_0 = l_l_Container_0_FirstChild_1:FindFirstChild("Highlight");
                                                        if l_Highlight_0 then
                                                            l_Highlight_0.Enabled = false;
                                                        end;
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end);
                    local v355 = l_Players_4.PlayerRemoving:Connect(function(v354) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v272 (ref), v305 (ref)
                        if not v272 then
                            playerRemovingConnection:Disconnect();
                            return;
                        else
                            if v354.Character and v305[v354.Character] then
                                v305[v354.Character]:Destroy();
                                v305[v354.Character] = nil;
                            end;
                            return;
                        end;
                    end);
                    v176().cleanupInventoryViewer = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v353 (ref), v355 (ref), v319 (ref)
                        if v353 and typeof(v353) == "RBXScriptConnection" then
                            v353:Disconnect();
                            v353 = nil;
                        end;
                        if v355 and typeof(v355) == "RBXScriptConnection" then
                            v355:Disconnect();
                            v355 = nil;
                        end;
                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v319 (ref)
                            v319();
                        end);
                    end;
                    print("Billboard Inventory Display update loop started.");
                    v50:Notify({
                        Title = "Inventory Viewer Enabled", 
                        Content = "Now showing enemy inventories", 
                        Duration = 2
                    });
                end);
            elseif not v218() and v272 then
                v271:SetValue(false);
                v50:Notify({
                    Title = "Executor Not Supported", 
                    Content = "This feature requires a supported executor", 
                    Duration = 3
                });
            elseif v272 == false then
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v176 (ref)
                    if v176().cleanupInventoryViewer then
                        v176().cleanupInventoryViewer();
                    end;
                end);
            end;
        end);
        if v10 or getfenv().Drawing and getfenv().Drawing.new then
            local v356 = {
                Workspace = game:GetService("Workspace"), 
                Players = game:GetService("Players"), 
                UserInputService = game:GetService("UserInputService"), 
                RunService = game:GetService("RunService"), 
                TweenService = game:GetService("TweenService"), 
                TextChatService = game:GetService("TextChatService")
            };
            local l_LocalPlayer_6 = v356.Players.LocalPlayer;
            local _ = v356.Workspace.CurrentCamera;
            local v359 = {
                displayNames = setmetatable({}, {
                    __mode = "k"
                }), 
                entities = setmetatable({}, {
                    __mode = "v"
                }), 
                nameMap = {}, 
                lastTargetPosition = nil, 
                distanceCache = setmetatable({}, {
                    __mode = "k"
                })
            };
            local v360 = {
                BlatantTab = nil, 
                EntityDropdown = nil
            };
            local v361 = {
                target = {
                    name = "", 
                    esp = false, 
                    lastESPUpdate = 0, 
                    lastAliveCheck = 0, 
                    autoTargetClosest = false, 
                    autoTargetTeammate = false
                }, 
                teleport = {
                    mode = "Instant", 
                    key = Enum.KeyCode.X, 
                    height = 5, 
                    distance = 5, 
                    debounce = false, 
                    maxDistance = 500
                }, 
                auto = {
                    enabled = false, 
                    interval = 3, 
                    lastTime = 0, 
                    errors = 0
                }, 
                update = {
                    interval = 15, 
                    lastTime = 0, 
                    needed = false, 
                    lastManual = 0
                }, 
                rateLimit = {
                    active = false, 
                    backoff = 5, 
                    lastRequest = 0
                }, 
                orbit = {
                    enabled = false, 
                    speed = 1, 
                    distance = 5, 
                    height = 3, 
                    running = false, 
                    lastAngle = 0, 
                    lastUpdate = 0
                }
            };
            do
                local l_v356_0, l_l_LocalPlayer_6_0, l_v359_0, l_v360_0, l_v361_0 = v356, l_LocalPlayer_6, v359, v360, v361;
                local function v368(v367) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v359_0 (ref)
                    if not l_v359_0.displayNames[v367] then
                        l_v359_0.displayNames[v367] = v367.DisplayName ~= v367.Name and v367.DisplayName .. " @" .. v367.Name or v367.Name;
                    end;
                    return l_v359_0.displayNames[v367];
                end;
                local function v370(v369) --[[ Line: 0 ]] --[[ Name:  ]]
                    return v369:match("@(.+)$") or v369;
                end;
                local function v372(v371) --[[ Line: 0 ]] --[[ Name:  ]]
                    return v371 and (v371:FindFirstChild("HumanoidRootPart") or v371.PrimaryPart);
                end;
                local function v376(v373) --[[ Line: 0 ]] --[[ Name:  ]]
                    if not v373 then
                        return false;
                    else
                        local l_Character_3 = v373.Character;
                        if not l_Character_3 then
                            return false;
                        else
                            local l_Humanoid_1 = l_Character_3:FindFirstChildOfClass("Humanoid");
                            return l_Humanoid_1 and l_Humanoid_1.Health > 0;
                        end;
                    end;
                end;
                local function v379(v377) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_6_0 (ref)
                    if not v377 or not v377.Character then
                        return false;
                    else
                        local l_HumanoidRootPart_1 = v377.Character:FindFirstChild("HumanoidRootPart");
                        if not l_HumanoidRootPart_1 then
                            return false;
                        elseif l_HumanoidRootPart_1:FindFirstChild("TeammateLabel") then
                            return true;
                        elseif v377.Team and l_l_LocalPlayer_6_0.Team then
                            return v377.Team == l_l_LocalPlayer_6_0.Team;
                        else
                            return false;
                        end;
                    end;
                end;
                local function v384(v380) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_6_0 (ref), v372 (ref)
                    if not v380 or not v380.Character then
                        return math.huge;
                    else
                        local l_Character_4 = l_l_LocalPlayer_6_0.Character;
                        if not l_Character_4 then
                            return math.huge;
                        else
                            local v382 = v372(l_Character_4);
                            local v383 = v372(v380.Character);
                            if not v382 or not v383 then
                                return math.huge;
                            else
                                return (v382.Position - v383.Position).Magnitude;
                            end;
                        end;
                    end;
                end;
                local function v390() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v356_0 (ref), l_l_LocalPlayer_6_0 (ref), v379 (ref), v376 (ref), v384 (ref)
                    local l_huge_2 = math.huge;
                    local v386 = nil;
                    for _, v388 in ipairs(l_v356_0.Players:GetPlayers()) do
                        if v388 ~= l_l_LocalPlayer_6_0 and not v379(v388) and v376(v388) then
                            local v389 = v384(v388);
                            if v389 < l_huge_2 then
                                l_huge_2 = v389;
                                v386 = v388;
                            end;
                        end;
                    end;
                    return v386;
                end;
                local function v396() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v356_0 (ref), l_l_LocalPlayer_6_0 (ref), v379 (ref), v376 (ref), v384 (ref)
                    local l_huge_3 = math.huge;
                    local v392 = nil;
                    for _, v394 in ipairs(l_v356_0.Players:GetPlayers()) do
                        if v394 ~= l_l_LocalPlayer_6_0 and v379(v394) and v376(v394) then
                            local v395 = v384(v394);
                            if v395 < l_huge_3 then
                                l_huge_3 = v395;
                                v392 = v394;
                            end;
                        end;
                    end;
                    return v392;
                end;
                local function v408() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v361_0 (ref), v390 (ref), v396 (ref), l_v356_0 (ref), v376 (ref), v372 (ref), l_v359_0 (ref)
                    if l_v361_0.target.name == "" then
                        return nil;
                    else
                        if l_v361_0.target.name == "_CLOSEST_ENEMY_" then
                            local v397 = v390();
                            if v397 then
                                l_v361_0.target.name = v397.Name;
                            else
                                return nil;
                            end;
                        elseif l_v361_0.target.name == "_CLOSEST_TEAMMATE_" then
                            local v398 = v396();
                            if v398 then
                                l_v361_0.target.name = v398.Name;
                            else
                                return nil;
                            end;
                        end;
                        local v399 = tick();
                        if v399 - l_v361_0.target.lastAliveCheck > 1 then
                            l_v361_0.target.lastAliveCheck = v399;
                            local l_FirstChild_0 = l_v356_0.Players:FindFirstChild(l_v361_0.target.name);
                            if l_FirstChild_0 and not v376(l_FirstChild_0) then
                                local l_Character_5 = l_FirstChild_0.Character;
                                if l_Character_5 then
                                    local v402 = v372(l_Character_5);
                                    if v402 then
                                        l_v359_0.lastTargetPosition = v402.Position;
                                    end;
                                end;
                                return nil;
                            end;
                        end;
                        local v403 = l_v359_0.entities[l_v361_0.target.name];
                        if v403 and v403.Parent then
                            local l_FirstChild_1 = l_v356_0.Players:FindFirstChild(l_v361_0.target.name);
                            if l_FirstChild_1 and not v376(l_FirstChild_1) then
                                local v405 = v372(v403);
                                if v405 then
                                    l_v359_0.lastTargetPosition = v405.Position;
                                end;
                                return nil;
                            else
                                return v403;
                            end;
                        else
                            local l_FirstChild_2 = l_v356_0.Players:FindFirstChild(l_v361_0.target.name);
                            if not l_FirstChild_2 or not v376(l_FirstChild_2) then
                                return nil;
                            else
                                local v407 = l_FirstChild_2 and l_FirstChild_2.Character;
                                if v407 then
                                    l_v359_0.entities[l_FirstChild_2.Name] = v407;
                                end;
                                return v407;
                            end;
                        end;
                    end;
                end;
                local function v411() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v408 (ref), v372 (ref), l_v359_0 (ref)
                    local v409 = v408();
                    if v409 then
                        local v410 = v372(v409);
                        if v410 then
                            return v410.Position;
                        end;
                    end;
                    return l_v359_0.lastTargetPosition;
                end;
                local function v424() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v356_0 (ref), l_l_LocalPlayer_6_0 (ref), v376 (ref), v368 (ref), v384 (ref), v379 (ref), l_v359_0 (ref)
                    local v412 = {};
                    local v413 = {};
                    local v414 = {};
                    v412[1] = "Closest Enemy";
                    v413["Closest Enemy"] = "_CLOSEST_ENEMY_";
                    v412[2] = "Closest Teammate";
                    v413["Closest Teammate"] = "_CLOSEST_TEAMMATE_";
                    for _, v416 in ipairs(l_v356_0.Players:GetPlayers()) do
                        if v416 ~= l_l_LocalPlayer_6_0 then
                            local l_Character_6 = v416.Character;
                            if l_Character_6 and v376(v416) then
                                local v418 = v368(v416);
                                local v419 = v384(v416);
                                table.insert(v414, {
                                    player = v416, 
                                    formatted = v418, 
                                    distance = v419, 
                                    isEnemy = not v379(v416), 
                                    isTeammate = v379(v416)
                                });
                                v413[v418] = v416.Name;
                                l_v359_0.entities[v416.Name] = l_Character_6;
                            end;
                        end;
                    end;
                    table.sort(v414, function(v420, v421) --[[ Line: 0 ]] --[[ Name:  ]]
                        if v420.isEnemy and not v421.isEnemy then
                            return true;
                        elseif not v420.isEnemy and v421.isEnemy then
                            return false;
                        else
                            return v420.distance < v421.distance;
                        end;
                    end);
                    for _, v423 in ipairs(v414) do
                        table.insert(v412, v423.formatted);
                    end;
                    l_v359_0.nameMap = v413;
                    return v412;
                end;
                local function v428() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v360_0 (ref), l_v361_0 (ref), v424 (ref)
                    if not l_v360_0.EntityDropdown then
                        return;
                    else
                        local v425 = tick();
                        if l_v361_0.rateLimit.active then
                            if v425 - l_v361_0.rateLimit.lastRequest < l_v361_0.rateLimit.backoff then
                                return;
                            else
                                l_v361_0.rateLimit.active = false;
                            end;
                        end;
                        if v425 - l_v361_0.update.lastTime < l_v361_0.update.interval then
                            return;
                        else
                            local l_status_8, l_result_8 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: l_v360_0 (ref), v424 (ref), l_v361_0 (ref), v425 (ref)
                                l_v360_0.EntityDropdown:SetValues(v424());
                                l_v361_0.update.lastTime = v425;
                                l_v361_0.rateLimit.backoff = 5;
                                return true;
                            end);
                            if not l_status_8 then
                                if tostring(l_result_8):find("429") then
                                    l_v361_0.rateLimit.active = true;
                                    l_v361_0.rateLimit.backoff = math.min(l_v361_0.rateLimit.backoff * 2, 60);
                                    l_v361_0.rateLimit.lastRequest = v425;
                                end;
                                warn("Update failed: " .. tostring(l_result_8));
                            end;
                            return;
                        end;
                    end;
                end;
                local function v430(v429) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v361_0 (ref)
                    if not v429 then
                        return nil;
                    else
                        return CFrame.new(v429 + Vector3.new(0, l_v361_0.teleport.height, 0));
                    end;
                end;
                local function v436(v431, v432) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_6_0 (ref), v372 (ref), l_v361_0 (ref), l_TweenService_1 (ref)
                    local l_Character_7 = l_l_LocalPlayer_6_0.Character;
                    local v434 = l_Character_7 and v372(l_Character_7);
                    if not v434 then
                        return;
                    else
                        local v435 = v432 and CFrame.new(v431, v432) or CFrame.new(v431);
                        if l_v361_0.teleport.mode == "Smooth" then
                            l_TweenService_1:Create(v434, TweenInfo.new(0), {
                                CFrame = v435
                            }):Play();
                        else
                            v434.CFrame = v435;
                        end;
                        return;
                    end;
                end;
                local function v440() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v361_0 (ref), v411 (ref), l_l_LocalPlayer_6_0 (ref), v372 (ref), v436 (ref), v430 (ref)
                    if l_v361_0.orbit.enabled then
                        return;
                    else
                        local v437 = v411();
                        if not v437 then
                            return;
                        else
                            local l_Character_8 = l_l_LocalPlayer_6_0.Character;
                            local v439 = l_Character_8 and v372(l_Character_8);
                            if v439 and (v439.Position - v437).Magnitude > l_v361_0.teleport.maxDistance then
                                return false;
                            else
                                v436(v430(v437).Position);
                                return true;
                            end;
                        end;
                    end;
                end;
                local function v448() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v361_0 (ref), l_v356_0 (ref), v411 (ref), l_l_LocalPlayer_6_0 (ref), v372 (ref), v436 (ref), l_v359_0 (ref)
                    if not l_v361_0.orbit.running then
                        l_v361_0.orbit.running = true;
                        l_v361_0.orbit.lastAngle = 0;
                        while true do
                            if l_v361_0.orbit.enabled and l_v361_0.orbit.running then
                                local v441 = l_v356_0.RunService.Heartbeat:Wait();
                                local _ = tick();
                                local v443 = v411();
                                if v443 then
                                    local l_Character_9 = l_l_LocalPlayer_6_0.Character;
                                    local v445 = l_Character_9 and v372(l_Character_9);
                                    if v445 and (v445.Position - v443).Magnitude > l_v361_0.teleport.maxDistance then
                                        task.wait(0.1);
                                        return;
                                    else
                                        local v446 = v443 + Vector3.new(0, l_v361_0.orbit.height, 0);
                                        l_v361_0.orbit.lastAngle = l_v361_0.orbit.lastAngle + v441 * l_v361_0.orbit.speed * 2 * math.pi;
                                        local v447 = v446 + Vector3.new(math.cos(l_v361_0.orbit.lastAngle) * l_v361_0.orbit.distance, 0, math.sin(l_v361_0.orbit.lastAngle) * l_v361_0.orbit.distance);
                                        v436(v447, v446);
                                        l_v359_0.lastTargetPosition = v443;
                                    end;
                                else
                                    task.wait(0);
                                end;
                            else
                                l_v361_0.orbit.running = false;
                                break;
                            end;
                        end;
                    end;
                end;
                local v449 = {};
                local function v453() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v449 (ref)
                    for _, v451 in pairs(v449) do
                        do
                            local l_v451_0 = v451;
                            if l_v451_0 then
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: l_v451_0 (ref)
                                    l_v451_0:Destroy();
                                end);
                            end;
                        end;
                    end;
                    v449 = {};
                end;
                local function v458() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v453 (ref), l_v361_0 (ref), v408 (ref), v449 (ref)
                    v453();
                    if not l_v361_0.target.esp then
                        return;
                    else
                        local v454 = v408();
                        if not v454 then
                            return;
                        else
                            local l_status_9, l_result_9 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v454 (ref)
                                local l_Highlight_1 = Instance.new("Highlight");
                                l_Highlight_1.FillColor = Color3.fromRGB(255, 0, 0);
                                l_Highlight_1.OutlineColor = Color3.fromRGB(255, 255, 0);
                                l_Highlight_1.FillTransparency = 0.5;
                                l_Highlight_1.OutlineTransparency = 0;
                                l_Highlight_1.Adornee = v454;
                                l_Highlight_1.Parent = v454;
                                return l_Highlight_1;
                            end);
                            if l_status_9 then
                                v449[#v449 + 1] = l_result_9;
                            end;
                            return;
                        end;
                    end;
                end;
                local function v481() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_CreateWindow_0_0 (ref), l_v360_0 (ref), v424 (ref), l_v361_0 (ref), l_v359_0 (ref), v370 (ref), v458 (ref), v175 (ref), v390 (ref), v396 (ref), v448 (ref), v428 (ref)
                    if not l_l_CreateWindow_0_0 then
                        return false;
                    else
                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_l_CreateWindow_0_0 (ref)
                            task.wait(0.1);
                            return l_l_CreateWindow_0_0:AddTab({
                                Title = "Blatant", 
                                Icon = "skull"
                            });
                        end);
                        if not l_status_10 then
                            return false;
                        else
                            l_v360_0.BlatantTab = l_result_10;
                            local l_l_v360_0_0 = l_v360_0;
                            local l_status_11, l_result_11 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: l_result_10 (ref), v424 (ref), l_v361_0 (ref), l_v359_0 (ref), v370 (ref), v458 (ref)
                                return l_result_10:AddDropdown("EntityDropdown", {
                                    Title = "Choose Target", 
                                    Values = v424(), 
                                    Default = "", 
                                    Callback = function(v462) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), l_v359_0 (ref), v370 (ref), v458 (ref)
                                        l_v361_0.target.name = l_v359_0.nameMap[v462] or v370(v462);
                                        l_v359_0.lastTargetPosition = nil;
                                        v458();
                                    end
                                });
                            end);
                            l_l_v360_0_0.EntityDropdown = l_result_11;
                            if not l_status_11 then
                                return false;
                            else
                                l_result_10:AddToggle("AutoClosestEnemy", {
                                    Title = "Auto Target Closest Enemy", 
                                    Default = v175.AutoTargetClosestEnemy, 
                                    Callback = function(v465) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref), v390 (ref), v458 (ref)
                                        l_v361_0.target.autoTargetClosest = v465;
                                        v175.AutoTargetClosestEnemy = v465;
                                        l_v361_0.target.autoTargetTeammate = false;
                                        if v465 then
                                            local v466 = v390();
                                            if v466 then
                                                l_v361_0.target.name = v466.Name;
                                                v458();
                                            end;
                                        end;
                                    end
                                });
                                l_result_10:AddToggle("AutoClosestTeammate", {
                                    Title = "Auto Target Closest Teammate", 
                                    Default = v175.AutoTargetClosestTeammate, 
                                    Callback = function(v467) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref), v396 (ref), v458 (ref)
                                        l_v361_0.target.autoTargetTeammate = v467;
                                        v175.AutoTargetClosestTeammate = v467;
                                        l_v361_0.target.autoTargetClosest = false;
                                        if v467 then
                                            local v468 = v396();
                                            if v468 then
                                                l_v361_0.target.name = v468.Name;
                                                v458();
                                            end;
                                        end;
                                    end
                                });
                                l_result_10:AddDropdown("TeleportMode", {
                                    Title = "Teleport Mode", 
                                    Values = {
                                        "Instant", 
                                        "Smooth", 
                                        "Behind"
                                    }, 
                                    Default = v175.TeleportMode, 
                                    Callback = function(v469) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.teleport.mode = v469;
                                        v175.TeleportMode = v469;
                                    end
                                });
                                l_result_10:AddSlider("TeleportHeight", {
                                    Title = "Teleport Height", 
                                    Default = v175.TeleportHeight, 
                                    Min = 0, 
                                    Max = 50, 
                                    Rounding = 1, 
                                    Callback = function(v470) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.teleport.height = v470;
                                        v175.TeleportHeight = v470;
                                    end
                                });
                                l_result_10:AddSlider("TeleportDistance", {
                                    Title = "Teleport Distance", 
                                    Default = v175.TeleportDistance, 
                                    Min = 2, 
                                    Max = 15, 
                                    Rounding = 1, 
                                    Callback = function(v471) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.teleport.distance = v471;
                                        v175.TeleportDistance = v471;
                                    end
                                });
                                l_result_10:AddSlider("MaxTeleportRange", {
                                    Title = "Max Teleport Range", 
                                    Description = "Maximum stud distance for teleport", 
                                    Default = v175.MaxTeleportRange, 
                                    Min = 50, 
                                    Max = 1000, 
                                    Rounding = 10, 
                                    Callback = function(v472) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.teleport.maxDistance = v472;
                                        v175.MaxTeleportRange = v472;
                                    end
                                });
                                l_result_10:AddToggle("OrbitMode", {
                                    Title = "Orbit Mode", 
                                    Default = v175.OrbitMode, 
                                    Callback = function(v473) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref), v448 (ref)
                                        l_v361_0.orbit.enabled = v473;
                                        v175.OrbitMode = v473;
                                        if v473 then
                                            l_v361_0.orbit.height = v175.OrbitHeight;
                                            l_v361_0.orbit.distance = v175.OrbitDistance;
                                            coroutine.wrap(v448)();
                                        end;
                                    end
                                });
                                l_result_10:AddSlider("OrbitSpeed", {
                                    Title = "Orbit Speed", 
                                    Description = "Rotations per second", 
                                    Default = v175.OrbitSpeed, 
                                    Min = 0.1, 
                                    Max = 5, 
                                    Rounding = 1, 
                                    Callback = function(v474) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.orbit.speed = v474;
                                        v175.OrbitSpeed = v474;
                                    end
                                });
                                l_result_10:AddSlider("OrbitDistance", {
                                    Title = "Orbit Distance", 
                                    Description = "Distance from target", 
                                    Default = v175.OrbitDistance, 
                                    Min = 2, 
                                    Max = 50, 
                                    Rounding = 1, 
                                    Callback = function(v475) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.orbit.distance = v475;
                                        v175.OrbitDistance = v475;
                                    end
                                });
                                l_result_10:AddSlider("OrbitHeight", {
                                    Title = "Orbit Height", 
                                    Description = "Height above target", 
                                    Default = v175.OrbitHeight, 
                                    Min = 0, 
                                    Max = 10, 
                                    Rounding = 1, 
                                    Callback = function(v476) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.orbit.height = v476;
                                        v175.OrbitHeight = v476;
                                    end
                                });
                                l_result_10:AddToggle("TargetESP", {
                                    Title = "Target ESP", 
                                    Default = v175.TargetESP, 
                                    Callback = function(v477) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref), v458 (ref)
                                        l_v361_0.target.esp = v477;
                                        v175.TargetESP = v477;
                                        v458();
                                    end
                                });
                                l_result_10:AddToggle("AutoTeleport", {
                                    Title = "Auto Teleport", 
                                    Default = v175.AutoTeleport, 
                                    Callback = function(v478) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.auto.enabled = v478;
                                        v175.AutoTeleport = v478;
                                        l_v361_0.auto.lastTime = tick();
                                    end
                                });
                                l_result_10:AddSlider("AutoInterval", {
                                    Title = "Teleport Interval", 
                                    Default = v175.TeleportInterval, 
                                    Min = 0, 
                                    Max = 10, 
                                    Rounding = 1, 
                                    Callback = function(v479) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.auto.interval = v479;
                                        v175.TeleportInterval = v479;
                                    end
                                });
                                l_result_10:AddKeybind("TeleportKey", {
                                    Title = "Teleport Key", 
                                    Default = v175.TeleportKey, 
                                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                                    end, 
                                    ChangedCallback = function(v480) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v175 (ref)
                                        l_v361_0.teleport.key = v480;
                                        v175.TeleportKey = v480;
                                    end
                                });
                                l_result_10:AddButton({
                                    Title = "Refresh Entities", 
                                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), v428 (ref)
                                        if tick() - (l_v361_0.update.lastManual or 0) < 5 then
                                            return;
                                        else
                                            l_v361_0.update.lastManual = tick();
                                            v428();
                                            return;
                                        end;
                                    end
                                });
                                return true;
                            end;
                        end;
                    end;
                end;
                local v482 = {};
                local function v497() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v481 (ref), v482 (ref), l_v356_0 (ref), l_v361_0 (ref), v440 (ref), v372 (ref), l_v359_0 (ref), v458 (ref), l_l_LocalPlayer_6_0 (ref), v448 (ref), v390 (ref), v396 (ref), v428 (ref)
                    if not v481() then
                        return false;
                    else
                        v482.input = l_v356_0.UserInputService.InputBegan:Connect(function(v483, v484) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_v361_0 (ref), v440 (ref)
                            if v484 or l_v361_0.teleport.debounce then
                                return;
                            else
                                if v483.UserInputType == Enum.UserInputType.Keyboard and v483.KeyCode == l_v361_0.teleport.key then
                                    l_v361_0.teleport.debounce = true;
                                    pcall(v440);
                                    task.delay(0, function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref)
                                        l_v361_0.teleport.debounce = false;
                                    end);
                                end;
                                return;
                            end;
                        end);
                        v482.playerRemoved = l_v356_0.Players.PlayerRemoving:Connect(function(v485) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_v361_0 (ref), v372 (ref), l_v359_0 (ref), v458 (ref)
                            if v485.Name == l_v361_0.target.name then
                                local l_Character_10 = v485.Character;
                                if l_Character_10 then
                                    local v487 = v372(l_Character_10);
                                    if v487 then
                                        l_v359_0.lastTargetPosition = v487.Position;
                                    end;
                                end;
                                l_v361_0.target.name = "";
                                l_v359_0.entities[v485.Name] = nil;
                                v458();
                            end;
                            l_v361_0.update.needed = true;
                        end);
                        v482.playerAdded = l_v356_0.Players.PlayerAdded:Connect(function(v488) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_v361_0 (ref)
                            l_v361_0.update.needed = true;
                            if not v488.Character then
                                local v489 = nil;
                                do
                                    local l_v489_0 = v489;
                                    l_v489_0 = v488.CharacterAdded:Connect(function(_) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v361_0 (ref), l_v489_0 (ref)
                                        l_v361_0.update.needed = true;
                                        if l_v489_0 and l_v489_0.Connected then
                                            l_v489_0:Disconnect();
                                            l_v489_0 = nil;
                                        end;
                                    end);
                                end;
                            end;
                        end);
                        v482.localCharacterAdded = l_l_LocalPlayer_6_0.CharacterAdded:Connect(function(_) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_v361_0 (ref), v448 (ref)
                            if l_v361_0.orbit.enabled and l_v361_0.target.name ~= "" then
                                task.delay(1, function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: l_v361_0 (ref), v448 (ref)
                                    if l_v361_0.orbit.enabled then
                                        coroutine.wrap(v448)();
                                    end;
                                end);
                            end;
                        end);
                        v482.heartbeat = l_v356_0.RunService.Heartbeat:Connect(function(v493) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_v361_0 (ref), v390 (ref), v458 (ref), v396 (ref), v440 (ref), v428 (ref)
                            if not l_v361_0.auto.enabled and not l_v361_0.orbit.enabled and not l_v361_0.target.autoTargetClosest and not l_v361_0.target.autoTargetTeammate then
                                return;
                            else
                                local v494 = tick();
                                if l_v361_0.target.autoTargetClosest and v494 % 1 < v493 then
                                    local v495 = v390();
                                    if v495 and (l_v361_0.target.name == "" or l_v361_0.target.name ~= v495.Name) then
                                        l_v361_0.target.name = v495.Name;
                                        v458();
                                    end;
                                end;
                                if l_v361_0.target.autoTargetTeammate and v494 % 1 < v493 then
                                    local v496 = v396();
                                    if v496 and (l_v361_0.target.name == "" or l_v361_0.target.name ~= v496.Name) then
                                        l_v361_0.target.name = v496.Name;
                                        v458();
                                    end;
                                end;
                                if l_v361_0.auto.enabled and l_v361_0.target.name ~= "" and not l_v361_0.orbit.enabled and v494 - l_v361_0.auto.lastTime >= l_v361_0.auto.interval then
                                    l_v361_0.auto.lastTime = v494;
                                    if not pcall(v440) then
                                        l_v361_0.auto.errors = l_v361_0.auto.errors + 1;
                                        if l_v361_0.auto.errors > 3 then
                                            l_v361_0.auto.interval = math.min(l_v361_0.auto.interval * 1.5, 10);
                                            l_v361_0.auto.errors = 0;
                                        end;
                                    else
                                        l_v361_0.auto.errors = 0;
                                    end;
                                end;
                                if math.floor(v494) % 3 == 0 then
                                    if l_v361_0.update.needed then
                                        l_v361_0.update.needed = false;
                                        v428();
                                    end;
                                    if l_v361_0.target.esp then
                                        pcall(v458);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        task.delay(1.5, v428);
                        return true;
                    end;
                end;
                local _ = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v361_0 (ref), v453 (ref), v482 (ref), l_v359_0 (ref)
                    l_v361_0.orbit.enabled = false;
                    l_v361_0.orbit.running = false;
                    v453();
                    for _, v499 in pairs(v482) do
                        if v499 and typeof(v499) == "RBXScriptConnection" and v499.Connected then
                            v499:Disconnect();
                        end;
                    end;
                    table.clear(l_v359_0.displayNames);
                    table.clear(l_v359_0.entities);
                    table.clear(l_v359_0.nameMap);
                    table.clear(l_v359_0.distanceCache);
                    l_v359_0.lastTargetPosition = nil;
                end;
                local v501 = 3;
                local v502 = 0;
                local function v503() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v502 (ref), v501 (ref), v497 (ref), v503 (ref)
                    if v501 <= v502 then
                        return;
                    else
                        v502 = v502 + 1;
                        if pcall(v497) then
                            return true;
                        else
                            task.delay(2, v503);
                            return;
                        end;
                    end;
                end;
                v503();
            end;
        end;
        if v10 or getfenv().Drawing and getfenv().Drawing.new then
            local l_Lighting_0 = game:GetService("Lighting");
            local l_Players_5 = game:GetService("Players");
            local l_LocalPlayer_7 = l_Players_5.LocalPlayer;
            local l_RunService_4 = game:GetService("RunService");
            l_v50_0.World = l_l_CreateWindow_0_0:AddTab({
                Title = "World", 
                Icon = "globe"
            });
            task.wait(0.1);
            l_v50_0.World:AddParagraph({
                Title = string.format("%s", string.format(v44[os.date("*t").month], "Luasec")), 
                Content = "Luasec\nhttps://discord.gg/luasec"
            });
            local v508 = nil;
            local _ = nil;
            local v510 = nil;
            local v511 = nil;
            local _ = nil;
            local v513 = false;
            local _ = l_Lighting_0.FogStart < l_Lighting_0.FogEnd;
            local _ = {
                Ambient = l_Lighting_0.Ambient, 
                OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
                FogColor = l_Lighting_0.FogColor, 
                FogStart = l_Lighting_0.FogStart, 
                FogEnd = l_Lighting_0.FogEnd, 
                ClockTime = l_Lighting_0.ClockTime
            };
            local v516 = {};
            local _ = {
                BloomEffect = nil, 
                DepthOfFieldEffect = nil
            };
            local _ = {};
            local _ = Enum.Material.ForceField;
            local l_SmoothPlastic_0 = Enum.Material.SmoothPlastic;
            do
                local l_l_Lighting_0_0, l_l_Players_5_0, l_l_LocalPlayer_7_0, l_l_RunService_4_0, l_v508_0, l_v510_0, l_v511_0, l_v513_0, l_v516_0, l_l_SmoothPlastic_0_0 = l_Lighting_0, l_Players_5, l_LocalPlayer_7, l_RunService_4, v508, v510, v511, v513, v516, l_SmoothPlastic_0;
                local function v533(v531) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v516_0 (ref)
                    if not v531 or not v531:IsA("BasePart") then
                        return;
                    else
                        local l_v531_FullName_0 = v531:GetFullName();
                        if not l_v516_0[l_v531_FullName_0] then
                            l_v516_0[l_v531_FullName_0] = {
                                Transparency = v531.Transparency, 
                                Material = v531.Material, 
                                Reflectance = v531.Reflectance
                            };
                        end;
                        return;
                    end;
                end;
                local function v536(v534) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_Players_5_0 (ref)
                    local l_v534_FirstAncestorOfClass_0 = v534:FindFirstAncestorOfClass("Model");
                    return l_v534_FirstAncestorOfClass_0 and l_l_Players_5_0:GetPlayerFromCharacter(l_v534_FirstAncestorOfClass_0) ~= nil;
                end;
                local function _(v537) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_Players_5_0 (ref), l_l_LocalPlayer_7_0 (ref)
                    local l_v537_FirstAncestorOfClass_0 = v537:FindFirstAncestorOfClass("Model");
                    return l_v537_FirstAncestorOfClass_0 and l_l_Players_5_0:GetPlayerFromCharacter(l_v537_FirstAncestorOfClass_0) == l_l_LocalPlayer_7_0;
                end;
                local function _(v540) --[[ Line: 0 ]] --[[ Name:  ]]
                    if v540:IsDescendantOf(workspace.CurrentCamera) then
                        return true;
                    else
                        local l_v540_FirstAncestorOfClass_0 = v540:FindFirstAncestorOfClass("Model");
                        if l_v540_FirstAncestorOfClass_0 then
                            local v542 = l_v540_FirstAncestorOfClass_0.Name:lower();
                            return v542:find("viewmodel") or v542:find("arms") or v542:find("weapon") or v542:find("camera") or v542:find("tool") or v542:find("hand") or v542:find("gun") or v542:find("item");
                        else
                            local l_CurrentCamera_3 = workspace.CurrentCamera;
                            if l_CurrentCamera_3 then
                                return (v540.Position - l_CurrentCamera_3.CFrame.Position).Magnitude < 5;
                            else
                                return false;
                            end;
                        end;
                    end;
                end;
                local function v548() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v533 (ref)
                    local l_workspace_Descendants_0 = workspace:GetDescendants();
                    for v546 = 1, #l_workspace_Descendants_0 do
                        local v547 = l_workspace_Descendants_0[v546];
                        if v547:IsA("BasePart") then
                            v533(v547);
                        end;
                    end;
                end;
                local function _() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_7_0 (ref)
                    local l_Character_11 = l_l_LocalPlayer_7_0.Character;
                    local l_CurrentCamera_4 = workspace.CurrentCamera;
                    if l_Character_11 and l_CurrentCamera_4 then
                        local l_HumanoidRootPart_2 = l_Character_11:FindFirstChild("HumanoidRootPart");
                        if l_HumanoidRootPart_2 then
                            local l_Position_1 = l_CurrentCamera_4.CFrame.Position;
                            local l_Position_2 = l_HumanoidRootPart_2.Position;
                            l_HumanoidRootPart_2.CFrame = CFrame.new(l_Position_1.X, l_Position_2.Y, l_Position_1.Z, l_HumanoidRootPart_2.CFrame:GetComponents());
                        end;
                    end;
                end;
                local function v557(v555) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v533 (ref), l_l_SmoothPlastic_0_0 (ref)
                    if not v555 or not v555:IsA("BasePart") then
                        return;
                    else
                        v533(v555);
                        v555.Reflectance = 0.2;
                        local v556 = v555.Name:lower();
                        if v556:find("metal") or v556:find("iron") or v556:find("steel") then
                            v555.Material = Enum.Material.Metal;
                        elseif v556:find("wood") or v556:find("plank") then
                            v555.Material = Enum.Material.Wood;
                        elseif v556:find("glass") or v556:find("window") then
                            v555.Material = Enum.Material.Glass;
                            v555.Reflectance = 0.4;
                        elseif v556:find("water") then
                            v555.Material = Enum.Material.Glass;
                            v555.Reflectance = 0.6;
                            v555.Transparency = 0.6;
                        elseif v556:find("brick") or v556:find("concrete") then
                            v555.Material = Enum.Material.Concrete;
                        else
                            v555.Material = l_l_SmoothPlastic_0_0;
                        end;
                        if v555.ClassName == "Terrain" then
                            v555.WaterTransparency = 0.7;
                            v555.WaterReflectance = 0.8;
                        end;
                        return;
                    end;
                end;
                local function v560(v558) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v516_0 (ref)
                    if not v558 or not v558:IsA("BasePart") then
                        return;
                    else
                        local v559 = l_v516_0[v558:GetFullName()];
                        if v559 then
                            v558.Reflectance = v559.Reflectance;
                            v558.Material = v559.Material;
                        end;
                        if v558.ClassName == "Terrain" then
                            v558.WaterTransparency = 0.3;
                            v558.WaterReflectance = 0.5;
                        end;
                        return;
                    end;
                end;
                local function v565() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v557 (ref), l_v508_0 (ref)
                    local l_workspace_Descendants_1 = workspace:GetDescendants();
                    for v562 = 1, #l_workspace_Descendants_1 do
                        local v563 = l_workspace_Descendants_1[v562];
                        if v563:IsA("BasePart") then
                            v557(v563);
                        end;
                    end;
                    if l_v508_0 then
                        l_v508_0:Disconnect();
                    end;
                    l_v508_0 = workspace.DescendantAdded:Connect(function(v564) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v557 (ref)
                        if v564:IsA("BasePart") then
                            v557(v564);
                        end;
                    end);
                end;
                local function v569() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v508_0 (ref), v560 (ref)
                    if l_v508_0 then
                        l_v508_0:Disconnect();
                        l_v508_0 = nil;
                    end;
                    local l_workspace_Descendants_2 = workspace:GetDescendants();
                    for v567 = 1, #l_workspace_Descendants_2 do
                        local v568 = l_workspace_Descendants_2[v567];
                        if v568:IsA("BasePart") then
                            v560(v568);
                        end;
                    end;
                end;
                local function v571(v570) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v533 (ref), v175 (ref)
                    if not v570 or not v570:IsA("BasePart") then
                        return;
                    else
                        v533(v570);
                        v570.Material = v175.CustomMaterial;
                        v570.Reflectance = v175.CustomReflectance;
                        return;
                    end;
                end;
                local function _(v572) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v516_0 (ref)
                    if not v572 or not v572:IsA("BasePart") then
                        return;
                    else
                        local v573 = l_v516_0[v572:GetFullName()];
                        if v573 then
                            v572.Material = v573.Material;
                            v572.Reflectance = v573.Reflectance;
                        end;
                        return;
                    end;
                end;
                local function v577(v575) --[[ Line: 0 ]] --[[ Name:  ]]
                    if v575 and v575.Parent then
                        local _ = v575.Parent;
                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v575 (ref)
                            v575.Parent = nil;
                        end);
                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v575 (ref)
                            v575:Destroy();
                        end);
                    end;
                end;
                local function v587(v578) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v536 (ref), l_l_SmoothPlastic_0_0 (ref), v577 (ref), l_l_RunService_4_0 (ref)
                    local v579 = 50;
                    for v580 = 1, #v578, v579 do
                        for v581 = v580, math.min(v580 + v579 - 1, #v578) do
                            local v582 = v578[v581];
                            do
                                local l_v582_0 = v582;
                                if l_v582_0:IsA("BasePart") and not v536(l_v582_0) then
                                    l_v582_0.Material = l_l_SmoothPlastic_0_0;
                                    l_v582_0.Reflectance = 0;
                                    if l_v582_0:IsA("MeshPart") then
                                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                            -- upvalues: l_v582_0 (ref)
                                            l_v582_0.TextureID = "";
                                        end);
                                    end;
                                    local l_l_v582_0_Children_0 = l_v582_0:GetChildren();
                                    for v585 = 1, #l_l_v582_0_Children_0 do
                                        local v586 = l_l_v582_0_Children_0[v585];
                                        if v586:IsA("Decal") or v586:IsA("Texture") or v586:IsA("SurfaceAppearance") then
                                            v577(v586);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        l_l_RunService_4_0.Heartbeat:Wait();
                    end;
                end;
                local function v594() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v587 (ref), l_l_Lighting_0_0 (ref), l_v510_0 (ref), v536 (ref), l_l_SmoothPlastic_0_0 (ref), v577 (ref), l_v511_0 (ref)
                    local l_workspace_Descendants_3 = workspace:GetDescendants();
                    v587(l_workspace_Descendants_3);
                    local l_l_l_Lighting_0_0_Descendants_0 = l_l_Lighting_0_0:GetDescendants();
                    v587(l_l_l_Lighting_0_0_Descendants_0);
                    if l_v510_0 then
                        l_v510_0:Disconnect();
                    end;
                    l_v510_0 = workspace.DescendantAdded:Connect(function(v590) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v536 (ref), l_l_SmoothPlastic_0_0 (ref), v577 (ref)
                        if v590:IsA("BasePart") and not v536(v590) then
                            v590.Material = l_l_SmoothPlastic_0_0;
                            v590.Reflectance = 0;
                            if v590:IsA("MeshPart") then
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v590 (ref)
                                    v590.TextureID = "";
                                end);
                            end;
                        elseif v590:IsA("Decal") or v590:IsA("Texture") or v590:IsA("SurfaceAppearance") then
                            local l_Parent_1 = v590.Parent;
                            if l_Parent_1 and l_Parent_1:IsA("BasePart") and not v536(l_Parent_1) then
                                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v577 (ref), v590 (ref)
                                    v577(v590);
                                end);
                            end;
                        end;
                    end);
                    if l_v511_0 then
                        l_v511_0:Disconnect();
                    end;
                    l_v511_0 = l_l_Lighting_0_0.DescendantAdded:Connect(function(v592) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v536 (ref), l_l_SmoothPlastic_0_0 (ref), v577 (ref)
                        if v592:IsA("BasePart") and not v536(v592) then
                            v592.Material = l_l_SmoothPlastic_0_0;
                            v592.Reflectance = 0;
                            if v592:IsA("MeshPart") then
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v592 (ref)
                                    v592.TextureID = "";
                                end);
                            end;
                        elseif v592:IsA("Decal") or v592:IsA("Texture") or v592:IsA("SurfaceAppearance") then
                            local l_Parent_2 = v592.Parent;
                            if l_Parent_2 and l_Parent_2:IsA("BasePart") and not v536(l_Parent_2) then
                                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v577 (ref), v592 (ref)
                                    v577(v592);
                                end);
                            end;
                        end;
                    end);
                end;
                local function _(v595) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v533 (ref), l_l_LocalPlayer_7_0 (ref), v175 (ref), v557 (ref), v571 (ref)
                    if not v595 then
                        return;
                    else
                        task.defer(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v595 (ref), v533 (ref), l_l_LocalPlayer_7_0 (ref), v175 (ref), v557 (ref), v571 (ref)
                            local l_v595_Descendants_0 = v595:GetDescendants();
                            for v597 = 1, #l_v595_Descendants_0 do
                                local v598 = l_v595_Descendants_0[v597];
                                if v598:IsA("BasePart") then
                                    v533(v598);
                                    if v595 ~= l_l_LocalPlayer_7_0.Character then
                                        if v175.RealisticRenderingEnabled then
                                            v557(v598);
                                        end;
                                        if v175.MaterialOverrides then
                                            v571(v598);
                                        end;
                                    end;
                                end;
                            end;
                        end);
                        return;
                    end;
                end;
                v548();
                local v600 = nil;
                local function v605() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref)
                    if v175.RainbowModeEnabled and v175.AmbientColorEnabled then
                        local v601 = tick() * v175.RainbowSpeed;
                        local v602 = math.sin(v601) * 127 + 128;
                        local v603 = math.sin(v601 + 2) * 127 + 128;
                        local v604 = math.sin(v601 + 4) * 127 + 128;
                        l_l_Lighting_0_0.Ambient = Color3.fromRGB(v602, v603, v604);
                    end;
                end;
                l_v50_0.World:AddSection("Danger Zone"):AddButton({
                    Title = "Remove all Textures", 
                    Description = "Removes textures from ALL parts and keeps them removed", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v513_0 (ref), v50 (ref), v594 (ref), v31 (ref)
                        if l_v513_0 then
                            v50:Notify({
                                Title = "Info", 
                                Content = "Textures already removed.", 
                                Duration = 2
                            });
                            return;
                        else
                            l_v513_0 = true;
                            v594();
                            v31:ExportSettings();
                            v50:Notify({
                                Title = "Success", 
                                Content = "All textures removed and will stay removed.", 
                                Duration = 3
                            });
                            return;
                        end;
                    end
                });
                l_v50_0.World:AddSection("4K / Realistic Rendering"):AddToggle("RealisticRenderingToggle", {
                    Title = "Enable 4K Realistic Rendering", 
                    Description = "Makes the game look more realistic with improved materials and lighting", 
                    Default = v175.RealisticRenderingEnabled or false, 
                    Callback = function(v606) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v565 (ref), v569 (ref), v31 (ref)
                        v175.RealisticRenderingEnabled = v606;
                        if v606 then
                            v565();
                        else
                            v569();
                        end;
                        v31:ExportSettings();
                    end
                });
                if v175.RealisticRenderingEnabled then
                    v565();
                end;
                local v607 = l_v50_0.World:AddSection("Fog Settings");
                v607:AddToggle("FogToggle", {
                    Title = "Enable Fog", 
                    Default = v175.FogEnabled, 
                    Callback = function(v608) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.FogEnabled = v608;
                        l_l_Lighting_0_0.FogEnd = v608 and v175.FogEnd or 1000000;
                        v31:ExportSettings();
                    end
                });
                v607:AddColorpicker("FogColorPicker", {
                    Title = "Fog Color", 
                    Default = v175.FogColor, 
                    Callback = function(v609) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.FogColor = v609;
                        if v175.FogEnabled then
                            l_l_Lighting_0_0.FogColor = v609;
                        end;
                        v31:ExportSettings();
                    end
                });
                v607:AddSlider("FogStartSlider", {
                    Title = "Fog Start Distance", 
                    Description = "Distance where fog begins (studs)", 
                    Min = 0, 
                    Max = 1000, 
                    Default = v175.FogStart, 
                    Rounding = 0, 
                    Callback = function(v610) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.FogStart = v610;
                        if v175.FogEnabled then
                            l_l_Lighting_0_0.FogStart = v610;
                        end;
                        v31:ExportSettings();
                    end
                });
                v607:AddSlider("FogEndSlider", {
                    Title = "Fog End Distance", 
                    Description = "Distance where fog is fully opaque (studs)", 
                    Min = 10, 
                    Max = 10000, 
                    Default = v175.FogEnd, 
                    Rounding = 0, 
                    Callback = function(v611) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.FogEnd = v611;
                        if v175.FogEnabled then
                            l_l_Lighting_0_0.FogEnd = v611;
                        end;
                        v31:ExportSettings();
                    end
                });
                local v612 = {
                    Default = {
                        SkyboxBk = "rbxassetid://91458024", 
                        SkyboxDn = "rbxassetid://91457980", 
                        SkyboxFt = "rbxassetid://91458024", 
                        SkyboxLf = "rbxassetid://91458024", 
                        SkyboxRt = "rbxassetid://91458024", 
                        SkyboxUp = "rbxassetid://91458002"
                    }, 
                    Neptune = {
                        SkyboxBk = "rbxassetid://218955819", 
                        SkyboxDn = "rbxassetid://218953419", 
                        SkyboxFt = "rbxassetid://218954524", 
                        SkyboxLf = "rbxassetid://218958493", 
                        SkyboxRt = "rbxassetid://218957134", 
                        SkyboxUp = "rbxassetid://218950090"
                    }, 
                    ["Among Us"] = {
                        SkyboxBk = "rbxassetid://5752463190", 
                        SkyboxDn = "rbxassetid://5752463190", 
                        SkyboxFt = "rbxassetid://5752463190", 
                        SkyboxLf = "rbxassetid://5752463190", 
                        SkyboxRt = "rbxassetid://5752463190", 
                        SkyboxUp = "rbxassetid://5752463190"
                    }, 
                    Nebula = {
                        SkyboxBk = "rbxassetid://159454299", 
                        SkyboxDn = "rbxassetid://159454296", 
                        SkyboxFt = "rbxassetid://159454293", 
                        SkyboxLf = "rbxassetid://159454286", 
                        SkyboxRt = "rbxassetid://159454300", 
                        SkyboxUp = "rbxassetid://159454288"
                    }, 
                    Vaporwave = {
                        SkyboxBk = "rbxassetid://1417494030", 
                        SkyboxDn = "rbxassetid://1417494146", 
                        SkyboxFt = "rbxassetid://1417494253", 
                        SkyboxLf = "rbxassetid://1417494402", 
                        SkyboxRt = "rbxassetid://1417494499", 
                        SkyboxUp = "rbxassetid://1417494643"
                    }, 
                    Clouds = {
                        SkyboxBk = "rbxassetid://570557514", 
                        SkyboxDn = "rbxassetid://570557775", 
                        SkyboxFt = "rbxassetid://570557559", 
                        SkyboxLf = "rbxassetid://570557620", 
                        SkyboxRt = "rbxassetid://570557672", 
                        SkyboxUp = "rbxassetid://570557727"
                    }, 
                    Twilight = {
                        SkyboxBk = "rbxassetid://264908339", 
                        SkyboxDn = "rbxassetid://264907909", 
                        SkyboxFt = "rbxassetid://264909420", 
                        SkyboxLf = "rbxassetid://264909758", 
                        SkyboxRt = "rbxassetid://264908886", 
                        SkyboxUp = "rbxassetid://264907379"
                    }, 
                    DaBaby = {
                        SkyboxBk = "rbxassetid://7245418472", 
                        SkyboxDn = "rbxassetid://7245418472", 
                        SkyboxFt = "rbxassetid://7245418472", 
                        SkyboxLf = "rbxassetid://7245418472", 
                        SkyboxRt = "rbxassetid://7245418472", 
                        SkyboxUp = "rbxassetid://7245418472"
                    }, 
                    Minecraft = {
                        SkyboxBk = "rbxassetid://1876545003", 
                        SkyboxDn = "rbxassetid://1876544331", 
                        SkyboxFt = "rbxassetid://1876542941", 
                        SkyboxLf = "rbxassetid://1876543392", 
                        SkyboxRt = "rbxassetid://1876543764", 
                        SkyboxUp = "rbxassetid://1876544642"
                    }, 
                    Chill = {
                        SkyboxBk = "rbxassetid://5084575798", 
                        SkyboxDn = "rbxassetid://5084575916", 
                        SkyboxFt = "rbxassetid://5103949679", 
                        SkyboxLf = "rbxassetid://5103948542", 
                        SkyboxRt = "rbxassetid://5103948784", 
                        SkyboxUp = "rbxassetid://5084576400"
                    }, 
                    Redshift = {
                        SkyboxBk = "rbxassetid://401664839", 
                        SkyboxDn = "rbxassetid://401664862", 
                        SkyboxFt = "rbxassetid://401664960", 
                        SkyboxLf = "rbxassetid://401664881", 
                        SkyboxRt = "rbxassetid://401664901", 
                        SkyboxUp = "rbxassetid://401664936"
                    }, 
                    ["Blue Stars"] = {
                        SkyboxBk = "rbxassetid://149397684", 
                        SkyboxDn = "rbxassetid://149397686", 
                        SkyboxFt = "rbxassetid://149397688", 
                        SkyboxLf = "rbxassetid://149397692", 
                        SkyboxRt = "rbxassetid://149397697", 
                        SkyboxUp = "rbxassetid://149397702"
                    }, 
                    ["Blue Aurora"] = {
                        SkyboxBk = "rbxassetid://12063984", 
                        SkyboxDn = "rbxassetid://12064107", 
                        SkyboxFt = "rbxassetid://12064152", 
                        SkyboxLf = "rbxassetid://12064121", 
                        SkyboxRt = "rbxassetid://12064115", 
                        SkyboxUp = "rbxassetid://12064131"
                    }
                };
                v175.SelectedSkybox = v37.SelectedSkybox or "Default";
                local function v618(v613) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v612 (ref), l_l_Lighting_0_0 (ref), v175 (ref), v31 (ref)
                    local v614 = v612[v613];
                    if not v614 then
                        return;
                    else
                        local v615 = l_l_Lighting_0_0:FindFirstChild("Sky") or Instance.new("Sky", l_l_Lighting_0_0);
                        for v616, v617 in pairs(v614) do
                            v615[v616] = v617;
                        end;
                        v175.SelectedSkybox = v613;
                        v31:ExportSettings();
                        return;
                    end;
                end;
                local v619 = l_v50_0.World:AddSection("Skybox");
                local v620 = {};
                for v621 in pairs(v612) do
                    table.insert(v620, v621);
                end;
                table.sort(v620);
                local _ = v619:AddDropdown("SkyboxDropdown", {
                    Title = "Skybox", 
                    Description = "Change the skybox appearance", 
                    Values = v620, 
                    Default = v175.SelectedSkybox, 
                    Callback = function(v622) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v618 (ref)
                        v618(v622);
                    end
                });
                l_v50_0.World:AddToggle("TimeControlToggle", {
                    Title = "Enable Time Control", 
                    Default = v175.TimeControlEnabled, 
                    Callback = function(v624) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v31 (ref), l_l_Lighting_0_0 (ref)
                        v175.TimeControlEnabled = v624;
                        v31:ExportSettings();
                        if v624 then
                            l_l_Lighting_0_0.ClockTime = math.clamp(v175.TimeSliderValue, 0, 24);
                        end;
                    end
                });
                l_v50_0.World:AddSlider("TimeSlider", {
                    Title = "Time of Day", 
                    Description = "0 = Midnight, 12 = Noon, 24 = Midnight", 
                    Min = 0, 
                    Max = 24, 
                    Default = v175.TimeSliderValue, 
                    Rounding = 1, 
                    Callback = function(v625) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.TimeSliderValue = v625;
                        if v175.TimeControlEnabled then
                            l_l_Lighting_0_0.ClockTime = math.clamp(v625, 0, 24);
                        end;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddToggle("ShadowsToggle", {
                    Title = "Enable Shadows", 
                    Default = v175.ShadowsEnabled, 
                    Callback = function(v626) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.ShadowsEnabled = v626;
                        l_l_Lighting_0_0.GlobalShadows = v626;
                        l_l_Lighting_0_0.ShadowSoftness = v626 and 0.5 or 1;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddToggle("AmbientToggle", {
                    Title = "Enable Color Tint", 
                    Default = v175.AmbientColorEnabled, 
                    Callback = function(v627) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.AmbientColorEnabled = v627;
                        if v627 and not v175.RainbowModeEnabled then
                            l_l_Lighting_0_0.Ambient = v175.SelectedColor;
                        else
                            l_l_Lighting_0_0.Ambient = Color3.fromRGB(127, 127, 127);
                        end;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddColorpicker("AmbientColorPicker", {
                    Title = "Game Tint Color", 
                    Default = v175.SelectedColor, 
                    Callback = function(v628) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.SelectedColor = v628;
                        if v175.AmbientColorEnabled and not v175.RainbowModeEnabled then
                            l_l_Lighting_0_0.Ambient = v628;
                        end;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddToggle("RainbowModeToggle", {
                    Title = "Enable Rainbow Mode", 
                    Default = v175.RainbowModeEnabled, 
                    Callback = function(v629) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v600 (ref), l_l_RunService_4_0 (ref), v605 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.RainbowModeEnabled = v629;
                        if v629 then
                            if v600 then
                                v600:Disconnect();
                            end;
                            v600 = l_l_RunService_4_0.Heartbeat:Connect(v605);
                        else
                            if v600 then
                                v600:Disconnect();
                            end;
                            if v175.AmbientColorEnabled then
                                l_l_Lighting_0_0.Ambient = v175.SelectedColor;
                            else
                                l_l_Lighting_0_0.Ambient = Color3.fromRGB(127, 127, 127);
                            end;
                        end;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddSlider("RainbowSpeedSlider", {
                    Title = "Rainbow Speed", 
                    Min = 0.1, 
                    Max = 5, 
                    Default = v175.RainbowSpeed, 
                    Rounding = 1, 
                    Callback = function(v630) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v31 (ref)
                        v175.RainbowSpeed = v630;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddToggle("OutdoorAmbientToggle", {
                    Title = "Enable Outdoor Lighting", 
                    Default = v175.OutdoorAmbientEnabled, 
                    Callback = function(v631) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.OutdoorAmbientEnabled = v631;
                        if v631 then
                            l_l_Lighting_0_0.OutdoorAmbient = v175.SelectedOutdoorColor;
                        else
                            l_l_Lighting_0_0.OutdoorAmbient = Color3.fromRGB(127, 127, 127);
                        end;
                        v31:ExportSettings();
                    end
                });
                l_v50_0.World:AddColorpicker("OutdoorColorPicker", {
                    Title = "Outdoor Lighting Color", 
                    Default = v175.SelectedOutdoorColor, 
                    Callback = function(v632) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref), v31 (ref)
                        v175.SelectedOutdoorColor = v632;
                        if v175.OutdoorAmbientEnabled then
                            l_l_Lighting_0_0.OutdoorAmbient = v632;
                        end;
                        v31:ExportSettings();
                    end
                });
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref), l_l_Lighting_0_0 (ref)
                    while true do
                        task.wait(0.1);
                        if v175.FogEnabled then
                            l_l_Lighting_0_0.FogColor = v175.FogColor;
                            l_l_Lighting_0_0.FogStart = v175.FogStart;
                            l_l_Lighting_0_0.FogEnd = v175.FogEnd;
                        else
                            l_l_Lighting_0_0.FogEnd = 1000000;
                        end;
                        if v175.TimeControlEnabled then
                            l_l_Lighting_0_0.ClockTime = math.clamp(v175.TimeSliderValue, 0, 24);
                        end;
                        l_l_Lighting_0_0.GlobalShadows = v175.ShadowsEnabled;
                        l_l_Lighting_0_0.ShadowSoftness = v175.ShadowsEnabled and 0.5 or 1;
                        if v175.AmbientColorEnabled then
                            if v175.RainbowModeEnabled then
                                local v633 = tick() * v175.RainbowSpeed;
                                local v634 = math.sin(v633) * 127 + 128;
                                local v635 = math.sin(v633 + 2) * 127 + 128;
                                local v636 = math.sin(v633 + 4) * 127 + 128;
                                l_l_Lighting_0_0.Ambient = Color3.fromRGB(v634, v635, v636);
                            else
                                l_l_Lighting_0_0.Ambient = v175.SelectedColor;
                            end;
                        else
                            l_l_Lighting_0_0.Ambient = Color3.fromRGB(127, 127, 127);
                        end;
                        if v175.OutdoorAmbientEnabled then
                            l_l_Lighting_0_0.OutdoorAmbient = v175.SelectedOutdoorColor;
                        else
                            l_l_Lighting_0_0.OutdoorAmbient = Color3.fromRGB(127, 127, 127);
                        end;
                    end;
                end);
                l_l_LocalPlayer_7_0.CharacterAdded:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v618 (ref), v175 (ref), l_l_Lighting_0_0 (ref)
                    task.wait(1);
                    v618(v175.SelectedSkybox);
                    if v175.FogEnabled then
                        l_l_Lighting_0_0.FogColor = v175.FogColor;
                        l_l_Lighting_0_0.FogStart = v175.FogStart;
                        l_l_Lighting_0_0.FogEnd = v175.FogEnd;
                    end;
                    if v175.TimeControlEnabled then
                        l_l_Lighting_0_0.ClockTime = math.clamp(v175.TimeSliderValue, 0, 24);
                    end;
                    l_l_Lighting_0_0.GlobalShadows = v175.ShadowsEnabled;
                    l_l_Lighting_0_0.ShadowSoftness = v175.ShadowsEnabled and 0.5 or 1;
                    if v175.AmbientColorEnabled then
                        l_l_Lighting_0_0.Ambient = v175.RainbowModeEnabled and l_l_Lighting_0_0.Ambient or v175.SelectedColor;
                    else
                        l_l_Lighting_0_0.Ambient = Color3.fromRGB(127, 127, 127);
                    end;
                    if v175.OutdoorAmbientEnabled then
                        l_l_Lighting_0_0.OutdoorAmbient = v175.SelectedOutdoorColor;
                    else
                        l_l_Lighting_0_0.OutdoorAmbient = Color3.fromRGB(127, 127, 127);
                    end;
                end);
                l_l_Lighting_0_0.Changed:Connect(function(v637) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v618 (ref), v175 (ref)
                    if v637 == "Sky" then
                        task.defer(v618, v175.SelectedSkybox);
                    end;
                end);
                v618(v175.SelectedSkybox);
            end;
        end;
        if v10 or getfenv().Drawing and getfenv().Drawing.new then
            l_v50_0.Player = l_l_CreateWindow_0_0:AddTab({
                Title = "Player", 
                Icon = "user"
            });
            task.wait(0.1);
            l_v50_0.Player:AddParagraph({
                Title = string.format("%s", string.format(v44[os.date("*t").month], "Luasec")), 
                Content = "Luasec\nhttps://discord.gg/luasec"
            });
            local l_UserInputService_3 = game:GetService("UserInputService");
            local l_RunService_5 = game:GetService("RunService");
            local l_LocalPlayer_8 = game:GetService("Players").LocalPlayer;
            local v641 = {
                InputHandler = {
                    Connections = {}, 
                    KeyBinds = {}
                }, 
                InfiniteJump = {
                    Enabled = v175.InfiniteJumpEnabled or false, 
                    Active = false, 
                    KeyBind = v175.InfiniteJumpKeybind or "J"
                }, 
                WalkSpeed = {
                    Enabled = v175.WalkspeedEnabled or false, 
                    Active = false, 
                    KeyBind = v175.WalkspeedKeybind or "V", 
                    Value = v175.WalkspeedValue or 50, 
                    Objects = {}
                }, 
                Sliding = {
                    Enabled = v175.SlidingEnabled or true, 
                    Active = false, 
                    KeyBind = v175.SlideKeybind or "LeftControl", 
                    Multiplier = v175.SlideMultiplier or 1.5, 
                    Duration = v175.SlideDuration or 1, 
                    Cooldown = v175.SlideCooldown or 2, 
                    CanSlide = true, 
                    CurrentTimer = 0, 
                    CurrentCooldown = 0
                }, 
                NoClip = {
                    Enabled = v175.NoClipEnabled or false, 
                    Active = false, 
                    KeyBind = v175.NoClipKeybind or "N", 
                    Connection = nil
                }, 
                Flying = {
                    Enabled = v175.FlyingEnabled or false, 
                    Active = false, 
                    KeyBind = v175.FlyingKeybind or "Z", 
                    Speed = v175.FlyingSpeed or 50, 
                    Parts = {}, 
                    Connection = nil
                }
            };
            do
                local l_l_UserInputService_3_0, l_l_RunService_5_0, l_l_LocalPlayer_8_0, l_v641_0 = l_UserInputService_3, l_RunService_5, l_LocalPlayer_8, v641;
                l_v641_0.InputHandler.SetupConnections = function(v646) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_UserInputService_3_0 (ref), l_v641_0 (ref)
                    for _, v648 in pairs(v646.Connections) do
                        if v648 then
                            v648:Disconnect();
                        end;
                    end;
                    v646.Connections = {};
                    v646.Connections.InputBegan = l_l_UserInputService_3_0.InputBegan:Connect(function(v649, v650) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v646 (ref), l_v641_0 (ref)
                        if v650 then
                            return;
                        else
                            local v651 = v649.KeyCode and tostring(v649.KeyCode):match("%w+$");
                            if not v651 then
                                return;
                            else
                                for v652, v653 in pairs(v646.KeyBinds) do
                                    local v654 = l_v641_0[v652];
                                    if v654 and v654.KeyBind == v651 and v654.Enabled then
                                        v653(nil);
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end);
                    v646.Connections.InputEnded = l_l_UserInputService_3_0.InputEnded:Connect(function(v655, v656) --[[ Line: 0 ]] --[[ Name:  ]]
                        if v656 then
                            return;
                        elseif not (v655.KeyCode and tostring(v655.KeyCode):match("%w+$")) then
                            return;
                        else
                            return;
                        end;
                    end);
                end;
                l_v641_0.InputHandler.RegisterKeybind = function(v657, v658, v659) --[[ Line: 0 ]] --[[ Name:  ]]
                    v657.KeyBinds[v658] = v659;
                end;
                l_v641_0.InputHandler:SetupConnections();
                local v660 = l_v50_0.Player:AddSection("Infinite Jump");
                l_v641_0.InfiniteJump.Toggle = function(v661, v662) --[[ Line: 0 ]] --[[ Name:  ]]
                    if v662 == nil then
                        v662 = not v661.Active;
                    end;
                    v661.Active = v662;
                end;
                l_l_UserInputService_3_0.JumpRequest:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref), l_l_LocalPlayer_8_0 (ref)
                    if l_v641_0.InfiniteJump.Enabled and l_v641_0.InfiniteJump.Active then
                        local l_Character_12 = l_l_LocalPlayer_8_0.Character;
                        if l_Character_12 then
                            local l_Humanoid_2 = l_Character_12:FindFirstChildOfClass("Humanoid");
                            if l_Humanoid_2 then
                                l_Humanoid_2:ChangeState(Enum.HumanoidStateType.Jumping);
                            end;
                        end;
                    end;
                end);
                local _ = v660:AddToggle("InfiniteJumpEnabled", {
                    Title = "Enable Infinite Jump", 
                    Default = l_v641_0.InfiniteJump.Enabled, 
                    Callback = function(v665) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.InfiniteJump.Enabled = v665;
                        v175.InfiniteJumpEnabled = v665;
                        v31:ExportSettings();
                        if not v665 then
                            l_v641_0.InfiniteJump.Active = false;
                        end;
                    end
                });
                l_v641_0.InputHandler:RegisterKeybind("InfiniteJump", function(v667) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref)
                    l_v641_0.InfiniteJump:Toggle(v667);
                end);
                v660:AddKeybind("InfiniteJumpKeybind", {
                    Title = "Infinite Jump Keybind", 
                    Description = "Press key to toggle Infinite Jump when enabled", 
                    Default = l_v641_0.InfiniteJump.KeyBind, 
                    Mode = "Toggle", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end, 
                    ChangedCallback = function(v668) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        local v669;
                        if typeof(v668) == "EnumItem" then
                            v669 = tostring(v668):match("%w+$");
                        elseif typeof(v668) == "string" then
                            v669 = v668;
                        else
                            local v670 = tostring(v668);
                            v669 = v670:match("%.([^.]+)$") or v670;
                        end;
                        l_v641_0.InfiniteJump.KeyBind = v669;
                        v175.InfiniteJumpKeybind = v669;
                        v31:ExportSettings();
                    end
                });
                local v671 = l_v50_0.Player:AddSection("Walkspeed");
                l_v641_0.WalkSpeed.Toggle = function(v672, v673) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_RunService_5_0 (ref)
                    if v673 == nil then
                        v673 = not v672.Active;
                    end;
                    v672.Active = v673;
                    v672:CleanupObjects();
                    if v672.Active and v672.Connection == nil then
                        v672.Connection = l_l_RunService_5_0.Heartbeat:Connect(function(v674) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v672 (ref)
                            v672:Update(v674);
                        end);
                    elseif not v672.Active and v672.Connection then
                        v672.Connection:Disconnect();
                        v672.Connection = nil;
                    end;
                end;
                l_v641_0.WalkSpeed.Update = function(v675, v676) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref), l_l_LocalPlayer_8_0 (ref)
                    if not v675.Active or not v675.Enabled then
                        return;
                    else
                        local l_Sliding_0 = l_v641_0.Sliding;
                        if l_Sliding_0.Active then
                            l_Sliding_0.CurrentTimer = math.max(0, l_Sliding_0.CurrentTimer - v676);
                            if l_Sliding_0.CurrentTimer <= 0 then
                                l_Sliding_0.Active = false;
                            end;
                        end;
                        if not l_Sliding_0.CanSlide then
                            l_Sliding_0.CurrentCooldown = math.max(0, l_Sliding_0.CurrentCooldown - v676);
                            if l_Sliding_0.CurrentCooldown <= 0 then
                                l_Sliding_0.CanSlide = true;
                            end;
                        end;
                        local l_Character_13 = l_l_LocalPlayer_8_0.Character;
                        if not l_Character_13 then
                            return;
                        else
                            local l_HumanoidRootPart_3 = l_Character_13:FindFirstChild("HumanoidRootPart");
                            if not l_HumanoidRootPart_3 then
                                return;
                            else
                                local l_Humanoid_3 = l_Character_13:FindFirstChildOfClass("Humanoid");
                                if not l_Humanoid_3 then
                                    return;
                                else
                                    if l_Humanoid_3.MoveDirection.Magnitude > 0 then
                                        local l_WalkspeedModifier_0 = l_HumanoidRootPart_3:FindFirstChild("WalkspeedModifier");
                                        if not l_WalkspeedModifier_0 then
                                            l_WalkspeedModifier_0 = Instance.new("BodyVelocity");
                                            l_WalkspeedModifier_0.Name = "WalkspeedModifier";
                                            l_WalkspeedModifier_0.MaxForce = Vector3.new(50000, 0, 50000);
                                            l_WalkspeedModifier_0.P = 1000;
                                            l_WalkspeedModifier_0.Parent = l_HumanoidRootPart_3;
                                            table.insert(v675.Objects, l_WalkspeedModifier_0);
                                        end;
                                        local l_Unit_0 = l_Humanoid_3.MoveDirection.Unit;
                                        local v683 = 1.5;
                                        if l_Sliding_0.Active then
                                            v683 = v683 * l_Sliding_0.Multiplier;
                                        end;
                                        l_WalkspeedModifier_0.Velocity = l_Unit_0 * (v675.Value * v683);
                                    else
                                        local l_WalkspeedModifier_1 = l_HumanoidRootPart_3:FindFirstChild("WalkspeedModifier");
                                        if l_WalkspeedModifier_1 then
                                            l_WalkspeedModifier_1.Velocity = Vector3.new(0, 0, 0);
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
                l_v641_0.WalkSpeed.CleanupObjects = function(v685) --[[ Line: 0 ]] --[[ Name:  ]]
                    for _, v687 in pairs(v685.Objects) do
                        if v687 and v687.Parent then
                            v687:Destroy();
                        end;
                    end;
                    v685.Objects = {};
                end;
                l_v641_0.InputHandler:RegisterKeybind("WalkSpeed", function(v688) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref)
                    l_v641_0.WalkSpeed:Toggle(v688);
                end);
                local _ = v671:AddToggle("WalkspeedEnabled", {
                    Title = "Enable Speed Modifier", 
                    Default = l_v641_0.WalkSpeed.Enabled, 
                    Callback = function(v689) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.WalkSpeed.Enabled = v689;
                        v175.WalkspeedEnabled = v689;
                        v31:ExportSettings();
                        if not v689 then
                            l_v641_0.WalkSpeed:Toggle(false);
                        end;
                    end
                });
                v671:AddKeybind("WalkspeedKeybind", {
                    Title = "Speed Modifier Keybind", 
                    Description = "Press key to toggle Speed Modifier when enabled", 
                    Default = l_v641_0.WalkSpeed.KeyBind, 
                    Mode = "Toggle", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end, 
                    ChangedCallback = function(v691) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        local v692;
                        if typeof(v691) == "EnumItem" then
                            v692 = tostring(v691):match("%w+$");
                        elseif typeof(v691) == "string" then
                            v692 = v691;
                        else
                            local v693 = tostring(v691);
                            v692 = v693:match("%.([^.]+)$") or v693;
                        end;
                        l_v641_0.WalkSpeed.KeyBind = v692;
                        v175.WalkspeedKeybind = v692;
                        v31:ExportSettings();
                    end
                });
                v671:AddSlider("WalkspeedSlider", {
                    Title = "Walkspeed", 
                    Default = l_v641_0.WalkSpeed.Value, 
                    Min = 1, 
                    Max = 200, 
                    Rounding = 1, 
                    Callback = function(v694) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.WalkSpeed.Value = v694;
                        v175.WalkspeedValue = v694;
                        v31:ExportSettings();
                    end
                });
                local v695 = l_v50_0.Player:AddSection("Sliding");
                l_v641_0.Sliding.StartSlide = function(v696) --[[ Line: 0 ]] --[[ Name:  ]]
                    if not v696.CanSlide or not v696.Enabled or v696.Active then
                        return;
                    else
                        v696.Active = true;
                        v696.CanSlide = false;
                        v696.CurrentTimer = v696.Duration;
                        v696.CurrentCooldown = v696.Cooldown;
                        return;
                    end;
                end;
                l_v641_0.InputHandler:RegisterKeybind("Sliding", function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref)
                    if l_v641_0.WalkSpeed.Active then
                        l_v641_0.Sliding:StartSlide();
                    end;
                end);
                v695:AddToggle("SlidingEnabled", {
                    Title = "Enable Sliding", 
                    Default = l_v641_0.Sliding.Enabled, 
                    Callback = function(v697) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Sliding.Enabled = v697;
                        v175.SlidingEnabled = v697;
                        v31:ExportSettings();
                        if not v697 then
                            l_v641_0.Sliding.Active = false;
                        end;
                    end
                });
                v695:AddKeybind("SlideKeybind", {
                    Title = "Slide Keybind", 
                    Description = "Press key while moving to slide", 
                    Default = l_v641_0.Sliding.KeyBind, 
                    Mode = "Press", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end, 
                    ChangedCallback = function(v698) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        local v699;
                        if typeof(v698) == "EnumItem" then
                            v699 = tostring(v698):match("%w+$");
                        elseif typeof(v698) == "string" then
                            v699 = v698;
                        else
                            local v700 = tostring(v698);
                            v699 = v700:match("%.([^.]+)$") or v700;
                        end;
                        l_v641_0.Sliding.KeyBind = v699;
                        v175.SlideKeybind = v699;
                        v31:ExportSettings();
                    end
                });
                v695:AddSlider("SlideMultiplier", {
                    Title = "Slide Speed Multiplier", 
                    Description = "How much faster you go while sliding", 
                    Default = l_v641_0.Sliding.Multiplier, 
                    Min = 1, 
                    Max = 3, 
                    Rounding = 1, 
                    Callback = function(v701) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Sliding.Multiplier = v701;
                        v175.SlideMultiplier = v701;
                        v31:ExportSettings();
                    end
                });
                v695:AddSlider("SlideDuration", {
                    Title = "Slide Duration", 
                    Description = "How long each slide lasts (seconds)", 
                    Default = l_v641_0.Sliding.Duration, 
                    Min = 0.5, 
                    Max = 3, 
                    Rounding = 1, 
                    Callback = function(v702) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Sliding.Duration = v702;
                        v175.SlideDuration = v702;
                        v31:ExportSettings();
                    end
                });
                v695:AddSlider("SlideCooldown", {
                    Title = "Slide Cooldown", 
                    Description = "Time between slides (seconds)", 
                    Default = l_v641_0.Sliding.Cooldown, 
                    Min = 0, 
                    Max = 5, 
                    Rounding = 1, 
                    Callback = function(v703) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Sliding.Cooldown = v703;
                        v175.SlideCooldown = v703;
                        v31:ExportSettings();
                    end
                });
                local v704 = l_v50_0.Player:AddSection("No Clip");
                l_v641_0.NoClip.Toggle = function(v705, v706) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_8_0 (ref), l_l_RunService_5_0 (ref)
                    if v706 == nil then
                        v706 = not v705.Active;
                    end;
                    v705.Active = v706;
                    local l_Character_14 = l_l_LocalPlayer_8_0.Character;
                    if v705.Connection then
                        v705.Connection:Disconnect();
                        v705.Connection = nil;
                    end;
                    if v705.CharacterAddedConnection then
                        v705.CharacterAddedConnection:Disconnect();
                        v705.CharacterAddedConnection = nil;
                    end;
                    if v705.Active then
                        v705.Connection = l_l_RunService_5_0.Heartbeat:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_Character_14 (ref)
                            if not l_Character_14 or not l_Character_14:IsDescendantOf(workspace) then
                                return;
                            else
                                for _, v709 in pairs(l_Character_14:GetDescendants()) do
                                    if v709:IsA("BasePart") then
                                        v709.CanCollide = false;
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v705.CharacterAddedConnection = l_l_LocalPlayer_8_0.CharacterAdded:Connect(function(v710) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_Character_14 (ref), v705 (ref)
                            l_Character_14 = v710;
                            task.wait(0.1);
                            if v705.Active then
                                for _, v712 in pairs(l_Character_14:GetDescendants()) do
                                    if v712:IsA("BasePart") then
                                        v712.CanCollide = false;
                                    end;
                                end;
                            end;
                        end);
                    elseif l_Character_14 and l_Character_14:IsDescendantOf(workspace) then
                        for _, v714 in pairs(l_Character_14:GetDescendants()) do
                            if v714:IsA("BasePart") then
                                v714.CanCollide = true;
                            end;
                        end;
                    end;
                end;
                l_v641_0.InputHandler:RegisterKeybind("NoClip", function(v715) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref)
                    if l_v641_0.NoClip.Enabled then
                        l_v641_0.NoClip:Toggle(v715);
                    end;
                end);
                local _ = v704:AddToggle("NoClipEnabled", {
                    Title = "Enable No Clip", 
                    Default = l_v641_0.NoClip.Enabled, 
                    Callback = function(v716) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.NoClip.Enabled = v716;
                        v175.NoClipEnabled = v716;
                        v31:ExportSettings();
                        if not v716 then
                            l_v641_0.NoClip:Toggle(false);
                        end;
                    end
                });
                v704:AddKeybind("NoClipKeybind", {
                    Title = "No Clip Keybind", 
                    Description = "Press key to toggle No Clip when enabled", 
                    Default = l_v641_0.NoClip.KeyBind, 
                    Mode = "Toggle", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end, 
                    ChangedCallback = function(v718) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        local v719;
                        if typeof(v718) == "EnumItem" then
                            v719 = tostring(v718):match("%w+$");
                        elseif typeof(v718) == "string" then
                            v719 = v718;
                        else
                            local v720 = tostring(v718);
                            v719 = v720:match("%.([^.]+)$") or v720;
                        end;
                        l_v641_0.NoClip.KeyBind = v719;
                        v175.NoClipKeybind = v719;
                        v31:ExportSettings();
                    end
                });
                local v721 = l_v50_0.Player:AddSection("Flying");
                l_v641_0.Flying.CleanupParts = function(v722) --[[ Line: 0 ]] --[[ Name:  ]]
                    for _, v724 in pairs(v722.Parts) do
                        if v724 and v724.Parent then
                            v724:Destroy();
                        end;
                    end;
                    v722.Parts = {};
                end;
                l_v641_0.Flying.SetupFlying = function(v725, v726) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_RunService_5_0 (ref), l_l_UserInputService_3_0 (ref)
                    if not v726 then
                        return;
                    else
                        local v727 = v726:WaitForChild("HumanoidRootPart", 2);
                        if not v727 then
                            return;
                        else
                            v725:CleanupParts();
                            local l_BodyGyro_0 = Instance.new("BodyGyro");
                            l_BodyGyro_0.Name = "FlyGyro";
                            l_BodyGyro_0.P = 9000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
                            l_BodyGyro_0.CFrame = v727.CFrame;
                            l_BodyGyro_0.Parent = v727;
                            table.insert(v725.Parts, l_BodyGyro_0);
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.Name = "FlyVelocity";
                            l_BodyVelocity_0.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                            l_BodyVelocity_0.P = 1250;
                            l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0);
                            l_BodyVelocity_0.Parent = v727;
                            table.insert(v725.Parts, l_BodyVelocity_0);
                            if v725.Connection then
                                v725.Connection:Disconnect();
                            end;
                            v725.Connection = l_l_RunService_5_0.Heartbeat:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v725 (ref), v727 (ref), l_BodyGyro_0 (ref), l_l_UserInputService_3_0 (ref), l_BodyVelocity_0 (ref)
                                if not v725.Active then
                                    v725:Toggle(false);
                                    return;
                                else
                                    local l_CurrentCamera_5 = workspace.CurrentCamera;
                                    if not l_CurrentCamera_5 or not v727 or not v727.Parent then
                                        return;
                                    else
                                        if l_BodyGyro_0 and l_BodyGyro_0.Parent then
                                            l_BodyGyro_0.CFrame = CFrame.new(v727.Position, v727.Position + l_CurrentCamera_5.CFrame.LookVector);
                                        end;
                                        local v731 = Vector3.new(0, 0, 0);
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.W) then
                                            v731 = v731 + l_CurrentCamera_5.CFrame.LookVector;
                                        end;
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.S) then
                                            v731 = v731 - l_CurrentCamera_5.CFrame.LookVector;
                                        end;
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.A) then
                                            v731 = v731 - l_CurrentCamera_5.CFrame.RightVector;
                                        end;
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.D) then
                                            v731 = v731 + l_CurrentCamera_5.CFrame.RightVector;
                                        end;
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.Space) then
                                            v731 = v731 + Vector3.new(0, 1, 0);
                                        end;
                                        if l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_l_UserInputService_3_0:IsKeyDown(Enum.KeyCode.LeftShift) then
                                            v731 = v731 - Vector3.new(0, 1, 0);
                                        end;
                                        if v731.Magnitude > 0 then
                                            v731 = v731.Unit;
                                        end;
                                        if l_BodyVelocity_0 and l_BodyVelocity_0.Parent then
                                            l_BodyVelocity_0.Velocity = v731 * v725.Speed;
                                        end;
                                        return;
                                    end;
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
                l_v641_0.Flying.Toggle = function(v732, v733) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_LocalPlayer_8_0 (ref)
                    if v733 == nil then
                        v733 = not v732.Active;
                    end;
                    v732.Active = v733;
                    local v734 = l_l_LocalPlayer_8_0.Character or l_l_LocalPlayer_8_0.CharacterAdded:Wait();
                    if v732.Active then
                        if v732.CharacterAddedConnection then
                            v732.CharacterAddedConnection:Disconnect();
                        end;
                        v732:SetupFlying(v734);
                        v732.CharacterAddedConnection = l_l_LocalPlayer_8_0.CharacterAdded:Connect(function(v735) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v732 (ref)
                            task.wait(0.5);
                            if v732.Active then
                                v732:SetupFlying(v735);
                            end;
                        end);
                    else
                        if v732.Connection then
                            v732.Connection:Disconnect();
                            v732.Connection = nil;
                        end;
                        if v732.CharacterAddedConnection then
                            v732.CharacterAddedConnection:Disconnect();
                            v732.CharacterAddedConnection = nil;
                        end;
                        v732:CleanupParts();
                    end;
                end;
                l_v641_0.InputHandler:RegisterKeybind("Flying", function(v736) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_v641_0 (ref)
                    if l_v641_0.Flying.Enabled then
                        l_v641_0.Flying:Toggle(v736);
                    end;
                end);
                local _ = v721:AddToggle("FlyingEnabled", {
                    Title = "Enable Flying", 
                    Default = l_v641_0.Flying.Enabled, 
                    Callback = function(v737) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Flying.Enabled = v737;
                        v175.FlyingEnabled = v737;
                        v31:ExportSettings();
                        if not v737 then
                            l_v641_0.Flying:Toggle(false);
                        end;
                    end
                });
                v721:AddKeybind("FlyingKeybind", {
                    Title = "Flying Keybind", 
                    Description = "Press key to toggle Flying when enabled", 
                    Default = l_v641_0.Flying.KeyBind, 
                    Mode = "Toggle", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end, 
                    ChangedCallback = function(v739) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        local v740;
                        if typeof(v739) == "EnumItem" then
                            v740 = tostring(v739):match("%w+$");
                        elseif typeof(v739) == "string" then
                            v740 = v739;
                        else
                            local v741 = tostring(v739);
                            v740 = v741:match("%.([^.]+)$") or v741;
                        end;
                        l_v641_0.Flying.KeyBind = v740;
                        v175.FlyingKeybind = v740;
                        v31:ExportSettings();
                    end
                });
                v721:AddSlider("FlyingSpeedSlider", {
                    Title = "Flying Speed", 
                    Default = l_v641_0.Flying.Speed, 
                    Min = 1, 
                    Max = 200, 
                    Rounding = 1, 
                    Callback = function(v742) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v641_0 (ref), v175 (ref), v31 (ref)
                        l_v641_0.Flying.Speed = v742;
                        v175.FlyingSpeed = v742;
                        v31:ExportSettings();
                    end
                });
                v721:AddParagraph({
                    Title = "Flying Controls", 
                    Content = "W/A/S/D - Move horizontally\nSpace - Move up\nShift/Ctrl - Move down"
                });
                task.wait(0.1);
            end;
        end;
        if v10 or getfenv().Drawing and getfenv().Drawing.new then
            l_v50_0.Visuals = l_l_CreateWindow_0_0:AddTab({
                Title = "Visuals", 
                Icon = "eye"
            });
            task.wait(0.1);
            l_v50_0.Visuals:AddParagraph({
                Title = string.format("%s", string.format(v44[os.date("*t").month], "Luasec")), 
                Content = "Luasec\nhttps://discord.gg/luasec"
            });
            local v751 = {
                enabled = false, 
                strength = 0.5, 
                connection = nil, 
                Toggle = function(v743, v744) --[[ Line: 0 ]] --[[ Name:  ]]
                    v743.enabled = v744;
                    if v743.connection then
                        v743.connection:Disconnect();
                        v743.connection = nil;
                    end;
                    if v744 then
                        local l_RunService_6 = game:GetService("RunService");
                        local l_Camera_0 = game.Workspace.Camera;
                        do
                            local l_l_Camera_0_0 = l_Camera_0;
                            v743.connection = l_RunService_6.RenderStepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v743 (ref), l_l_Camera_0_0 (ref)
                                local v748 = CFrame.new(0, 0, 0, 1, 0, 0, 0, v743.strength, 0, 0, 0, 1);
                                l_l_Camera_0_0.CFrame = l_l_Camera_0_0.CFrame * v748;
                            end);
                        end;
                    end;
                end, 
                SetStrength = function(v749, v750) --[[ Line: 0 ]] --[[ Name:  ]]
                    v749.strength = v750;
                end, 
                enabled = v175.ResolutionChangerEnabled, 
                strength = v175.ResolutionChangerStrength
            };
            v751:Toggle(v751.enabled);
            local v752 = l_v50_0.Visuals:AddSection("Resolution Changer");
            do
                local l_v751_0 = v751;
                v752:AddToggle("ResolutionChangerEnabled", {
                    Title = "Enable Resolution Changer", 
                    Default = v175.ResolutionChangerEnabled, 
                    Callback = function(v754) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_v751_0 (ref), v31 (ref)
                        v175.ResolutionChangerEnabled = v754;
                        l_v751_0:Toggle(v754);
                        v31:ExportSettings();
                    end
                });
                v752:AddSlider("ResolutionChangerStrength", {
                    Title = "Resolution Strength", 
                    Default = v175.ResolutionChangerStrength, 
                    Min = 0.1, 
                    Max = 1, 
                    Rounding = 2, 
                    Callback = function(v755) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), l_v751_0 (ref), v31 (ref)
                        v175.ResolutionChangerStrength = v755;
                        l_v751_0:SetStrength(v755);
                        v31:ExportSettings();
                    end
                });
                local v756 = l_v50_0.Visuals:AddSection("ESP");
                local l_Players_6 = game:GetService("Players");
                local l_LocalPlayer_9 = l_Players_6.LocalPlayer;
                local v759 = false;
                local v760 = {};
                local function v763(v761) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_Players_6 (ref)
                    local _ = l_Players_6.LocalPlayer;
                    return v761.Character and v761.Character:FindFirstChild("HumanoidRootPart") and v761.Character.HumanoidRootPart:FindFirstChild("TeammateLabel");
                end;
                local function v767(v764) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_LocalPlayer_9 (ref), v760 (ref), v759 (ref), v763 (ref)
                    if v764 == l_LocalPlayer_9 then
                        return;
                    else
                        local v765 = v760[v764.Name];
                        if not v765 then
                            v765 = Instance.new("Highlight");
                            v765.Name = "PlayerHighlight_" .. v764.Name;
                            v765.FillColor = Color3.fromRGB(255, 0, 0);
                            v765.OutlineColor = Color3.new(1, 1, 1);
                            v765.OutlineTransparency = 0;
                            v765.FillTransparency = 0.5;
                            v765.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
                            v765.Enabled = true;
                            v760[v764.Name] = v765;
                        end;
                        local function v766() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v764 (ref), v765 (ref), v759 (ref), v763 (ref)
                            if v764.Character then
                                v765.Adornee = v764.Character;
                                if v759 and v763(v764) then
                                    v765.Enabled = false;
                                else
                                    v765.Enabled = true;
                                end;
                                v765.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
                            else
                                v765.Adornee = nil;
                            end;
                        end;
                        v766();
                        v764.CharacterAdded:Connect(v766);
                        v764.CharacterRemoving:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v765 (ref)
                            v765.Adornee = nil;
                        end);
                        return v765;
                    end;
                end;
                local function v771() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_Players_6 (ref), l_LocalPlayer_9 (ref), v767 (ref)
                    for _, v769 in pairs(l_Players_6:GetPlayers()) do
                        if v769 ~= l_LocalPlayer_9 then
                            local v770 = v767(v769);
                            if esp_enabled then
                                v770.Parent = game.CoreGui;
                            end;
                        end;
                    end;
                end;
                local function _() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v760 (ref)
                    for v772, v773 in pairs(v760) do
                        v773.Parent = nil;
                        v760[v772] = nil;
                    end;
                end;
                l_Players_6.PlayerAdded:Connect(function(v775) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_LocalPlayer_9 (ref), v767 (ref)
                    if v775 ~= l_LocalPlayer_9 then
                        local v776 = v767(v775);
                        if esp_enabled then
                            v776.Parent = game.CoreGui;
                        end;
                    end;
                end);
                l_Players_6.PlayerRemoving:Connect(function(v777) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v760 (ref)
                    if v760[v777.Name] then
                        v760[v777.Name]:Destroy();
                        v760[v777.Name] = nil;
                    end;
                end);
                local v778 = false;
                local function v781() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v760 (ref), v175 (ref), v763 (ref), l_Players_6 (ref)
                    for _, v780 in pairs(v760) do
                        v780.FillColor = v175.BoxColor;
                        v780.OutlineColor = v175.TracerColor;
                        v780.FillTransparency = v175.BoxFillTransparency;
                        v780.OutlineTransparency = v175.BoxOutlineTransparency;
                        v780.Enabled = v175.ESPEnabled and (not v175.TeamCheck or not v763(l_Players_6:FindFirstChild(v780.Name)));
                        v780.Parent = v175.ESPEnabled and game.CoreGui or nil;
                    end;
                end;
                v756:AddToggle("ESPToggle", {
                    Title = "ESP Toggle", 
                    Description = "Enables player ESP highlights", 
                    Default = v175.ESPEnabled, 
                    Callback = function(v782) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v781 (ref), v771 (ref)
                        v175.ESPEnabled = v782;
                        v781();
                        if v782 then
                            v771();
                        end;
                    end
                });
                v756:AddToggle("TeamToggle", {
                    Title = "Team Check", 
                    Description = "Don't highlight teammates", 
                    Default = v175.TeamCheck, 
                    Callback = function(v783) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v781 (ref)
                        v175.TeamCheck = v783;
                        v781();
                    end
                });
                v756:AddSlider("FillTransparencySlider", {
                    Title = "Fill Transparency", 
                    Description = "Adjust fill transparency", 
                    Default = v175.BoxFillTransparency, 
                    Min = 0, 
                    Max = 1, 
                    Rounding = 2, 
                    Callback = function(v784) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v760 (ref)
                        v175.BoxFillTransparency = v784;
                        for _, v786 in pairs(v760) do
                            v786.FillTransparency = v784;
                        end;
                    end
                });
                v756:AddSlider("OutlineTransparencySlider", {
                    Title = "Outline Transparency", 
                    Description = "Adjust outline transparency", 
                    Default = v175.BoxOutlineTransparency, 
                    Min = 0, 
                    Max = 1, 
                    Rounding = 2, 
                    Callback = function(v787) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v760 (ref)
                        v175.BoxOutlineTransparency = v787;
                        for _, v789 in pairs(v760) do
                            v789.OutlineTransparency = v787;
                        end;
                    end
                });
                v756:AddColorpicker("FillColorpicker", {
                    Title = "Fill Color", 
                    Description = "Choose the ESP fill color", 
                    Default = v175.BoxColor, 
                    Callback = function(v790) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v760 (ref)
                        v175.BoxColor = v790;
                        for _, v792 in pairs(v760) do
                            v792.FillColor = v790;
                        end;
                    end
                });
                v756:AddColorpicker("OutlineColorpicker", {
                    Title = "Outline Color", 
                    Description = "Choose the ESP outline color", 
                    Default = v175.TracerColor, 
                    Callback = function(v793) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v760 (ref)
                        v175.TracerColor = v793;
                        for _, v795 in pairs(v760) do
                            v795.OutlineColor = v793;
                        end;
                    end
                });
                v756:AddKeybind("ESPKeybind", {
                    Title = "Toggle ESP Key", 
                    Description = "Toggles ESP on/off", 
                    Mode = "Toggle", 
                    Default = "E", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v781 (ref), v771 (ref)
                        v175.ESPEnabled = not v175.ESPEnabled;
                        v781();
                        if v175.ESPEnabled then
                            v771();
                        end;
                    end
                });
                spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v778 (ref), l_Players_6 (ref), l_LocalPlayer_9 (ref), v767 (ref)
                    while wait(0.3) do
                        if v778 then
                            for _, v797 in pairs(l_Players_6:GetPlayers()) do
                                if v797 ~= l_LocalPlayer_9 then
                                    local v798 = v767(v797);
                                    if v798.Parent ~= game.CoreGui then
                                        v798.Parent = game.CoreGui;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                v771();
                local v799 = l_v50_0.Visuals:AddSection("FoV");
                v799:AddToggle("FoV", {
                    Title = "FoV", 
                    Description = "Graphically Displays the FoV Radius", 
                    Default = v175.FoV
                }):OnChanged(function(v800) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref), v43 (ref), v60 (ref)
                    v175.FoV = v800;
                    if not v43 then
                        v60 = v800;
                    end;
                end);
                if v43 then
                    local v802 = v799:AddKeybind("FoVKey", {
                        Title = "FoV Key", 
                        Description = "Changes the FoV Key", 
                        Default = v175.FoVKey, 
                        ChangedCallback = function(v801) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v175 (ref)
                            v175.FoVKey = v801;
                        end
                    });
                    v175.FoVKey = v802.Value ~= "RMB" and Enum.KeyCode[v802.Value] or Enum.UserInputType.MouseButton2;
                end;
                v799:AddSlider("FoVThickness", {
                    Title = "FoV Thickness", 
                    Description = "Changes the FoV Thickness", 
                    Default = v175.FoVThickness, 
                    Min = 1, 
                    Max = 10, 
                    Rounding = 1, 
                    Callback = function(v803) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref)
                        v175.FoVThickness = v803;
                    end
                });
                v799:AddSlider("FoVOpacity", {
                    Title = "FoV Opacity", 
                    Description = "Changes the FoV Opacity", 
                    Default = v175.FoVOpacity, 
                    Min = 0.1, 
                    Max = 1, 
                    Rounding = 1, 
                    Callback = function(v804) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref)
                        v175.FoVOpacity = v804;
                    end
                });
                v799:AddToggle("FoVFilled", {
                    Title = "FoV Filled", 
                    Description = "Makes the FoV Filled", 
                    Default = v175.FoVFilled
                }):OnChanged(function(v805) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref)
                    v175.FoVFilled = v805;
                end);
                v799:AddColorpicker("FoVColour", {
                    Title = "FoV Colour", 
                    Description = "Changes the FoV Colour", 
                    Default = v175.FoVColour, 
                    Callback = function(v806) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref)
                        v175.FoVColour = v806;
                    end
                });
                local v807 = l_v50_0.Misc:AddSection("Skin Changer");
                v807:AddParagraph({
                    Title = "Skin Model Changer", 
                    Content = ""
                });
                task.wait(0.1);
                local v808 = {};
                local v809 = nil;
                local function v813(v810) --[[ Line: 0 ]] --[[ Name:  ]]
                    if not v810 then
                        return nil;
                    else
                        local l_status_12, l_result_12 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v810 (ref)
                            return v810;
                        end);
                        return l_status_12 and l_result_12 or nil;
                    end;
                end;
                local l_status_13, l_result_13 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    return game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Weapons;
                end);
                if l_status_13 and l_result_13 then
                    v809 = l_result_13;
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v813 (ref), v809 (ref), v808 (ref)
                        local v816 = {
                            ["Spooky Skin Case"] = "Spooky Skin Case", 
                            ["Skin Case 2"] = "Skin Case 2", 
                            ["Skin Case"] = "Skin Case", 
                            Other = "Other", 
                            ["Festive Skin Case"] = "Festive Skin Case", 
                            ["Skin Case 3"] = "Skin Case 3"
                        };
                        for v817, v818 in pairs(v816) do
                            do
                                local l_v817_0, l_v818_0 = v817, v818;
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v813 (ref), v809 (ref), l_v818_0 (ref), v808 (ref), l_v817_0 (ref)
                                    local v821 = v813(v809:FindFirstChild(l_v818_0));
                                    if v821 then
                                        v808[l_v817_0] = v821;
                                    end;
                                end);
                            end;
                        end;
                    end);
                end;
                if not next(v808) then
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v813 (ref), v808 (ref)
                        local v822 = {
                            ["Spooky Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Spooky Skin Case"], 
                            ["Skin Case 2"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case 2"], 
                            ["Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case"], 
                            Other = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Other, 
                            ["Festive Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Festive Skin Case"], 
                            ["Skin Case 3"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case 3"]
                        };
                        for v823, v824 in pairs(v822) do
                            do
                                local l_v823_0, l_v824_0 = v823, v824;
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v813 (ref), l_v824_0 (ref), v808 (ref), l_v823_0 (ref)
                                    local v827 = v813(l_v824_0);
                                    if v827 then
                                        v808[l_v823_0] = v827;
                                    end;
                                end);
                            end;
                        end;
                    end);
                end;
                if not next(v808) then
                    warn("No skin folders found through either dynamic or hardcoded paths. Skin changer functionality may be limited.");
                end;
                local v828 = {
                    ["Assault Rifle"] = {
                        "AK-47", 
                        "AKEY-47", 
                        "Boneclaw Rifle", 
                        "AUG", 
                        "Phoenix Rifle", 
                        "Gingerbread AUG", 
                        "Tommy Gun"
                    }, 
                    ["Battle Axe"] = {
                        "The Shred", 
                        "Nordic Axe", 
                        "Ban Axe"
                    }, 
                    ["Burst Rifle"] = {
                        "Aqua Burst", 
                        "Electro Rifle", 
                        "Pixel Burst", 
                        "Pine Burst", 
                        "Spectral Burst", 
                        "FAMAS"
                    }, 
                    Chainsaw = {
                        "Blobsaw"
                    }, 
                    Bow = {
                        "Compound Bow", 
                        "Bat Bow"
                    }, 
                    Crossbow = {
                        "Pixel Crossbow", 
                        "Frostbite Crossbow"
                    }, 
                    Daggers = {
                        "Aces", 
                        "Cookies"
                    }, 
                    ["Energy Rifle"] = {
                        "2025 Energy Rifle", 
                        "Apex Rifle", 
                        "Hacker Rifle", 
                        "Hydro Rifle"
                    }, 
                    ["Energy Pistols"] = {
                        "2025 Energy Pistols", 
                        "Apex Pistols", 
                        "Hacker Pistols", 
                        "Void Pistols"
                    }, 
                    Exogun = {
                        "Ray Gun", 
                        "Singularity", 
                        "Wondergun", 
                        "Repulsor", 
                        "Exogourd", 
                        "Midnight Festive Exogun"
                    }, 
                    Fists = {
                        "Boxing Gloves", 
                        "Brass Knuckles", 
                        "Pumpkin Claws", 
                        "Festive Fists", 
                        "Fists of Hurt"
                    }, 
                    Flamethrower = {
                        "Lamethrower", 
                        "Pixel Flamethrower", 
                        "Snowblower", 
                        "Glitterthrower"
                    }, 
                    ["Flare Gun"] = {
                        "Dynamite Gun", 
                        "Firework Gun", 
                        "Banana Flare", 
                        "Wrapped Flare Gun", 
                        "Vexed Flare Gun"
                    }, 
                    ["Freeze Ray"] = {
                        "Bubble Ray", 
                        "Temporal Ray", 
                        "Spider Ray", 
                        "Gum Ray", 
                        "Wrapped Freeze Ray"
                    }, 
                    Grenade = {
                        "Water Balloon", 
                        "Whoopee Cushion", 
                        "Soul Grenade", 
                        "Jingle Grenade", 
                        "Dynamite"
                    }, 
                    ["Grenade Launcher"] = {
                        "Swashbuckler", 
                        "Uranium Launcher", 
                        "Skull Launcher", 
                        "Snowball Launcher", 
                        "Gearnade Launcher"
                    }, 
                    Gunblade = {
                        "Hyper Gunblade", 
                        "Crude Gunblade", 
                        "Elf's Gunblade"
                    }, 
                    Handgun = {
                        "Blaster", 
                        "Pixel Handgun", 
                        "Pumpkin Handgun", 
                        "Gingerbread Handgun", 
                        "Gumball Handgun"
                    }, 
                    Katana = {
                        "Lightning Bolt", 
                        "Saber", 
                        "Pixel Katana", 
                        "Devil's Trident", 
                        "2025 Katana", 
                        "Keytana", 
                        "Stellar Katana"
                    }, 
                    Knife = {
                        "Chancla", 
                        "Karambit", 
                        "Machete", 
                        "Candy Cane", 
                        "Balisong"
                    }, 
                    Minigun = {
                        "Lasergun 3000", 
                        "Pixel Minigun", 
                        "Wrapped Minigun", 
                        "Pumpkin Minigun", 
                        "Fighter Jet"
                    }, 
                    ["Riot Shield"] = {
                        "Energy Shield", 
                        "Door", 
                        "Sled", 
                        ""
                    }, 
                    Molotov = {
                        "Coffee", 
                        "Torch", 
                        "Vexed Candle", 
                        "Lava Lamp"
                    }, 
                    ["Paintball Gun"] = {
                        "Boba Gun", 
                        "Slime Gun", 
                        "Brain Gun", 
                        "Snowball Gun", 
                        "Ketchup Gun"
                    }, 
                    Revolver = {
                        "Boneclaw Revolver"
                    }, 
                    RPG = {
                        "Nuke Launcher"
                    }, 
                    Scythe = {
                        "Anchor", 
                        "Keythe", 
                        "Scythe of Death", 
                        "Bat Scythe", 
                        "Cryo Scythe", 
                        "Sakura Scythe"
                    }, 
                    Shorty = {
                        "Lovely Shorty", 
                        "Not So Shorty", 
                        "Too Shorty", 
                        "Demon Shorty", 
                        "Balloon Shorty", 
                        "Wrapped Shorty"
                    }, 
                    Shotgun = {
                        "Balloon Shotgun", 
                        "Hyper Shotgun", 
                        "Wrapped Shotgun", 
                        "Broomstick"
                    }, 
                    Slingshot = {
                        "Goalpost", 
                        "Stick", 
                        "Boneshot", 
                        "Reindeer Slingshot"
                    }, 
                    ["Smoke Grenade"] = {
                        "Balance", 
                        "Emoji Cloud", 
                        "Eyeball", 
                        "Hourglass", 
                        "Snowglobe"
                    }, 
                    Sniper = {
                        "Hyper Sniper", 
                        "Pixel Sniper", 
                        "Keyper", 
                        "Gingerbread Sniper", 
                        "Eyething Sniper", 
                        "Event Horizon"
                    }, 
                    ["Subspace Tripmine"] = {
                        "Don't Press", 
                        "Spring", 
                        "DIY Tripmine", 
                        "Dev-in-the-Box", 
                        "Trick or Treat"
                    }, 
                    Spray = {
                        "Lovely Spray", 
                        "Pine Spray", 
                        "Nail Gun"
                    }, 
                    Trowel = {
                        "Garden Shovel", 
                        "Plastic Shovel", 
                        "Snow Shovel", 
                        "Pumpkin Carver", 
                        "Paintbrush"
                    }, 
                    Uzi = {
                        "Electro Uzi", 
                        "Water Uzi", 
                        "Pine Uzi", 
                        "Demon Uzi", 
                        "Money Gun"
                    }, 
                    Flashbang = {
                        "Camera", 
                        "Disco Ball", 
                        "Pixel Flashbang", 
                        "Skullbang", 
                        "Lightbulb", 
                        "Shining Star"
                    }, 
                    Medkit = {
                        "Briefcase", 
                        "Laptop", 
                        "Medkitty", 
                        "Sandwich", 
                        "Bucket of Candy"
                    }, 
                    ["Jump Pad"] = {
                        "Bounce House"
                    }, 
                    ["War Horn"] = {
                        "Trumpet", 
                        "Mammoth Horn", 
                        "Megaphone"
                    }
                };
                local v829 = {};
                for v830, _ in pairs(v828) do
                    table.insert(v829, v830);
                end;
                table.sort(v829);
                local v832 = "No Weapons Found";
                if v175.SelectedBaseWeapon and table.find(v829, v175.SelectedBaseWeapon) then
                    v832 = v175.SelectedBaseWeapon;
                elseif #v829 > 0 then
                    v832 = v829[1];
                    v175.SelectedBaseWeapon = v832;
                else
                    v175.SelectedBaseWeapon = v832;
                end;
                local v833 = v828[v832] or {};
                local v834 = "No Skins Found";
                if v175.SelectedSkin and table.find(v833, v175.SelectedSkin) then
                    v834 = v175.SelectedSkin;
                elseif #v833 > 0 then
                    v834 = v833[1];
                    v175.SelectedSkin = v834;
                else
                    v175.SelectedSkin = v834;
                end;
                local v835 = nil;
                local _ = v807:AddDropdown("BaseWeaponSelect", {
                    Title = "Select Base Weapon", 
                    Description = "Choose the weapon to change the skin for", 
                    Values = v829, 
                    Default = v832, 
                    Callback = function(v836) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v832 (ref), v175 (ref), v828 (ref), v834 (ref), v835 (ref), v31 (ref)
                        v832 = v836;
                        v175.SelectedBaseWeapon = v836;
                        local v837 = v828[v832] or {};
                        if #v837 > 0 then
                            v834 = v837[1];
                            v835:SetValues(v837);
                            v835:SetValue(v834);
                            v175.SelectedSkin = v834;
                        else
                            v834 = "No Skins Found";
                            v835:SetValues({
                                "No Skins Found"
                            });
                            v835:SetValue(v834);
                            v175.SelectedSkin = v834;
                        end;
                        v31:ExportSettings();
                    end
                });
                v833 = v828[v832] or {
                    "No Skins Found"
                };
                v835 = v807:AddDropdown("SkinSelect", {
                    Title = "Select Skin", 
                    Description = "Choose which skin model to apply", 
                    Values = v833, 
                    Default = v834, 
                    Callback = function(v839) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v834 (ref), v175 (ref), v31 (ref)
                        v834 = v839;
                        v175.SelectedSkin = v839;
                        v31:ExportSettings();
                    end
                });
                local v840 = nil;
                local l_status_14, l_result_14 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    return game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Weapons;
                end);
                if l_status_14 and l_result_14 then
                    v840 = l_result_14;
                else
                    warn("ViewModels folder not found. Creating temporary folder...");
                    v840 = Instance.new("Folder");
                    v840.Name = "Weapons";
                    v840.Parent = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels or game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Assets") or game:GetService("Players").LocalPlayer.PlayerScripts;
                end;
                local v843 = nil;
                local function v846() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v843 (ref), v840 (ref)
                    if v843 and v843.Parent then
                        return v843;
                    else
                        local l_status_15, l_result_15 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v843 (ref), v840 (ref)
                            v843 = v840:FindFirstChild("OriginalBackups");
                            if not v843 then
                                v843 = Instance.new("Folder");
                                v843.Name = "OriginalBackups";
                                v843.Parent = v840;
                            end;
                            return v843;
                        end);
                        if not l_status_15 then
                            warn("Failed to create backup folder:", l_result_15);
                            return nil;
                        else
                            return l_result_15;
                        end;
                    end;
                end;
                local function v853(v847) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v808 (ref)
                    if not v847 then
                        return nil;
                    else
                        for _, v849 in pairs(v808) do
                            do
                                local l_v849_0 = v849;
                                if l_v849_0 then
                                    local l_status_16, l_result_16 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v849_0 (ref), v847 (ref)
                                        if l_v849_0:IsA("Folder") then
                                            return l_v849_0:FindFirstChild(v847);
                                        else
                                            return nil;
                                        end;
                                    end);
                                    if l_status_16 and l_result_16 then
                                        return l_result_16;
                                    end;
                                end;
                            end;
                        end;
                        warn("Skin model not found: " .. v847);
                        return nil;
                    end;
                end;
                v807:AddButton({
                    Title = "Apply Skin Model", 
                    Description = "Apply selected skin model to the base weapon", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v832 (ref), v834 (ref), v50 (ref), v840 (ref), v853 (ref), v846 (ref)
                        if v832 == "No Weapons Found" or v834 == "No Skins Found" then
                            v50:Notify({
                                Title = "Error", 
                                Content = "Please select a valid weapon and skin.", 
                                Duration = 3
                            });
                            return;
                        else
                            local l_v840_FirstChild_0 = v840:FindFirstChild(v832);
                            if not l_v840_FirstChild_0 or not l_v840_FirstChild_0:IsA("Model") then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "Weapon model not found for " .. v832, 
                                    Duration = 3
                                });
                                return;
                            else
                                local v855 = v853(v834);
                                if not v855 then
                                    v50:Notify({
                                        Title = "Error", 
                                        Content = "Selected skin model not found: " .. v834, 
                                        Duration = 3
                                    });
                                    return;
                                else
                                    if l_v840_FirstChild_0 then
                                        local v856 = v846();
                                        local v857 = v832 .. "_Original";
                                        if not v856:FindFirstChild(v857) then
                                            local v858 = l_v840_FirstChild_0:Clone();
                                            v858.Name = v857;
                                            v858.Parent = v856;
                                            v50:Notify({
                                                Title = "Backup", 
                                                Content = "Original model backed up.", 
                                                Duration = 2
                                            });
                                        end;
                                        l_v840_FirstChild_0:Destroy();
                                    end;
                                    local v859 = v855:Clone();
                                    v859.Name = v832;
                                    v859.Parent = v840;
                                    v50:Notify({
                                        Title = "Success", 
                                        Content = v834 .. " applied to " .. v832, 
                                        Duration = 3
                                    });
                                    return;
                                end;
                            end;
                        end;
                    end
                });
                v807:AddButton({
                    Title = "Reset Skin Model", 
                    Description = "Reset weapon model to its original state (if backed up)", 
                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v832 (ref), v50 (ref), v846 (ref), v840 (ref)
                        if v832 == "No Weapons Found" then
                            v50:Notify({
                                Title = "Error", 
                                Content = "Please select a base weapon first.", 
                                Duration = 3
                            });
                            return;
                        else
                            local l_FirstChild_3 = v846():FindFirstChild(v832 .. "_Original");
                            if not l_FirstChild_3 then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "Original backup not found for " .. v832 .. ". Apply a skin first to create a backup.", 
                                    Duration = 4
                                });
                                return;
                            else
                                local l_v840_FirstChild_1 = v840:FindFirstChild(v832);
                                if l_v840_FirstChild_1 then
                                    l_v840_FirstChild_1:Destroy();
                                end;
                                local v862 = l_FirstChild_3:Clone();
                                v862.Name = v832;
                                v862.Parent = v840;
                                v50:Notify({
                                    Title = "Success", 
                                    Content = v832 .. " model reset to original.", 
                                    Duration = 3
                                });
                                return;
                            end;
                        end;
                    end
                });
                local v863 = "skin_presets.json";
                local v864 = {};
                local v865 = {
                    "No Presets Found"
                };
                local function v867(v866) --[[ Line: 0 ]] --[[ Name:  ]]
                    if type(v866) ~= "table" then
                        return false;
                    else
                        return true;
                    end;
                end;
                local function v871(_, v869) --[[ Line: 0 ]] --[[ Name:  ]]
                    if v869.baseWeapon and v869.skin then
                        local l_baseWeapon_0 = v869.baseWeapon;
                        return {
                            [l_baseWeapon_0] = {
                                baseWeapon = l_baseWeapon_0, 
                                skin = v869.skin
                            }
                        };
                    else
                        return v869;
                    end;
                end;
                local function v877(v872) --[[ Line: 0 ]] --[[ Name:  ]]
                    local v873 = false;
                    local v874 = {};
                    for v875, v876 in pairs(v872) do
                        if type(v876) == "table" and v876.baseWeapon and v876.skin then
                            v874[v875] = v876;
                            v873 = true;
                        end;
                    end;
                    return v873 and v874 or nil;
                end;
                local function v883() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v864 (ref), v867 (ref), v871 (ref), v877 (ref)
                    local v878 = {};
                    for v879, v880 in pairs(v864) do
                        if v867(v880) then
                            local v881 = v871(v879, v880);
                            local v882 = v877(v881);
                            if v882 then
                                v878[v879] = v882;
                            end;
                        end;
                    end;
                    v864 = v878;
                end;
                local function v885() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v865 (ref), v864 (ref)
                    v865 = {};
                    for v884 in pairs(v864) do
                        if type(v884) == "string" then
                            table.insert(v865, v884);
                        end;
                    end;
                    if #v865 == 0 then
                        table.insert(v865, "No Presets Found");
                    end;
                    table.sort(v865);
                end;
                local function v904() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v864 (ref), v885 (ref), v863 (ref), l_HttpService_1 (ref), v828 (ref), v883 (ref)
                    v864 = {};
                    if not getfenv().isfile or not getfenv().readfile then
                        warn("Preset System: File functions not available");
                        v885();
                        return false;
                    elseif not isfile(v863) then
                        warn("Preset System: No preset file found");
                        v885();
                        return false;
                    else
                        local l_status_17, l_result_17 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v863 (ref)
                            return readfile(v863);
                        end);
                        if not l_status_17 or not l_result_17 then
                            warn("Preset System: Failed to read preset file");
                            v885();
                            return false;
                        else
                            local l_status_18, l_result_18 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: l_HttpService_1 (ref), l_result_17 (ref)
                                return l_HttpService_1:JSONDecode(l_result_17);
                            end);
                            v864 = l_result_18;
                            if not l_status_18 or type(v864) ~= "table" then
                                warn("Preset System: Invalid JSON format");
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v863 (ref), l_result_17 (ref)
                                    local v890 = v863 .. ".corrupted." .. os.time();
                                    writefile(v890, l_result_17);
                                    warn("Preset System: Created backup as " .. v890);
                                end);
                                l_status_18 = false;
                                do
                                    local l_l_status_18_0 = l_status_18;
                                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_result_17 (ref), l_HttpService_1 (ref), l_l_status_18_0 (ref), v864 (ref), v863 (ref)
                                        local v892 = {};
                                        for v893 in l_result_17:gmatch("{.-}") do
                                            do
                                                local l_v893_0 = v893;
                                                local l_status_19, l_result_19 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                    -- upvalues: l_HttpService_1 (ref), l_v893_0 (ref)
                                                    return l_HttpService_1:JSONDecode(l_v893_0);
                                                end);
                                                if l_status_19 and type(l_result_19) == "table" then
                                                    for v897, v898 in pairs(l_result_19) do
                                                        if type(v898) == "table" and v898.baseWeapon and v898.skin then
                                                            v892[v897] = v898;
                                                            l_l_status_18_0 = true;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        if l_l_status_18_0 then
                                            v864 = v892;
                                            warn("Preset System: Recovered some valid presets");
                                            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                -- upvalues: v863 (ref), l_HttpService_1 (ref), v864 (ref)
                                                writefile(v863, l_HttpService_1:JSONEncode(v864));
                                                warn("Preset System: Saved recovered presets");
                                            end);
                                        end;
                                    end);
                                    if not l_l_status_18_0 then
                                        v864 = {};
                                    end;
                                end;
                            end;
                            l_status_18 = {};
                            for v899, v900 in pairs(v864) do
                                if type(v899) == "string" and type(v900) == "table" then
                                    local v901 = {};
                                    for v902, v903 in pairs(v900) do
                                        if type(v903) == "table" and v903.baseWeapon and v903.skin and v828[v903.baseWeapon] and table.find(v828[v903.baseWeapon], v903.skin) then
                                            v901[v902] = v903;
                                        end;
                                    end;
                                    if next(v901) then
                                        l_status_18[v899] = v901;
                                    end;
                                end;
                            end;
                            v864 = l_status_18;
                            v883();
                            v885();
                            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v863 (ref), l_HttpService_1 (ref), v864 (ref)
                                writefile(v863, l_HttpService_1:JSONEncode(v864));
                            end);
                            return true;
                        end;
                    end;
                end;
                local function v913() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v883 (ref), v864 (ref), l_HttpService_1 (ref), v863 (ref)
                    if not getfenv().writefile then
                        warn("Preset System: writefile not available");
                        return false;
                    else
                        v883();
                        local v905 = {};
                        for v906, v907 in pairs(v864) do
                            if type(v906) == "string" and type(v907) == "table" then
                                local v908 = {};
                                for v909, v910 in pairs(v907) do
                                    if type(v910) == "table" and v910.baseWeapon and v910.skin then
                                        v908[v909] = {
                                            baseWeapon = v910.baseWeapon, 
                                            skin = v910.skin
                                        };
                                    end;
                                end;
                                if next(v908) then
                                    v905[v906] = v908;
                                end;
                            end;
                        end;
                        local l_status_20, l_result_20 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: l_HttpService_1 (ref), v905 (ref)
                            return l_HttpService_1:JSONEncode(v905);
                        end);
                        if not l_status_20 or not l_result_20 then
                            warn("Preset System: Failed to encode presets");
                            return false;
                        elseif not pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v863 (ref), l_result_20 (ref)
                            writefile(v863, l_result_20);
                        end) then
                            warn("Preset System: Failed to save presets");
                            return false;
                        else
                            return true;
                        end;
                    end;
                end;
                v904();
                local v914 = nil;
                local function v961() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v914 (ref), v807 (ref), v865 (ref), v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), v50 (ref), v175 (ref), v37 (ref), v31 (ref), v885 (ref), v832 (ref), v834 (ref), v913 (ref), l_l_CreateWindow_0_0 (ref)
                    v914 = v807:AddDropdown("PresetDropdown", {
                        Title = "Saved Presets", 
                        Description = "Select a saved preset to apply.", 
                        Values = v865, 
                        Default = nil, 
                        Callback = function(v915) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), v50 (ref)
                            if v915 ~= "No Presets Found" then
                                local v916 = v864[v915];
                                if v916 then
                                    for v917, v918 in pairs(v916) do
                                        if v828[v917] and table.find(v828[v917], v918.skin) then
                                            local l_v840_FirstChild_2 = v840:FindFirstChild(v917);
                                            if l_v840_FirstChild_2 then
                                                local v920 = v853(v918.skin);
                                                if v920 then
                                                    local v921 = v846();
                                                    local v922 = v917 .. "_Original";
                                                    if not v921:FindFirstChild(v922) then
                                                        local v923 = l_v840_FirstChild_2:Clone();
                                                        v923.Name = v922;
                                                        v923.Parent = v921;
                                                    end;
                                                    l_v840_FirstChild_2:Destroy();
                                                    local v924 = v920:Clone();
                                                    v924.Name = v917;
                                                    v924.Parent = v840;
                                                end;
                                            end;
                                        end;
                                    end;
                                    v50:Notify({
                                        Title = "Preset Applied", 
                                        Content = "Applied " .. v915 .. " preset", 
                                        Duration = 3
                                    });
                                end;
                            end;
                        end
                    });
                    v175.AutoLoadPreset = v37.AutoLoadPreset or false;
                    v175.DefaultPreset = v37.DefaultPreset or "";
                    local _ = v807:AddToggle("AutoLoadPreset", {
                        Title = "Auto Load Preset", 
                        Description = "Automatically load selected preset when joining game", 
                        Default = v175.AutoLoadPreset, 
                        Callback = function(v925) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v175 (ref), v31 (ref)
                            v175.AutoLoadPreset = v925;
                            v31:ExportSettings();
                        end
                    });
                    v807:AddDropdown("DefaultPreset", {
                        Title = "Default Preset", 
                        Description = "Select preset to auto-load", 
                        Values = v865, 
                        Default = v175.DefaultPreset, 
                        Callback = function(v927) --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v175 (ref), v31 (ref), v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), v50 (ref)
                            if v927 ~= "No Presets Found" then
                                v175.DefaultPreset = v927;
                                v31:ExportSettings();
                                if v175.AutoLoadPreset then
                                    local v928 = v864[v927];
                                    if v928 then
                                        for v929, v930 in pairs(v928) do
                                            if v828[v929] and table.find(v828[v929], v930.skin) then
                                                local l_v840_FirstChild_3 = v840:FindFirstChild(v929);
                                                if l_v840_FirstChild_3 then
                                                    local v932 = v853(v930.skin);
                                                    if v932 then
                                                        local v933 = v846();
                                                        local v934 = v929 .. "_Original";
                                                        if not v933:FindFirstChild(v934) then
                                                            local v935 = l_v840_FirstChild_3:Clone();
                                                            v935.Name = v934;
                                                            v935.Parent = v933;
                                                        end;
                                                        l_v840_FirstChild_3:Destroy();
                                                        local v936 = v932:Clone();
                                                        v936.Name = v929;
                                                        v936.Parent = v840;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        v50:Notify({
                                            Title = "Default Preset Set", 
                                            Content = "Set " .. v927 .. " as default preset", 
                                            Duration = 3
                                        });
                                    end;
                                end;
                            else
                                v175.DefaultPreset = "";
                                v31:ExportSettings();
                            end;
                        end
                    });
                    local function v937() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v914 (ref), v865 (ref)
                        if v914 then
                            v914:SetValues(v865);
                            v914:SetValue(nil);
                        end;
                    end;
                    local l_v885_0 = v885;
                    v885 = function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v885_0 (ref), v937 (ref)
                        l_v885_0();
                        v937();
                    end;
                    local v939 = nil;
                    v939 = v807:AddInput("PresetNameInput", {
                        Title = "Preset Name", 
                        Default = "", 
                        Placeholder = "Enter preset name here...", 
                        Numeric = false, 
                        Finished = true
                    });
                    v807:AddButton({
                        Title = "Save Current as Preset", 
                        Description = "Save your current weapon and skin selection as a preset.", 
                        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v832 (ref), v834 (ref), v50 (ref), v939 (ref), v864 (ref), v913 (ref), v885 (ref)
                            if not v832 or not v834 then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "Please select a weapon and skin first", 
                                    Duration = 3
                                });
                                return;
                            elseif not v939 then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "Input field not initialized properly", 
                                    Duration = 3
                                });
                                return;
                            else
                                local l_Value_0 = v939.Value;
                                if not l_Value_0 or l_Value_0 == "" then
                                    v50:Notify({
                                        Title = "Error", 
                                        Content = "Please enter a preset name", 
                                        Duration = 3
                                    });
                                    return;
                                else
                                    v864[l_Value_0] = v864[l_Value_0] or {};
                                    v864[l_Value_0][v832] = {
                                        skin = v834, 
                                        baseWeapon = v832
                                    };
                                    v913();
                                    v885();
                                    v50:Notify({
                                        Title = "Success", 
                                        Content = "Preset saved: " .. l_Value_0, 
                                        Duration = 3
                                    });
                                    v939:SetValue("");
                                    return;
                                end;
                            end;
                        end
                    });
                    v807:AddButton({
                        Title = "Add to Preset", 
                        Description = "Add current weapon/skin to an existing preset.", 
                        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v832 (ref), v834 (ref), v50 (ref), v865 (ref), l_l_CreateWindow_0_0 (ref), v864 (ref), v913 (ref), v885 (ref)
                            if not v832 or not v834 then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "Please select a weapon and skin first", 
                                    Duration = 3
                                });
                                return;
                            elseif #v865 == 0 or v865[1] == "No Presets Found" then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "No presets exist to add to", 
                                    Duration = 3
                                });
                                return;
                            else
                                l_l_CreateWindow_0_0:Dialog({
                                    Title = "Add to Preset", 
                                    Content = "Select a preset to add this weapon/skin to:", 
                                    Buttons = (function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v865 (ref), v864 (ref), v832 (ref), v834 (ref), v913 (ref), v885 (ref), v50 (ref)
                                        local v941 = {};
                                        for _, v943 in ipairs(v865) do
                                            do
                                                local l_v943_0 = v943;
                                                if l_v943_0 ~= "No Presets Found" then
                                                    table.insert(v941, {
                                                        Title = l_v943_0, 
                                                        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                            -- upvalues: v864 (ref), l_v943_0 (ref), v832 (ref), v834 (ref), v913 (ref), v885 (ref), v50 (ref)
                                                            v864[l_v943_0] = v864[l_v943_0] or {};
                                                            v864[l_v943_0][v832] = {
                                                                skin = v834, 
                                                                baseWeapon = v832
                                                            };
                                                            v913();
                                                            v885();
                                                            v50:Notify({
                                                                Title = "Success", 
                                                                Content = string.format("Added %s (%s) to %s", v832, v834, l_v943_0), 
                                                                Duration = 3
                                                            });
                                                        end
                                                    });
                                                end;
                                            end;
                                        end;
                                        return v941;
                                    end)()
                                });
                                return;
                            end;
                        end
                    });
                    v807:AddButton({
                        Title = "Delete Preset", 
                        Description = "Delete an existing preset.", 
                        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v865 (ref), v50 (ref), v175 (ref), v37 (ref), v807 (ref), v31 (ref), v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), l_l_CreateWindow_0_0 (ref), v913 (ref), v885 (ref)
                            if #v865 == 0 or v865[1] == "No Presets Found" then
                                v50:Notify({
                                    Title = "Error", 
                                    Content = "No presets exist to delete", 
                                    Duration = 3
                                });
                                return;
                            else
                                v175.AutoLoadPreset = v37.AutoLoadPreset or false;
                                v175.DefaultPreset = v37.DefaultPreset or "";
                                local _ = v807:AddToggle("AutoLoadPreset", {
                                    Title = "Auto Load Preset", 
                                    Description = "Automatically load selected preset when joining game", 
                                    Default = v175.AutoLoadPreset, 
                                    Callback = function(v945) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v175 (ref), v31 (ref)
                                        v175.AutoLoadPreset = v945;
                                        v31:ExportSettings();
                                    end
                                });
                                v807:AddDropdown("DefaultPreset", {
                                    Title = "Default Preset", 
                                    Description = "Select preset to auto-load", 
                                    Values = v865, 
                                    Default = v175.DefaultPreset, 
                                    Callback = function(v947) --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v175 (ref), v31 (ref), v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), v50 (ref)
                                        if v947 ~= "No Presets Found" then
                                            v175.DefaultPreset = v947;
                                            v31:ExportSettings();
                                            if v175.AutoLoadPreset then
                                                local v948 = v864[v947];
                                                if v948 then
                                                    for v949, v950 in pairs(v948) do
                                                        if v828[v949] and table.find(v828[v949], v950.skin) then
                                                            local l_v840_FirstChild_4 = v840:FindFirstChild(v949);
                                                            if l_v840_FirstChild_4 then
                                                                local v952 = v853(v950.skin);
                                                                if v952 then
                                                                    local v953 = v846();
                                                                    local v954 = v949 .. "_Original";
                                                                    if not v953:FindFirstChild(v954) then
                                                                        local v955 = l_v840_FirstChild_4:Clone();
                                                                        v955.Name = v954;
                                                                        v955.Parent = v953;
                                                                    end;
                                                                    l_v840_FirstChild_4:Destroy();
                                                                    local v956 = v952:Clone();
                                                                    v956.Name = v949;
                                                                    v956.Parent = v840;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                    v50:Notify({
                                                        Title = "Default Preset Set", 
                                                        Content = "Set " .. v947 .. " as default preset", 
                                                        Duration = 3
                                                    });
                                                end;
                                            end;
                                        else
                                            v175.DefaultPreset = "";
                                            v31:ExportSettings();
                                        end;
                                    end
                                });
                                l_l_CreateWindow_0_0:Dialog({
                                    Title = "Delete Preset", 
                                    Content = "Select a preset to delete:", 
                                    Buttons = (function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v865 (ref), v864 (ref), v913 (ref), v885 (ref), v50 (ref)
                                        local v957 = {};
                                        for _, v959 in ipairs(v865) do
                                            do
                                                local l_v959_0 = v959;
                                                if l_v959_0 ~= "No Presets Found" then
                                                    table.insert(v957, {
                                                        Title = l_v959_0, 
                                                        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                            -- upvalues: v864 (ref), l_v959_0 (ref), v913 (ref), v885 (ref), v50 (ref)
                                                            v864[l_v959_0] = nil;
                                                            v913();
                                                            v885();
                                                            v50:Notify({
                                                                Title = "Success", 
                                                                Content = "Deleted preset: " .. l_v959_0, 
                                                                Duration = 3
                                                            });
                                                        end
                                                    });
                                                end;
                                            end;
                                        end;
                                        return v957;
                                    end)()
                                });
                                return;
                            end;
                        end
                    });
                end;
                v904();
                v961();
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref), v864 (ref), v828 (ref), v840 (ref), v853 (ref), v846 (ref), v50 (ref)
                    if v175.AutoLoadPreset and v175.DefaultPreset ~= "" and v175.DefaultPreset ~= "No Presets Found" then
                        local v962 = v864[v175.DefaultPreset];
                        if v962 then
                            for v963, v964 in pairs(v962) do
                                if v828[v963] and table.find(v828[v963], v964.skin) then
                                    local l_v840_FirstChild_5 = v840:FindFirstChild(v963);
                                    if l_v840_FirstChild_5 then
                                        local v966 = v853(v964.skin);
                                        if v966 then
                                            local v967 = v846();
                                            local v968 = v963 .. "_Original";
                                            if not v967:FindFirstChild(v968) then
                                                local v969 = l_v840_FirstChild_5:Clone();
                                                v969.Name = v968;
                                                v969.Parent = v967;
                                            end;
                                            l_v840_FirstChild_5:Destroy();
                                            local v970 = v966:Clone();
                                            v970.Name = v963;
                                            v970.Parent = v840;
                                        end;
                                    end;
                                end;
                            end;
                            v50:Notify({
                                Title = "Auto-Loaded Preset", 
                                Content = "Applied " .. v175.DefaultPreset .. " preset", 
                                Duration = 3
                            });
                        end;
                    end;
                end);
            end;
        else
            v51 = true;
        end;
        l_v50_0.HvH = l_l_CreateWindow_0_0:AddTab({
            Title = "HvH", 
            Icon = "swords"
        });
        l_v50_0.Settings = l_l_CreateWindow_0_0:AddTab({
            Title = "Settings", 
            Icon = "settings"
        });
        task.wait(0.1);
        l_v50_0.Settings:AddParagraph({
            Title = string.format("%s   ", string.format(v44[os.date("*t").month], "Luasec")), 
            Content = "Luasec\nhttps://discord.gg/luasec"
        });
        local v971 = l_v50_0.Settings:AddSection("UI");
        local v972 = {
            Prefix = "LUASEC", 
            BaseColor = Color3.fromRGB(15, 15, 25), 
            GlassColor = Color3.fromRGB(120, 170, 255), 
            BlurRadius = 15, 
            Transparency = 0.85, 
            CornerRadius = 12, 
            BorderThickness = 1, 
            TextPadding = 20, 
            ShadowTransparency = 0.7
        };
        local l_TextService_0 = game:GetService("TextService");
        local l_MarketplaceService_0 = game:GetService("MarketplaceService");
        local l_RunService_7 = game:GetService("RunService");
        local l_UserInputService_4 = game:GetService("UserInputService");
        local l_Players_7 = game:GetService("Players");
        local function v1009() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_Players_7 (ref), v175 (ref), l_MarketplaceService_0 (ref), v972 (ref), l_TextService_0 (ref), l_UserInputService_4 (ref), v176 (ref), l_RunService_7 (ref)
            if not l_Players_7.LocalPlayer then
                l_Players_7:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "LuasecGlassWatermark";
            l_ScreenGui_0.Parent = game.CoreGui;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Enabled = v175.Watermark;
            local v979 = "Unknown Game";
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v979 (ref), l_MarketplaceService_0 (ref)
                v979 = l_MarketplaceService_0:GetProductInfo(game.PlaceId).Name;
            end);
            local v980 = l_Players_7.LocalPlayer and l_Players_7.LocalPlayer.Name or "Unknown Player";
            local v981 = string.format("%s | %s | %s | FPS: 0", v972.Prefix, v979, v980);
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v981, 14, Enum.Font.GothamMedium, Vector2.new(1000, 30));
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "GlassFrame";
            l_Frame_1.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + v972.TextPadding * 2, 0, l_l_TextService_0_TextSize_0.Y + 16);
            l_Frame_1.Position = UDim2.new(0, 20, 0, 20);
            l_Frame_1.BackgroundColor3 = v972.BaseColor;
            l_Frame_1.BackgroundTransparency = v972.Transparency;
            l_Frame_1.Parent = l_ScreenGui_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "GlassEffect";
            l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
            l_Frame_2.BackgroundColor3 = v972.GlassColor;
            l_Frame_2.BackgroundTransparency = 0.95;
            l_Frame_2.Parent = l_Frame_1;
            local l_UIGradient_0 = Instance.new("UIGradient");
            l_UIGradient_0.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
            });
            l_UIGradient_0.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.7), 
                NumberSequenceKeypoint.new(1, 0.9)
            });
            l_UIGradient_0.Rotation = 90;
            l_UIGradient_0.Parent = l_Frame_2;
            local l_UICorner_1 = Instance.new("UICorner");
            l_UICorner_1.CornerRadius = UDim.new(0, v972.CornerRadius);
            l_UICorner_1.Parent = l_Frame_1;
            local v987 = Instance.new("UIStroke", l_Frame_1);
            v987.Thickness = v972.BorderThickness;
            v987.Color = Color3.fromRGB(255, 255, 255);
            v987.Transparency = 0.8;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
            l_TextLabel_0.Text = v981;
            l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.Font = Enum.Font.GothamMedium;
            l_TextLabel_0.TextSize = 14;
            l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Center;
            l_TextLabel_0.TextTransparency = 0.1;
            l_TextLabel_0.Parent = l_Frame_1;
            local v989 = nil;
            local v990 = nil;
            local v991 = nil;
            local v992 = nil;
            local function v995(v993) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v991 (ref), l_Frame_1 (ref), v992 (ref)
                local v994 = v993.Position - v991;
                l_Frame_1.Position = UDim2.new(v992.X.Scale, v992.X.Offset + v994.X, v992.Y.Scale, v992.Y.Offset + v994.Y);
            end;
            l_Frame_1.InputBegan:Connect(function(v996) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v989 (ref), v991 (ref), v992 (ref), l_Frame_1 (ref)
                if v996.UserInputType == Enum.UserInputType.MouseButton1 then
                    v989 = true;
                    v991 = v996.Position;
                    v992 = l_Frame_1.Position;
                    v996.Changed:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v996 (ref), v989 (ref)
                        if v996.UserInputState == Enum.UserInputState.End then
                            v989 = false;
                        end;
                    end);
                end;
            end);
            l_Frame_1.InputChanged:Connect(function(v997) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v990 (ref)
                if v997.UserInputType == Enum.UserInputType.MouseMovement then
                    v990 = v997;
                end;
            end);
            l_UserInputService_4.InputChanged:Connect(function(v998) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v990 (ref), v989 (ref), v995 (ref)
                if v998 == v990 and v989 then
                    v995(v998);
                end;
            end);
            v176()._Watermark = {
                Gui = l_ScreenGui_0, 
                Label = l_TextLabel_0, 
                Enabled = v175.Watermark, 
                FPSConnection = nil
            };
            if v175.Watermark then
                local v999 = tick();
                local v1000 = tick();
                do
                    local l_v999_0, l_v1000_0 = v999, v1000;
                    v176()._Watermark.FPSConnection = l_RunService_7.RenderStepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v999_0 (ref), l_v1000_0 (ref), v176 (ref), l_MarketplaceService_0 (ref), l_Players_7 (ref), v972 (ref)
                        local v1003 = tick();
                        local v1004 = math.floor(1 / (v1003 - l_v999_0));
                        l_v999_0 = v1003;
                        if v1003 - l_v1000_0 >= 0.5 then
                            local l__Watermark_0 = v176()._Watermark;
                            if l__Watermark_0 and l__Watermark_0.Label then
                                local v1006 = "Unknown Game";
                                do
                                    local l_v1006_0 = v1006;
                                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: l_v1006_0 (ref), l_MarketplaceService_0 (ref)
                                        l_v1006_0 = l_MarketplaceService_0:GetProductInfo(game.PlaceId).Name;
                                    end);
                                    local v1008 = l_Players_7.LocalPlayer and l_Players_7.LocalPlayer.Name or "Unknown Player";
                                    l__Watermark_0.Label.Text = string.format("%s | %s | %s | %d FPS", v972.Prefix, l_v1006_0, v1008, v1004);
                                end;
                            end;
                            l_v1000_0 = v1003;
                        end;
                    end);
                end;
            end;
        end;
        if not l_Players_7.LocalPlayer then
            l_Players_7:GetPropertyChangedSignal("LocalPlayer"):Wait();
        end;
        v1009();
        local _ = v971:AddToggle("watermark", {
            Title = "Watermark", 
            Description = "Toggle the Luasec glass watermark display", 
            Default = v175.Watermark, 
            Callback = function(v1010) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v37 (ref), v176 (ref), l_RunService_7 (ref), l_MarketplaceService_0 (ref), l_Players_7 (ref), v972 (ref)
                v175.Watermark = v1010;
                v37.Watermark = v1010;
                if v176()._Watermark then
                    v176()._Watermark.Gui.Enabled = v1010;
                    v176()._Watermark.Enabled = v1010;
                    if v176()._Watermark.FPSConnection then
                        v176()._Watermark.FPSConnection:Disconnect();
                        v176()._Watermark.FPSConnection = nil;
                    end;
                    if v1010 then
                        local v1011 = tick();
                        local v1012 = tick();
                        do
                            local l_v1011_0, l_v1012_0 = v1011, v1012;
                            v176()._Watermark.FPSConnection = l_RunService_7.RenderStepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: l_v1011_0 (ref), l_v1012_0 (ref), v176 (ref), l_MarketplaceService_0 (ref), l_Players_7 (ref), v972 (ref)
                                local v1015 = tick();
                                local v1016 = math.floor(1 / (v1015 - l_v1011_0));
                                l_v1011_0 = v1015;
                                if v1015 - l_v1012_0 >= 0.5 then
                                    local l__Watermark_1 = v176()._Watermark;
                                    if l__Watermark_1 and l__Watermark_1.Label then
                                        local v1018 = "Unknown Game";
                                        do
                                            local l_v1018_0 = v1018;
                                            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                -- upvalues: l_v1018_0 (ref), l_MarketplaceService_0 (ref)
                                                l_v1018_0 = l_MarketplaceService_0:GetProductInfo(game.PlaceId).Name;
                                            end);
                                            local v1020 = l_Players_7.LocalPlayer and l_Players_7.LocalPlayer.Name or "Unknown Player";
                                            l__Watermark_1.Label.Text = string.format("%s | %s | %s | %d FPS", v972.Prefix, l_v1018_0, v1020, v1016);
                                        end;
                                    end;
                                    l_v1012_0 = v1015;
                                end;
                            end);
                        end;
                    end;
                end;
            end
        });
        v971:AddDropdown("Theme", {
            Title = "Theme", 
            Description = "Changes the UI Theme", 
            Values = v50.Themes, 
            Default = v50.Theme, 
            Callback = function(v1022) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), v17 (ref), v31 (ref)
                v50:SetTheme(v1022);
                v17.Theme = v1022;
                v31:ExportSettings();
            end
        });
        if v50.UseAcrylic then
            v971:AddToggle("Acrylic", {
                Title = "Acrylic", 
                Description = "Blurred Background requires Graphic Quality >= 8", 
                Default = v50.Acrylic, 
                Callback = function(v1023) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v17 (ref), v50 (ref), l_l_CreateWindow_0_0 (ref)
                    if not v1023 or not v17.ShowWarnings then
                        v50:ToggleAcrylic(v1023);
                    elseif v17.ShowWarnings then
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Warning", 
                            Content = "This Option can be detected! Activate it anyway?", 
                            Buttons = {
                                {
                                    Title = "Confirm", 
                                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v50 (ref), v1023 (ref)
                                        v50:ToggleAcrylic(v1023);
                                    end
                                }, 
                                {
                                    Title = "Cancel", 
                                    Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                                        -- upvalues: v50 (ref)
                                        v50.Options.Acrylic:SetValue(false);
                                    end
                                }
                            }
                        });
                    end;
                end
            });
        end;
        v971:AddToggle("Transparency", {
            Title = "Transparency", 
            Description = "Makes the UI Transparent", 
            Default = v17.Transparency, 
            Callback = function(v1024) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), v17 (ref), v31 (ref)
                v50:ToggleTransparency(v1024);
                v17.Transparency = v1024;
                v31:ExportSettings();
            end
        });
        if v43 then
            v971:AddKeybind("MinimizeKey", {
                Title = "Minimize Key", 
                Description = "Changes the Minimize Key", 
                Default = v50.MinimizeKey, 
                ChangedCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v17 (ref), v50 (ref), v31 (ref)
                    v17.MinimizeKey = v50.Options.MinimizeKey.Value;
                    v31:ExportSettings();
                end
            });
            local v1025 = "MinimizeKeybind";
            local l_MinimizeKey_0 = v50.Options.MinimizeKey;
            v50[v1025] = l_MinimizeKey_0;
        end;
        local v1027 = l_v50_0.Settings:AddSection("Notifications & Warnings");
        v1027:AddToggle("ShowNotifications", {
            Title = "Show Notifications", 
            Description = "Toggles the Notifications Show", 
            Default = v17.ShowNotifications
        }):OnChanged(function(v1028) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v50 (ref), v17 (ref), v31 (ref)
            v50.ShowNotifications = v1028;
            v17.ShowNotifications = v1028;
            v31:ExportSettings();
        end);
        v1027:AddToggle("ShowWarnings", {
            Title = "Show Warnings", 
            Description = "Toggles the Security Warnings Show", 
            Default = v17.ShowWarnings
        }):OnChanged(function(v1029) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v17 (ref), v31 (ref)
            v17.ShowWarnings = v1029;
            v31:ExportSettings();
        end);
        local v1030 = l_v50_0.Settings:AddSection("Performance");
        task.wait(0.1);
        v1030:AddParagraph({
            Title = "NOTE", 
            Content = "Heartbeat fires every frame, after the physics simulation has completed. RenderStepped fires every frame, prior to the frame being rendered. Stepped fires every frame, prior to the physics simulation."
        });
        v1030:AddDropdown("RenderingMode", {
            Title = "Rendering Mode", 
            Description = "Changes the Rendering Mode", 
            Values = {
                "Heartbeat", 
                "RenderStepped", 
                "Stepped"
            }, 
            Default = v17.RenderingMode, 
            Callback = function(v1031) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v17 (ref), v31 (ref), l_l_CreateWindow_0_0 (ref), v44 (ref)
                v17.RenderingMode = v1031;
                v31:ExportSettings();
                l_l_CreateWindow_0_0:Dialog({
                    Title = string.format(v44[os.date("*t").month], "Luasec"), 
                    Content = "Changes will take effect after the Restart!", 
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                });
            end
        });
        if getfenv().isfile and getfenv().readfile and getfenv().writefile and getfenv().delfile then
            local v1032 = l_v50_0.Settings:AddSection("Configuration Manager");
            v1032:AddToggle("AutoImport", {
                Title = "Auto Import", 
                Description = "Toggles the Auto Import", 
                Default = v17.AutoImport
            }):OnChanged(function(v1033) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v17 (ref), v31 (ref)
                v17.AutoImport = v1033;
                v31:ExportSettings();
            end);
            task.wait(0.1);
            v1032:AddParagraph({
                Title = string.format("Manager for %s", game.Name), 
                Content = string.format("Universe ID is %s", game.GameId)
            });
            v1032:AddButton({
                Title = "Import Configuration File", 
                Description = "Loads the Game Configuration File", 
                Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_HttpService_1 (ref), v50 (ref), v175 (ref), v36 (ref), v135 (ref), v5 (ref), v176 (ref), l_l_CreateWindow_0_0 (ref)
                    xpcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_HttpService_1 (ref), v50 (ref), v175 (ref), v36 (ref), v135 (ref), v5 (ref), v176 (ref), l_l_CreateWindow_0_0 (ref)
                        if getfenv().isfile(string.format("%s.Luasec", game.GameId)) and getfenv().readfile(string.format("%s.Luasec", game.GameId)) then
                            local v1034 = l_HttpService_1:JSONDecode(getfenv().readfile(string.format("%s.Luasec", game.GameId)));
                            for v1035, v1036 in next, v1034 do
                                if v1035 == "AimKey" or v1035 == "SpinKey" or v1035 == "TriggerKey" or v1035 == "FoVKey" then
                                    v50.Options[v1035]:SetValue(v1036);
                                    v175[v1035] = v1036 ~= "RMB" and Enum.KeyCode[v1036] or Enum.UserInputType.MouseButton2;
                                elseif v1035 == "AimPart" or v1035 == "SpinPart" or typeof(v175[v1035]) == "table" then
                                    v175[v1035] = v1036;
                                elseif v1035 == "FoVColour" then
                                    v50.Options[v1035]:SetValueRGB(v36:UnpackColour(v1036));
                                elseif v1035 == "SilentAim" then
                                    v135:SetValue(v1036);
                                    v175.SilentAim = v1036;
                                    v5 = v1036;
                                    v176().SilentAimEnabled = v1036;
                                elseif v175[v1035] ~= nil and v50.Options[v1035] then
                                    v50.Options[v1035]:SetValue(v1036);
                                end;
                            end;
                            for v1037, v1038 in next, v50.Options do
                                if v1038.Type == "Dropdown" then
                                    if v1037 == "AimPart" then
                                        v1038:SetValues(v175.AimPartDropdownValues);
                                        v1038:SetValue(v175.AimPart);
                                    elseif v1037 == "SpinPart" then
                                        v1038:SetValues(v175.SpinPartDropdownValues);
                                        v1038:SetValue(v175.SpinPart);
                                    elseif v1037 == "IgnoredPlayers" then
                                        v1038:SetValues(v175.IgnoredPlayersDropdownValues);
                                        local v1039 = {};
                                        for _, v1041 in next, v175.IgnoredPlayers do
                                            v1039[v1041] = true;
                                        end;
                                        v1038:SetValue(v1039);
                                    elseif v1037 == "TargetPlayers" then
                                        v1038:SetValues(v175.TargetPlayersDropdownValues);
                                        local v1042 = {};
                                        for _, v1044 in next, v175.TargetPlayers do
                                            v1042[v1044] = true;
                                        end;
                                        v1038:SetValue(v1042);
                                    end;
                                end;
                            end;
                            l_l_CreateWindow_0_0:Dialog({
                                Title = "Configuration Manager", 
                                Content = string.format("Configuration File %s.Luasec has been successfully loaded!", game.GameId), 
                                Buttons = {
                                    {
                                        Title = "Confirm"
                                    }
                                }
                            });
                        else
                            l_l_CreateWindow_0_0:Dialog({
                                Title = "Configuration Manager", 
                                Content = string.format("Configuration File %s.Luasec could not be found!", game.GameId), 
                                Buttons = {
                                    {
                                        Title = "Confirm"
                                    }
                                }
                            });
                        end;
                    end, function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_l_CreateWindow_0_0 (ref)
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Configuration Manager", 
                            Content = string.format("An Error occurred when loading the Configuration File %s.Luasec", game.GameId), 
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        });
                    end);
                end
            });
            v1032:AddButton({
                Title = "Export Configuration File", 
                Description = "Overwrites the Game Configuration File", 
                Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref), v50 (ref), v36 (ref), l_HttpService_1 (ref), l_l_CreateWindow_0_0 (ref)
                    xpcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v175 (ref), v50 (ref), v36 (ref), l_HttpService_1 (ref), l_l_CreateWindow_0_0 (ref)
                        local v1045 = {
                            __LAST_UPDATED__ = os.date()
                        };
                        for v1046, v1047 in next, v175 do
                            if v1046 == "AimKey" or v1046 == "SpinKey" or v1046 == "TriggerKey" or v1046 == "FoVKey" then
                                v1045[v1046] = v50.Options[v1046].Value;
                            elseif v1046 == "FoVColour" then
                                v1045[v1046] = v36:PackColour(v1047);
                            elseif v1046 == "SilentAim" then
                                v1045[v1046] = v1047;
                            else
                                v1045[v1046] = v1047;
                            end;
                        end;
                        v1045 = l_HttpService_1:JSONEncode(v1045);
                        getfenv().writefile(string.format("%s.Luasec", game.GameId), v1045);
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Configuration Manager", 
                            Content = string.format("Configuration File %s.Luasec has been successfully overwritten!", game.GameId), 
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        });
                    end, function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_l_CreateWindow_0_0 (ref)
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Configuration Manager", 
                            Content = string.format("An Error occurred when overwriting the Configuration File %s.Luasec", game.GameId), 
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        });
                    end);
                end
            });
            v1032:AddButton({
                Title = "Delete Configuration File", 
                Description = "Removes the Game Configuration File", 
                Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_CreateWindow_0_0 (ref)
                    if getfenv().isfile(string.format("%s.Luasec", game.GameId)) then
                        getfenv().delfile(string.format("%s.Luasec", game.GameId));
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Configuration Manager", 
                            Content = string.format("Configuration File %s.Luasec has been successfully removed!", game.GameId), 
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        });
                    else
                        l_l_CreateWindow_0_0:Dialog({
                            Title = "Configuration Manager", 
                            Content = string.format("Configuration File %s.Luasec could not be found!", game.GameId), 
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        });
                    end;
                end
            });
        else
            v51 = true;
        end;
        local v1048 = l_v50_0.Settings:AddSection("Discord & Website");
        if getfenv().setclipboard then
            v1048:AddButton({
                Title = "Copy Invite Link", 
                Description = "Paste it into the Browser Tab", 
                Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_CreateWindow_0_0 (ref), v44 (ref)
                    getfenv().setclipboard("https://discord.gg/luasec");
                    l_l_CreateWindow_0_0:Dialog({
                        Title = string.format(v44[os.date("*t").month], "Luasec"), 
                        Content = "Invite Link has been copied to the Clipboard!", 
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    });
                end
            });
            v1048:AddButton({
                Title = "Copy Website Link", 
                Description = "Paste it into the Browser Tab", 
                Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_l_CreateWindow_0_0 (ref), v44 (ref)
                    getfenv().setclipboard("https://luasec-script.vercel.app/");
                    l_l_CreateWindow_0_0:Dialog({
                        Title = string.format(v44[os.date("*t").month], "Luasec"), 
                        Content = "Website Link has been copied to the Clipboard!", 
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    });
                end
            });
        else
            v1048:AddParagraph({
                Title = "https://luasec-script.vercel.app/", 
                Content = "Paste it into the Browser Tab"
            });
            task.wait(0.1);
            v1048:AddParagraph({
                Title = "https://luasec-script.vercel.app/", 
                Content = "Paste it into the Browser Tab"
            });
        end;
        if v17.ShowWarnings then
            if v10 then
                local v1049 = "Dialog";
                local l_l_l_CreateWindow_0_0_0 = l_l_CreateWindow_0_0;
                l_l_CreateWindow_0_0[v1049](l_l_l_CreateWindow_0_0_0, {
                    Title = "Warning", 
                    Content = "Running in Debugging Mode. Some Features may not work properly.", 
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                });
            elseif v51 then
                if game.Id ~= 17625359962 then
                    local v1051 = "Dialog";
                    local l_l_l_CreateWindow_0_0_1 = l_l_CreateWindow_0_0;
                    l_l_CreateWindow_0_0[v1051](l_l_l_CreateWindow_0_0_1, {
                        Title = "Warning", 
                        Content = string.format("This game may or may not support all the Features of %s! (Universal Script Soon)", string.format(v44[os.date("*t").month], "Luasec")), 
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    });
                elseif game.Id == 17625359962 then
                    local v1053 = "Dialog";
                    local l_l_l_CreateWindow_0_0_2 = l_l_CreateWindow_0_0;
                    l_l_CreateWindow_0_0[v1053](l_l_l_CreateWindow_0_0_2, {
                        Title = "Warning", 
                        Content = string.format("Your software doesn't support all the Features of %s!", string.format(v44[os.date("*t").month], "Luasec")), 
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    });
                end;
            end;
        end;
        task.wait(0.1);
        l_v50_0.HvH:AddParagraph({
            Title = string.format("%s ", string.format(v44[os.date("*t").month], "Luasec")), 
            Content = "Luasec\nhttps://discord.gg/luasec"
        });
        local v1055 = l_v50_0.HvH:AddSection("Desync");
        v175.DesyncEnabled = false;
        v175.DesyncMode = "Prediction";
        v175.DesyncStrength = 5;
        v175.DesyncUpdateRate = 0.01;
        v175.DesyncYaw = 0;
        v175.DesyncPitch = 0;
        v175.DesyncJitter = false;
        v175.DesyncJitterStrength = 15;
        v175.DesyncAutoDirection = false;
        v175.DesyncCustomRotation = Vector3.new(0, 0, 0);
        v175.DesyncBreakWalk = false;
        v175.DesyncLeanMode = "Switch";
        v175.DesyncFakeLag = false;
        v175.DesyncFakeLagAmount = 0.15;
        v1055:AddToggle("DesyncEnabled", {
            Title = "Enable Desync", 
            Description = "Enables position/rotation desync", 
            Default = v175.DesyncEnabled
        }):OnChanged(function(v1056) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v31 (ref)
            v175.DesyncEnabled = v1056;
            v31:ExportSettings();
            if v1056 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v175 (ref)
                    local v1057 = 0;
                    local v1058 = false;
                    local v1059 = 0;
                    local v1060 = nil;
                    local v1061 = 0;
                    while v175.DesyncEnabled do
                        if tick() - v1057 >= v175.DesyncUpdateRate then
                            v1057 = tick();
                            local v1062 = require(game:GetService("Players").LocalPlayer.PlayerScripts.Controllers.FighterController);
                            if v1062 and v1062.LocalFighter and v1062.LocalFighter.Entity then
                                local l_Entity_0 = v1062.LocalFighter.Entity;
                                local l_RootPart_0 = l_Entity_0.RootPart;
                                local l_Humanoid_4 = l_Entity_0:FindFirstChild("Humanoid");
                                if l_RootPart_0 and l_Humanoid_4 then
                                    local l_MoveDirection_0 = l_Humanoid_4.MoveDirection;
                                    local l_LookVector_0 = workspace.CurrentCamera.CFrame.LookVector;
                                    if v175.DesyncFakeLag then
                                        v1061 = v1061 + 1;
                                        if 60 * v175.DesyncFakeLagAmount <= v1061 then
                                            v1061 = 0;
                                            if v1060 then
                                                l_RootPart_0.CFrame = v1060;
                                            end;
                                        else
                                            v1060 = l_RootPart_0.CFrame;
                                        end;
                                    end;
                                    local v1068 = CFrame.new();
                                    if v175.DesyncAutoDirection and l_MoveDirection_0.Magnitude > 0.1 then
                                        v1068 = CFrame.lookAt(Vector3.new(), l_MoveDirection_0);
                                    else
                                        v1068 = CFrame.lookAt(Vector3.new(), l_LookVector_0);
                                    end;
                                    if v175.DesyncMode == "Prediction" then
                                        local v1069 = Vector3.new(math.sin(tick() * 5) * v175.DesyncStrength, math.cos(tick() * 3) * (v175.DesyncJitter and v175.DesyncJitterStrength or 0), math.cos(tick() * 5) * v175.DesyncStrength) + Vector3.new(math.random(-0.5, 0.5), math.random(-0.5, 0.5), math.random(-0.5, 0.5));
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.new(v1069);
                                        v1059 = (v1059 + math.random(10, 45)) % 360;
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.Angles(math.rad(math.random(-30, 30)), math.rad(v1059), math.rad(math.random(-15, 15)));
                                    elseif v175.DesyncMode == "Teleport" then
                                        v1058 = not v1058;
                                        local v1070 = Vector3.new((v1058 and 1 or -1) * v175.DesyncStrength, v175.DesyncJitter and (v1058 and 1 or -1) * v175.DesyncJitterStrength or 0, (v1058 and -1 or 1) * v175.DesyncStrength);
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.new(v1070);
                                    elseif v175.DesyncMode == "Spin" then
                                        v1059 = (v1059 + v175.DesyncYaw + math.random(1, 10)) % 360;
                                        local v1071 = Vector3.new(math.cos(math.rad(v1059)) * v175.DesyncStrength, v175.DesyncJitter and math.sin(tick() * 10) * v175.DesyncJitterStrength or 0, math.sin(math.rad(v1059)) * v175.DesyncStrength);
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.new(v1071) * CFrame.Angles(0, math.rad(v1059), 0);
                                    elseif v175.DesyncMode == "Random" then
                                        local v1072 = Vector3.new(math.random(-v175.DesyncStrength, v175.DesyncStrength), v175.DesyncJitter and math.random(-v175.DesyncJitterStrength, v175.DesyncJitterStrength) or 0, math.random(-v175.DesyncStrength, v175.DesyncStrength));
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.new(v1072) * CFrame.Angles(math.rad(math.random(-v175.DesyncPitch, v175.DesyncPitch)), math.rad(math.random(-v175.DesyncYaw, v175.DesyncYaw)), math.rad(math.random(-30, 30)));
                                    elseif v175.DesyncMode == "Custom" then
                                        local v1073 = Vector3.new(math.sin(tick() * 2) * v175.DesyncStrength, v175.DesyncJitter and math.cos(tick() * 3) * v175.DesyncJitterStrength or 0, math.cos(tick() * 2) * v175.DesyncStrength);
                                        l_RootPart_0.CFrame = l_RootPart_0.CFrame * CFrame.new(v1073) * CFrame.Angles(math.rad(v175.DesyncCustomRotation.X), math.rad(v175.DesyncCustomRotation.Y), math.rad(v175.DesyncCustomRotation.Z));
                                    end;
                                    if v175.DesyncLeanMode ~= "None" then
                                        local v1074 = v175.DesyncLeanMode == "Left" and -1 or 1;
                                        if v175.DesyncLeanMode == "Switch" then
                                            v1058 = not v1058;
                                            v1074 = v1058 and 1 or -1;
                                        end;
                                        v1062.LocalFighter.LocalCameraLean = v1074;
                                        v1062.LocalFighter:SetReplicate("CameraLean", v1074);
                                    end;
                                    if v175.DesyncBreakWalk and l_MoveDirection_0.Magnitude > 0.1 then
                                        l_Humanoid_4:Move(Vector3.new(), false);
                                        task.wait();
                                        l_Humanoid_4:Move(l_MoveDirection_0, false);
                                    end;
                                end;
                            end;
                        end;
                        task.wait();
                    end;
                    local v1075 = require(game:GetService("Players").LocalPlayer.PlayerScripts.Controllers.FighterController);
                    if v1075 and v1075.LocalFighter then
                        v1075.LocalFighter.LocalCameraLean = 0;
                        v1075.LocalFighter:SetReplicate("CameraLean", 0);
                    end;
                end);
            end;
        end);
        v1055:AddDropdown("DesyncMode", {
            Title = "Desync Mode", 
            Description = "Changes how the desync behaves", 
            Values = {
                "Prediction", 
                "Teleport", 
                "Spin", 
                "Random", 
                "Custom"
            }, 
            Default = v175.DesyncMode, 
            Callback = function(v1076) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncMode = v1076;
                v31:ExportSettings();
            end
        });
        v1055:AddSlider("DesyncStrength", {
            Title = "Desync Strength", 
            Description = "Adjusts the intensity of the desync", 
            Default = v175.DesyncStrength, 
            Min = 1, 
            Max = 20, 
            Rounding = 1, 
            Callback = function(v1077) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncStrength = v1077;
                v31:ExportSettings();
            end
        });
        v1055:AddSlider("DesyncUpdateRate", {
            Title = "Update Rate", 
            Description = "How often the desync updates (seconds)", 
            Default = v175.DesyncUpdateRate, 
            Min = 0.01, 
            Max = 0.1, 
            Rounding = 2, 
            Callback = function(v1078) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncUpdateRate = v1078;
                v31:ExportSettings();
            end
        });
        v1055:AddToggle("DesyncFakeLag", {
            Title = "Enable Fake Lag", 
            Description = "Adds network delay simulation", 
            Default = v175.DesyncFakeLag
        }):OnChanged(function(v1079) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v31 (ref)
            v175.DesyncFakeLag = v1079;
            v31:ExportSettings();
        end);
        v1055:AddSlider("DesyncFakeLagAmount", {
            Title = "Fake Lag Amount", 
            Description = "How much lag to simulate (seconds)", 
            Default = v175.DesyncFakeLagAmount, 
            Min = 0.1, 
            Max = 0.5, 
            Rounding = 2, 
            Callback = function(v1080) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncFakeLagAmount = v1080;
                v31:ExportSettings();
            end
        });
        v1055:AddToggle("DesyncJitter", {
            Title = "Enable Jitter", 
            Description = "Adds vertical jitter to desync", 
            Default = v175.DesyncJitter
        }):OnChanged(function(v1081) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v31 (ref)
            v175.DesyncJitter = v1081;
            v31:ExportSettings();
        end);
        v1055:AddSlider("DesyncJitterStrength", {
            Title = "Jitter Strength", 
            Description = "How strong the jitter effect is", 
            Default = v175.DesyncJitterStrength, 
            Min = 1, 
            Max = 50, 
            Rounding = 1, 
            Callback = function(v1082) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncJitterStrength = v1082;
                v31:ExportSettings();
            end
        });
        v1055:AddToggle("DesyncAutoDirection", {
            Title = "Auto Direction", 
            Description = "Automatically adjusts desync based on movement", 
            Default = v175.DesyncAutoDirection
        }):OnChanged(function(v1083) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v31 (ref)
            v175.DesyncAutoDirection = v1083;
            v31:ExportSettings();
        end);
        v1055:AddToggle("DesyncBreakWalk", {
            Title = "Break Walk", 
            Description = "Breaks walk animation for extra desync", 
            Default = v175.DesyncBreakWalk
        }):OnChanged(function(v1084) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v175 (ref), v31 (ref)
            v175.DesyncBreakWalk = v1084;
            v31:ExportSettings();
        end);
        v1055:AddDropdown("DesyncLeanMode", {
            Title = "Lean Mode", 
            Description = "Character lean behavior during desync", 
            Values = {
                "None", 
                "Left", 
                "Right", 
                "Switch"
            }, 
            Default = v175.DesyncLeanMode, 
            Callback = function(v1085) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncLeanMode = v1085;
                v31:ExportSettings();
            end
        });
        local v1086 = l_v50_0.HvH:AddSection("Custom Rotation");
        v1086:AddSlider("CustomRotationX", {
            Title = "X Rotation", 
            Description = "Custom X-axis rotation", 
            Default = v175.DesyncCustomRotation.X, 
            Min = -180, 
            Max = 180, 
            Rounding = 1, 
            Callback = function(v1087) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncCustomRotation = Vector3.new(v1087, v175.DesyncCustomRotation.Y, v175.DesyncCustomRotation.Z);
                v31:ExportSettings();
            end
        });
        v1086:AddSlider("CustomRotationY", {
            Title = "Y Rotation", 
            Description = "Custom Y-axis rotation", 
            Default = v175.DesyncCustomRotation.Y, 
            Min = -180, 
            Max = 180, 
            Rounding = 1, 
            Callback = function(v1088) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncCustomRotation = Vector3.new(v175.DesyncCustomRotation.X, v1088, v175.DesyncCustomRotation.Z);
                v31:ExportSettings();
            end
        });
        v1086:AddSlider("CustomRotationZ", {
            Title = "Z Rotation", 
            Description = "Custom Z-axis rotation", 
            Default = v175.DesyncCustomRotation.Z, 
            Min = -180, 
            Max = 180, 
            Rounding = 1, 
            Callback = function(v1089) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v175 (ref), v31 (ref)
                v175.DesyncCustomRotation = Vector3.new(v175.DesyncCustomRotation.X, v175.DesyncCustomRotation.Y, v1089);
                v31:ExportSettings();
            end
        });
    end;
    l_CreateWindow_0 = function(v1090) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v50 (ref), v44 (ref)
        if v50 and typeof(v1090) == "string" then
            v50:Notify({
                Title = string.format("%s   ", string.format(v44[os.date("*t").month], "Luasec")), 
                Content = v1090, 
                SubContent = "By @ Luasec Development", 
                Duration = 1.5
            });
        end;
    end;
    l_CreateWindow_0(" Upgrade to unlock all Options ");
    l_v50_0 = {
        ResetAimbotFields = function(_, v1092, v1093) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v54 (ref), v55 (ref), v56 (ref), l_UserInputService_1 (ref), l_MouseDeltaSensitivity_0 (ref)
            v54 = v1092 and v54 or false;
            v55 = v1093 and v55 or nil;
            if v56 then
                v56:Cancel();
                v56 = nil;
            end;
            l_UserInputService_1.MouseDeltaSensitivity = l_MouseDeltaSensitivity_0;
        end, 
        ResetSecondaryFields = function(_) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v58 (ref), v59 (ref), v60 (ref)
            v58 = false;
            v59 = false;
            v60 = false;
        end
    };
    if v43 then
        v69 = nil;
        do
            local l_v69_0, l_l_format_0_0, l_v71_1, l_v72_0 = v69, l_format_0, v71, v72;
            l_v69_0 = l_UserInputService_1.InputBegan:Connect(function(v1099) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), l_v69_0 (ref), l_UserInputService_1 (ref), v40 (ref), v54 (ref), l_v50_0 (ref), l_CreateWindow_0 (ref), v10 (ref), v59 (ref), v60 (ref), v61 (ref)
                if not v50 then
                    l_v69_0:Disconnect();
                elseif not l_UserInputService_1:GetFocusedTextBox() then
                    if v40.Aimbot and (v1099.KeyCode == v40.AimKey or v1099.UserInputType == v40.AimKey) then
                        if v54 then
                            l_v50_0:ResetAimbotFields();
                            l_CreateWindow_0("[Aiming Mode]: OFF");
                        else
                            v54 = true;
                            l_CreateWindow_0("[Aiming Mode]: ON");
                        end;
                    elseif not v10 and getfenv().mouse1click and v40.TriggerBot and (v1099.KeyCode == v40.TriggerKey or v1099.UserInputType == v40.TriggerKey) then
                        if v59 then
                            v59 = false;
                            l_CreateWindow_0("[Triggering Mode]: OFF");
                        else
                            v59 = true;
                            l_CreateWindow_0("[Triggering Mode]: ON");
                        end;
                    elseif not v10 and getfenv().Drawing and getfenv().Drawing.new and v40.FoV and (v1099.KeyCode == v40.FoVKey or v1099.UserInputType == v40.FoVKey) then
                        if v60 then
                            v60 = false;
                            l_CreateWindow_0("[FoV Show]: OFF");
                        else
                            v60 = true;
                            l_CreateWindow_0("[FoV Show]: ON");
                        end;
                    elseif not v10 and getfenv().Drawing and getfenv().Drawing.new and (v40.ESPBox or v40.NameESP or v40.HealthESP or v40.MagnitudeESP or v40.TracerESP) and (v1099.KeyCode == v40.ESPKey or v1099.UserInputType == v40.ESPKey) then
                        if v61 then
                            v61 = false;
                            l_CreateWindow_0("[ESP Show]: OFF");
                        else
                            v61 = true;
                            l_CreateWindow_0("[ESP Show]: ON");
                        end;
                    end;
                end;
            end);
            l_l_format_0_0 = nil;
            l_l_format_0_0 = l_UserInputService_1.InputEnded:Connect(function(v1100) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), l_l_format_0_0 (ref), l_UserInputService_1 (ref), v54 (ref), v40 (ref), l_v50_0 (ref), l_CreateWindow_0 (ref), v58 (ref), v59 (ref)
                if not v50 then
                    l_l_format_0_0:Disconnect();
                elseif not l_UserInputService_1:GetFocusedTextBox() then
                    if v54 and not v40.OnePressAimingMode and (v1100.KeyCode == v40.AimKey or v1100.UserInputType == v40.AimKey) then
                        l_v50_0:ResetAimbotFields();
                        l_CreateWindow_0("[Aiming Mode]: OFF");
                    elseif v58 and not v40.OnePressSpinningMode and (v1100.KeyCode == v40.SpinKey or v1100.UserInputType == v40.SpinKey) then
                        v58 = false;
                        l_CreateWindow_0("[Spinning Mode]: OFF");
                    elseif v59 and not v40.OnePressTriggeringMode and (v1100.KeyCode == v40.TriggerKey or v1100.UserInputType == v40.TriggerKey) then
                        v59 = false;
                        l_CreateWindow_0("[Triggering Mode]: OFF");
                    end;
                end;
            end);
            l_v71_1 = nil;
            l_v71_1 = l_UserInputService_1.WindowFocused:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), l_v71_1 (ref), v52 (ref)
                if not v50 then
                    l_v71_1:Disconnect();
                else
                    v52 = true;
                end;
            end);
            l_v72_0 = nil;
            l_v72_0 = l_UserInputService_1.WindowFocusReleased:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v50 (ref), l_v72_0 (ref), v52 (ref)
                if not v50 then
                    l_v72_0:Disconnect();
                else
                    v52 = false;
                end;
            end);
        end;
    end;
    v69 = {
        CalculateDirection = function(_, v1102, v1103, v1104) --[[ Line: 0 ]] --[[ Name:  ]]
            return typeof(v1102) == "Vector3" and typeof(v1103) == "Vector3" and typeof(v1104) == "number" and (v1103 - v1102).Unit * v1104 or Vector3.zero;
        end, 
        CalculateChance = function(_, v1106) --[[ Line: 0 ]] --[[ Name:  ]]
            return typeof(v1106) == "number" and math.round(math.clamp(v1106, 1, 100)) / 100 >= math.round(Random.new():NextNumber() * 100) / 100;
        end, 
        Abbreviate = function(_, v1108) --[[ Line: 0 ]] --[[ Name:  ]]
            if typeof(v1108) == "number" then
                local v1109 = {
                    D = 1.0E33, 
                    N = 1.0E30, 
                    O = 1.0E27, 
                    Sp = 1.0E24, 
                    Sx = 1.0E21, 
                    Qn = 1.0E18, 
                    Qd = 1000000000000000, 
                    T = 1000000000000, 
                    B = 1000000000, 
                    M = 1000000, 
                    K = 1000
                };
                local v1110 = 0;
                local v1111 = tostring(math.round(v1108));
                for v1112, v1113 in next, v1109 do
                    if math.abs(v1108) < 1.0E36 then
                        if v1113 <= math.abs(v1108) and v1110 < v1113 then
                            v1110 = v1113;
                            v1111 = string.format("%s%s", tostring(math.round(v1108 / v1113)), v1112);
                        end;
                    else
                        v1111 = "inf";
                        break;
                    end;
                end;
                return v1111;
            else
                return v1108;
            end;
        end
    };
    l_format_0 = function(v1114) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if not v1114 or not v1114.Character then
            return false;
        else
            local l_HumanoidRootPart_4 = v1114.Character:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_4 then
                return false;
            elseif l_HumanoidRootPart_4:FindFirstChild("TeammateLabel") then
                return true;
            elseif v1114.Team and l_LocalPlayer_0.Team then
                return v1114.Team == l_LocalPlayer_0.Team;
            else
                return false;
            end;
        end;
    end;
    v71 = function(v1116) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v40 (ref), l_LocalPlayer_1 (ref), l_Players_1 (ref), l_format_0 (ref), v69 (ref)
        if v1116 and v1116:FindFirstChildWhichIsA("Humanoid") and v40.AimPart and v1116:FindFirstChild(v40.AimPart) and v1116:FindFirstChild(v40.AimPart):IsA("BasePart") and l_LocalPlayer_1.Character and l_LocalPlayer_1.Character:FindFirstChildWhichIsA("Humanoid") and l_LocalPlayer_1.Character:FindFirstChild(v40.AimPart) and l_LocalPlayer_1.Character:FindFirstChild(v40.AimPart):IsA("BasePart") then
            local l_l_Players_1_PlayerFromCharacter_0 = l_Players_1:GetPlayerFromCharacter(v1116);
            if not l_l_Players_1_PlayerFromCharacter_0 or l_l_Players_1_PlayerFromCharacter_0 == l_LocalPlayer_1 then
                return false;
            else
                local l_Humanoid_5 = v1116:FindFirstChildWhichIsA("Humanoid");
                local _ = v1116:FindFirstChildWhichIsA("Head");
                local l_v1116_FirstChild_0 = v1116:FindFirstChild(v40.AimPart);
                local l_FirstChild_4 = l_LocalPlayer_1.Character:FindFirstChild(v40.AimPart);
                if v40.AliveCheck and l_Humanoid_5.Health == 0 or v40.GodCheck and (l_Humanoid_5.Health >= 1.0E36 or v1116:FindFirstChildWhichIsA("ForceField")) then
                    return false;
                elseif v40.TeamCheck and l_format_0(l_l_Players_1_PlayerFromCharacter_0) then
                    return false;
                elseif v40.FriendCheck and l_l_Players_1_PlayerFromCharacter_0:IsFriendsWith(l_LocalPlayer_1.UserId) then
                    return false;
                elseif v40.FollowCheck and l_l_Players_1_PlayerFromCharacter_0.FollowUserId == l_LocalPlayer_1.UserId or v40.VerifiedBadgeCheck and l_l_Players_1_PlayerFromCharacter_0.HasVerifiedBadge then
                    return false;
                else
                    if v40.WallCheck then
                        local v1122 = v69:CalculateDirection(l_FirstChild_4.Position, l_v1116_FirstChild_0.Position, (l_v1116_FirstChild_0.Position - l_FirstChild_4.Position).Magnitude);
                        local v1123 = RaycastParams.new();
                        v1123.FilterType = Enum.RaycastFilterType.Exclude;
                        v1123.FilterDescendantsInstances = {
                            l_LocalPlayer_1.Character
                        };
                        local v1124 = workspace:Raycast(l_FirstChild_4.Position, v1122, v1123);
                        if not v1124 or not v1124.Instance or not v1124.Instance:FindFirstAncestor(l_l_Players_1_PlayerFromCharacter_0.Name) then
                            return false;
                        end;
                    elseif v40.MagnitudeCheck and (l_v1116_FirstChild_0.Position - l_FirstChild_4.Position).Magnitude > v40.TriggerMagnitude then
                        return false;
                    elseif v40.WhitelistedGroupCheck and l_l_Players_1_PlayerFromCharacter_0:IsInGroup(v40.WhitelistedGroup) or v40.BlacklistedGroupCheck and not l_l_Players_1_PlayerFromCharacter_0:IsInGroup(v40.BlacklistedGroup) then
                        return false;
                    elseif v40.IgnoredPlayersCheck and table.find(v40.IgnoredPlayers, l_l_Players_1_PlayerFromCharacter_0.Name) or v40.TargetPlayersCheck and not table.find(v40.TargetPlayers, l_l_Players_1_PlayerFromCharacter_0.Name) then
                        return false;
                    end;
                    local v1125 = v40.UseOffset and (v40.AutoOffset and Vector3.new(0, l_v1116_FirstChild_0.Position.Y * v40.StaticOffsetIncrement * (l_v1116_FirstChild_0.Position - l_FirstChild_4.Position).Magnitude / 1000 <= v40.MaxAutoOffset and l_v1116_FirstChild_0.Position.Y * v40.StaticOffsetIncrement * (l_v1116_FirstChild_0.Position - l_FirstChild_4.Position).Magnitude / 1000 or v40.MaxAutoOffset, 0) + l_Humanoid_5.MoveDirection * v40.DynamicOffsetIncrement / 10 or v40.OffsetType == "Static" and Vector3.new(0, l_v1116_FirstChild_0.Position.Y * v40.StaticOffsetIncrement / 10, 0) or v40.OffsetType == "Dynamic" and l_Humanoid_5.MoveDirection * v40.DynamicOffsetIncrement / 10 or Vector3.new(0, l_v1116_FirstChild_0.Position.Y * v40.StaticOffsetIncrement / 10, 0) + l_Humanoid_5.MoveDirection * v40.DynamicOffsetIncrement / 10) or Vector3.zero;
                    local v1126 = v40.UseNoise and Vector3.new(Random.new():NextNumber(-v40.NoiseFrequency / 100, v40.NoiseFrequency / 100), Random.new():NextNumber(-v40.NoiseFrequency / 100, v40.NoiseFrequency / 100), Random.new():NextNumber(-v40.NoiseFrequency / 100, v40.NoiseFrequency / 100)) or Vector3.zero;
                    return true, v1116, {
                        workspace.CurrentCamera:WorldToViewportPoint(l_v1116_FirstChild_0.Position + v1125 + v1126)
                    }, l_v1116_FirstChild_0.Position + v1125 + v1126, (l_v1116_FirstChild_0.Position + v1125 + v1126 - l_FirstChild_4.Position).Magnitude, CFrame.new(l_v1116_FirstChild_0.Position + v1125 + v1126) * CFrame.fromEulerAnglesYXZ(math.rad(l_v1116_FirstChild_0.Orientation.X), math.rad(l_v1116_FirstChild_0.Orientation.Y), math.rad(l_v1116_FirstChild_0.Orientation.Z)), l_v1116_FirstChild_0;
                end;
            end;
        else
            return false;
        end;
    end;
    v72 = {
        Raycast = {
            Required = 3, 
            Arguments = {
                "Instance", 
                "Vector3", 
                "Vector3", 
                "RaycastParams"
            }
        }, 
        FindPartOnRay = {
            Required = 2, 
            Arguments = {
                "Instance", 
                "Ray", 
                "Instance", 
                "boolean", 
                "boolean"
            }
        }, 
        FindPartOnRayWithIgnoreList = {
            Required = 3, 
            Arguments = {
                "Instance", 
                "Ray", 
                "table", 
                "boolean", 
                "boolean"
            }
        }, 
        FindPartOnRayWithWhitelist = {
            Required = 3, 
            Arguments = {
                "Instance", 
                "Ray", 
                "table", 
                "boolean"
            }
        }
    };
    v73 = function(v1127, v1128) --[[ Line: 0 ]] --[[ Name:  ]]
        if typeof(v1127) ~= "table" or typeof(v1128) ~= "table" or #v1127 < v1128.Required then
            return false;
        else
            local v1129 = 0;
            for v1130, v1131 in next, v1127 do
                if typeof(v1131) == v1128.Arguments[v1130] then
                    v1129 = v1129 + 1;
                end;
            end;
            return v1128.Required <= v1129;
        end;
    end;
    local v1132 = 0;
    local function v1134() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v10 (ref), v43 (ref), v59 (ref), v40 (ref), v54 (ref), l_l_LocalPlayer_1_Mouse_0 (ref), v71 (ref), v69 (ref), v1132 (ref)
        if not v10 and getfenv().mouse1click and v43 and v59 and (v40.SmartTriggerBot and v54 or not v40.SmartTriggerBot) and l_l_LocalPlayer_1_Mouse_0.Target and v71(l_l_LocalPlayer_1_Mouse_0.Target:FindFirstAncestorWhichIsA("Model")) and v69:CalculateChance(v40.TriggerBotChance) then
            local v1133 = tick();
            if v40.TriggerBotDelay == 0 or v1133 - v1132 >= v40.TriggerBotDelay then
                getfenv().mouse1click();
                v1132 = v1133;
            end;
        end;
    end;
    local function v1135() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v50 (ref), v53 (ref), v40 (ref)
        if v50 and os.clock() - v53 >= 1 then
            if v40.RandomAimPart and #v40.AimPartDropdownValues > 0 then
                v50.Options.AimPart:SetValue(v40.AimPartDropdownValues[Random.new():NextInteger(1, #v40.AimPartDropdownValues)]);
            end;
            if v40.RandomSpinPart and #v40.SpinPartDropdownValues > 0 then
                v50.Options.SpinPart:SetValue(v40.SpinPartDropdownValues[Random.new():NextInteger(1, #v40.SpinPartDropdownValues)]);
            end;
            v53 = os.clock();
        end;
    end;
    local v1139 = {
        Visualize = function(_, v1137) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v10 (ref), v50 (ref), v40 (ref)
            if not v10 and v50 and getfenv().Drawing and getfenv().Drawing.new and typeof(v1137) == "string" and string.lower(v1137) == "fov" then
                local v1138 = getfenv().Drawing.new("Circle");
                v1138.Visible = false;
                v1138.ZIndex = 4;
                v1138.NumSides = 1000;
                v1138.Radius = v40.FoVRadius;
                v1138.Thickness = v40.FoVThickness;
                v1138.Transparency = v40.FoVOpacity;
                v1138.Filled = v40.FoVFilled;
                v1138.Color = v40.FoVColour;
                return v1138;
            else
                return nil;
            end;
        end
    };
    local v1140 = {
        FoV = v1139:Visualize("FoV")
    };
    v1139.ClearVisual = function(_, v1142, v1143) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v1140 (ref)
        local v1144 = table.find(v1140, v1142);
        if v1142 and (v1144 or v1143 == "FoV") then
            if v1142.Destroy then
                v1142:Destroy();
            elseif v1142.Remove then
                v1142:Remove();
            end;
            if v1144 then
                table.remove(v1140, v1144);
            elseif v1143 == "FoV" then
                v1140.FoV = nil;
            end;
        end;
    end;
    v1139.ClearVisuals = function(v1145) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v1140 (ref)
        for v1146, v1147 in next, v1140 do
            v1145:ClearVisual(v1147, v1146);
        end;
    end;
    v1139.VisualizeFoV = function(v1148) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v50 (ref), l_UserInputService_1 (ref), v1140 (ref), v40 (ref), v60 (ref)
        if not v50 then
            return v1148:ClearVisuals();
        else
            local l_l_UserInputService_1_MouseLocation_0 = l_UserInputService_1:GetMouseLocation();
            v1140.FoV.Position = Vector2.new(l_l_UserInputService_1_MouseLocation_0.X, l_l_UserInputService_1_MouseLocation_0.Y);
            v1140.FoV.Radius = v40.FoVRadius;
            v1140.FoV.Thickness = v40.FoVThickness;
            v1140.FoV.Transparency = v40.FoVOpacity;
            v1140.FoV.Filled = v40.FoVFilled;
            v1140.FoV.Color = v40.FoVColour;
            v1140.FoV.Visible = v60;
            return;
        end;
    end;
    local _ = tick();
    local _ = 0.03;
    local v1152 = 0;
    local v1153 = nil;
    v1153 = l_RunService_0[v17.RenderingMode]:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v50 (ref), v1153 (ref), v40 (ref), v54 (ref), l_v50_0 (ref), v59 (ref), v60 (ref), v61 (ref), v52 (ref), v1134 (ref), v1135 (ref), v10 (ref), v1139 (ref), v55 (ref), v71 (ref), l_Players_1 (ref), l_LocalPlayer_1 (ref), l_l_LocalPlayer_1_Mouse_0 (ref), v43 (ref), l_UserInputService_1 (ref), v56 (ref), l_TweenService_1 (ref)
        if v50.Unloaded then
            v50 = nil;
            TrackingHandler:DisconnectAimbot();
            v1153:Disconnect();
        elseif not v40.Aimbot and v54 then
            l_v50_0:ResetAimbotFields();
        elseif not v40.TriggerBot and v59 then
            v59 = false;
        elseif not v40.FoV and v60 then
            v60 = false;
        elseif not v40.ESPBox and not v40.NameESP and not v40.HealthESP and not v40.MagnitudeESP and not v40.TracerESP and v61 then
            v61 = false;
        end;
        if v52 then
            v1134();
            v1135();
            if not v10 and getfenv().Drawing and getfenv().Drawing.new then
                v1139:VisualizeFoV();
            end;
            if v54 then
                local l_v55_0 = v55;
                local l_huge_4 = math.huge;
                if not v71(l_v55_0) then
                    if l_v55_0 and not v40.OffAimbotAfterKill or not l_v55_0 then
                        for _, v1157 in next, l_Players_1:GetPlayers() do
                            local v1158, v1159, v1160, v1161 = v71(v1157.Character);
                            if v1158 and v1160[2] and (v1161 - l_LocalPlayer_1.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= v40.MaxTrackingDistance then
                                local l_Magnitude_2 = (Vector2.new(l_l_LocalPlayer_1_Mouse_0.X, l_l_LocalPlayer_1_Mouse_0.Y) - Vector2.new(v1160[1].X, v1160[1].Y)).Magnitude;
                                if l_Magnitude_2 <= l_huge_4 and l_Magnitude_2 <= (v40.FoVCheck and v40.FoVRadius or l_huge_4) then
                                    v55 = v1159;
                                    l_huge_4 = l_Magnitude_2;
                                end;
                            end;
                        end;
                    else
                        l_v50_0:ResetAimbotFields();
                    end;
                end;
                local v1163, _, v1165, v1166 = v71(v55);
                if v1163 then
                    if not v10 and getfenv().mousemoverel and v43 and v40.AimMode == "Mouse" then
                        if v1165[2] then
                            l_v50_0:ResetAimbotFields(true, true);
                            local l_l_UserInputService_1_MouseLocation_1 = l_UserInputService_1:GetMouseLocation();
                            local v1168 = v40.UseSensitivity and v40.Sensitivity / 5 or 10;
                            getfenv().mousemoverel((v1165[1].X - l_l_UserInputService_1_MouseLocation_1.X) / v1168, (v1165[1].Y - l_l_UserInputService_1_MouseLocation_1.Y) / v1168);
                        else
                            l_v50_0:ResetAimbotFields(true);
                        end;
                    elseif v40.AimMode == "Camera" then
                        l_UserInputService_1.MouseDeltaSensitivity = 0;
                        if v40.UseSensitivity then
                            v56 = l_TweenService_1:Create(workspace.CurrentCamera, TweenInfo.new(math.clamp(v40.Sensitivity, 9, 99) / 100, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v1166)
                            });
                            v56:Play();
                        else
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v1166);
                        end;
                    end;
                else
                    l_v50_0:ResetAimbotFields(true);
                end;
            end;
        end;
    end);
    local v1169 = tick();
    local v1170 = 120;
    local v1171 = 10;
    if v1152 % 4 == 0 then
        pcall(v1135);
        local v1172 = tick();
        if v1170 <= v1172 - v1169 and v1171 <= gcinfo() then
            gcinfo();
            collectgarbage("collect");
            v1169 = v1172;
        end;
    end;
    if v40.SilentAim then
        v5 = true;
        getgenv().SilentAimEnabled = true;
        if not v6 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EndOverdosing/Luasec-API/refs/heads/main/rivals-modern/silent-aim.lua", true))();
            v6 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v5 (ref)
                getgenv().SilentAimEnabled = v5;
            end);
        end;
    else
        v5 = false;
        getgenv().SilentAimEnabled = false;
    end;
    game:GetService("Players").PlayerRemoving:Connect(function(v1173) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v40 (ref), v31 (ref)
        if v1173 == game:GetService("Players").LocalPlayer then
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref), v31 (ref)
                if v40 then
                    v31:SaveAllSettings();
                end;
            end);
            getgenv().DeflectingEnemies = {};
            if getgenv().currentDeflectSound then
                getgenv().currentDeflectSound:Stop();
                getgenv().currentDeflectSound:Destroy();
                getgenv().currentDeflectSound = nil;
            end;
            getgenv().isDeflectSoundPlaying = false;
        end;
    end);
    if v40.AntiKatana and isAllowedExecutor and isAllowedExecutor() then
        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
            local l_Players_8 = game:GetService("Players");
            local _ = game:GetService("ReplicatedStorage");
            local l_RunService_8 = game:GetService("RunService");
            local v1177 = nil;
            local l_LocalPlayer_11 = l_Players_8.LocalPlayer;
            local v1179 = nil;
            local v1180 = nil;
            local v1181 = false;
            getgenv().DeflectingEnemies = getgenv().DeflectingEnemies or {};
            local function v1185(v1182) --[[ Line: 0 ]] --[[ Name:  ]]
                local l_status_21, l_result_21 = pcall(require, v1182);
                if l_status_21 then
                    return l_result_21;
                else
                    warn("Anti-Katana: Failed to require", v1182, "-", l_result_21);
                    return nil;
                end;
            end;
            local function v1187() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1179 (ref), v1177 (ref)
                if v1179 then
                    return v1179;
                elseif not v1177 then
                    return nil;
                elseif type(v1177) == "table" and type(v1177.ReplicateFromServer) == "function" then
                    v1179 = v1177;
                    return v1179;
                else
                    local v1186 = getmetatable(v1177);
                    if v1186 and v1186.__index and type(v1186.__index.ReplicateFromServer) == "function" then
                        v1179 = v1186.__index;
                        return v1179;
                    else
                        warn("Anti-Katana: Could not find ReplicateFromServer function in required Katana module or its metatable.");
                        return nil;
                    end;
                end;
            end;
            local function v1196(v1188, v1189, ...) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1180 (ref)
                if not v1188 or not v1188.ClientFighter or not v1188.Info or not v1180 then
                    warn("Anti-Katana Hook: Invalid context or original function lost.");
                    if v1180 then
                        return v1180(v1188, v1189, ...);
                    else
                        return;
                    end;
                elseif v1188.Name == "Katana" and not v1188.ClientFighter.IsLocalPlayer and v1189 == "StartAiming" then
                    local l_ClientFighter_1 = v1188.ClientFighter;
                    local l_Player_1 = l_ClientFighter_1.Player;
                    local v1192 = l_Player_1 and l_Player_1.UserId or l_ClientFighter_1:Get("ObjectID");
                    if v1192 then
                        local v1193 = v1188.Info.DeflectDuration or 1;
                        local v1194 = tick() + v1193 + 0.1;
                        getgenv().DeflectingEnemies[v1192] = v1194;
                        do
                            local l_v1194_0 = v1194;
                            task.delay(v1193 + 0.15, function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v1192 (ref), l_v1194_0 (ref)
                                if getgenv().DeflectingEnemies and getgenv().DeflectingEnemies[v1192] == l_v1194_0 then
                                    getgenv().DeflectingEnemies[v1192] = nil;
                                end;
                            end);
                        end;
                    else
                        warn("Anti-Katana: Could not get enemy ID for deflecting Katana user.");
                    end;
                    return v1180(v1188, v1189, ...);
                elseif v1188.Name == "Katana" and not v1188.ClientFighter.IsLocalPlayer and v1189 == "DeflectHit" then
                    return;
                else
                    return v1180(v1188, v1189, ...);
                end;
            end;
            local function v1198() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1181 (ref), v1187 (ref), v1180 (ref), v1196 (ref)
                if v1181 then
                    return true;
                else
                    local v1197 = v1187();
                    if not v1197 then
                        return false;
                    elseif not v1180 then
                        if type(v1197.ReplicateFromServer) ~= "function" then
                            warn("Anti-Katana: Cannot hook! katanaClass.ReplicateFromServer is not a function, it is a", type(v1197.ReplicateFromServer));
                            return false;
                        else
                            v1180 = v1197.ReplicateFromServer;
                            if not v1180 then
                                warn("Anti-Katana: FAILED TO STORE ORIGINAL FUNCTION (it's nil after assignment)!");
                                return false;
                            else
                                v1197.ReplicateFromServer = v1196;
                                v1181 = true;
                                return true;
                            end;
                        end;
                    else
                        return false;
                    end;
                end;
            end;
            local v1199 = nil;
            v1199 = l_RunService_8.Stepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1181 (ref), v1199 (ref), v1177 (ref), l_LocalPlayer_11 (ref), v1185 (ref), v1198 (ref)
                if v1181 then
                    v1199:Disconnect();
                    return;
                else
                    if not v1177 then
                        local l_PlayerScripts_3 = l_LocalPlayer_11:FindFirstChild("PlayerScripts");
                        if l_PlayerScripts_3 then
                            local l_Modules_2 = l_PlayerScripts_3:FindFirstChild("Modules");
                            if l_Modules_2 then
                                local l_Items_1 = l_Modules_2:FindFirstChild("Items");
                                if l_Items_1 then
                                    local l_Katana_1 = l_Items_1:FindFirstChild("Katana");
                                    if l_Katana_1 then
                                        v1177 = v1185(l_Katana_1);
                                    else
                                        warn("Anti-Katana: Katana script not found in PlayerScripts.Modules.Items.");
                                    end;
                                else
                                    warn("Anti-Katana: Items folder not found in PlayerScripts.Modules.");
                                end;
                            else
                                warn("Anti-Katana: Modules folder not found in PlayerScripts.");
                            end;
                        end;
                    end;
                    if v1177 then
                        v1198();
                    end;
                    return;
                end;
            end);
        end);
    end;
    if v40.InventoryViewer and isAllowedExecutor and isAllowedExecutor() then
        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v40 (ref)
            print("Setting up Billboard Inventory Display for auto-initialization...");
            local l_Players_9 = game:GetService("Players");
            local l_ReplicatedStorage_4 = game:GetService("ReplicatedStorage");
            local l_RunService_9 = game:GetService("RunService");
            local v1207 = getgenv().MaxDisplaySlots or 5;
            local v1208 = "InventoryBillboard";
            local v1209 = UDim2.new(0, 50, 0, 50);
            local v1210 = UDim.new(0, 6);
            local v1211 = Color3.fromRGB(255, 255, 0);
            local v1212 = 2;
            local v1213 = Color3.fromRGB(255, 255, 255);
            local v1214 = 0.8;
            local v1215 = UDim.new(0.2, 0);
            local v1216 = nil;
            local v1217 = nil;
            local l_LocalPlayer_12 = l_Players_9.LocalPlayer;
            local function v1222(v1219) --[[ Line: 0 ]] --[[ Name:  ]]
                local l_status_22, l_result_22 = pcall(require, v1219);
                if l_status_22 then
                    return l_result_22;
                else
                    warn("Billboard Display: Failed to require", v1219, "-", l_result_22);
                    return nil;
                end;
            end;
            local function v1235() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: l_Players_9 (ref)
                local v1223 = nil;
                local l_huge_5 = math.huge;
                local l_Character_15 = l_Players_9.LocalPlayer.Character;
                local l_CurrentCamera_6 = workspace.CurrentCamera;
                if not l_Character_15 or not l_Character_15:FindFirstChild("HumanoidRootPart") then
                    return nil;
                else
                    local _ = l_Character_15.HumanoidRootPart;
                    for _, v1229 in l_Players_9:GetPlayers() do
                        if v1229 ~= l_Players_9.LocalPlayer and v1229.Character and v1229.Character:FindFirstChild("HumanoidRootPart") then
                            local l_Character_16 = v1229.Character;
                            local v1231 = l_Character_16:FindFirstChild("Head") or l_Character_16:FindFirstChild("HumanoidRootPart");
                            if v1231 then
                                local v1232, v1233 = l_CurrentCamera_6:WorldToViewportPoint(v1231.Position);
                                if v1233 then
                                    local l_Magnitude_3 = (Vector2.new(l_CurrentCamera_6.ViewportSize.X / 2, l_CurrentCamera_6.ViewportSize.Y / 2) - Vector2.new(v1232.X, v1232.Y)).Magnitude;
                                    if l_Magnitude_3 < l_huge_5 then
                                        v1223 = l_Character_16;
                                        l_huge_5 = l_Magnitude_3;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return v1223;
                end;
            end;
            if not v1216 then
                v1216 = v1222(l_LocalPlayer_12.PlayerScripts.Controllers.FighterController);
            end;
            if not v1217 then
                v1217 = v1222(l_ReplicatedStorage_4.Modules.ItemLibrary);
            end;
            local v1236 = {};
            local function v1247(v1237) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1208 (ref), v1209 (ref), v1210 (ref), v1207 (ref), v1213 (ref), v1214 (ref), v1215 (ref), v1211 (ref), v1212 (ref), v1236 (ref)
                if not v1237 or not v1237:FindFirstChild("Head") then
                    return nil;
                else
                    local l_Head_3 = v1237.Head;
                    local l_l_Head_3_FirstChild_0 = l_Head_3:FindFirstChild(v1208);
                    if l_l_Head_3_FirstChild_0 then
                        l_l_Head_3_FirstChild_0.Enabled = true;
                        return l_l_Head_3_FirstChild_0;
                    else
                        local l_BillboardGui_1 = Instance.new("BillboardGui");
                        l_BillboardGui_1.Name = v1208;
                        l_BillboardGui_1.Adornee = l_Head_3;
                        l_BillboardGui_1.Size = UDim2.new(0, (v1209.X.Offset + v1210.Offset) * v1207, 0, v1209.Y.Offset + 10);
                        l_BillboardGui_1.StudsOffset = Vector3.new(0, 2.5, 0);
                        l_BillboardGui_1.AlwaysOnTop = true;
                        l_BillboardGui_1.LightInfluence = 0;
                        l_BillboardGui_1.ResetOnSpawn = false;
                        l_BillboardGui_1.Enabled = true;
                        local l_Frame_3 = Instance.new("Frame");
                        l_Frame_3.Name = "Container";
                        l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
                        l_Frame_3.BackgroundTransparency = 1;
                        l_Frame_3.Parent = l_BillboardGui_1;
                        local l_UIListLayout_1 = Instance.new("UIListLayout");
                        l_UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal;
                        l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                        l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center;
                        l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
                        l_UIListLayout_1.Padding = v1210;
                        l_UIListLayout_1.Parent = l_Frame_3;
                        for v1243 = 1, v1207 do
                            local l_ImageLabel_1 = Instance.new("ImageLabel");
                            l_ImageLabel_1.Name = "Slot_" .. v1243;
                            l_ImageLabel_1.Size = v1209;
                            l_ImageLabel_1.BackgroundColor3 = v1213;
                            l_ImageLabel_1.BackgroundTransparency = v1214;
                            l_ImageLabel_1.Image = "";
                            l_ImageLabel_1.Visible = false;
                            l_ImageLabel_1.LayoutOrder = v1243;
                            l_ImageLabel_1.Parent = l_Frame_3;
                            local l_UICorner_2 = Instance.new("UICorner");
                            l_UICorner_2.CornerRadius = v1215;
                            l_UICorner_2.Parent = l_ImageLabel_1;
                            local l_UIStroke_1 = Instance.new("UIStroke");
                            l_UIStroke_1.Name = "Highlight";
                            l_UIStroke_1.Color = v1211;
                            l_UIStroke_1.Thickness = v1212;
                            l_UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                            l_UIStroke_1.Enabled = false;
                            l_UIStroke_1.Parent = l_ImageLabel_1;
                        end;
                        l_BillboardGui_1.Parent = l_Head_3;
                        v1236[v1237] = l_BillboardGui_1;
                        print("Created Billboard for", v1237.Name);
                        return l_BillboardGui_1;
                    end;
                end;
            end;
            local function v1250() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1236 (ref)
                print("Cleaning up inventory billboards...");
                for _, v1249 in pairs(v1236) do
                    if v1249 and v1249.Parent then
                        v1249:Destroy();
                    end;
                end;
                v1236 = {};
            end;
            local v1251 = nil;
            local v1284 = l_RunService_9.Stepped:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref), v1250 (ref), v1217 (ref), v1222 (ref), l_ReplicatedStorage_4 (ref), v1216 (ref), l_LocalPlayer_12 (ref), v1235 (ref), v1251 (ref), v1236 (ref), l_Players_9 (ref), v1247 (ref), v1207 (ref)
                if not v40.InventoryViewer then
                    inventoryUpdateConnection:Disconnect();
                    v1250();
                    return;
                else
                    if not v1217 or type(v1217) ~= "table" then
                        v1217 = v1222(l_ReplicatedStorage_4.Modules.ItemLibrary);
                        if not v1217 then
                            return;
                        end;
                    end;
                    if not v1216 or type(v1216) ~= "table" then
                        v1216 = v1222(l_LocalPlayer_12.PlayerScripts.Controllers.FighterController);
                        if not v1216 then
                            return;
                        end;
                    end;
                    local v1252 = v1235();
                    if v1252 ~= v1251 then
                        if v1251 and v1236[v1251] then
                            v1236[v1251].Enabled = false;
                        end;
                        v1251 = v1252;
                        if not v1251 then
                            return;
                        end;
                    end;
                    if not v1251 then
                        for v1253, v1254 in pairs(v1236) do
                            if typeof(v1253) == "Instance" and v1253.Parent and v1254 then
                                v1254.Enabled = false;
                            elseif not typeof(v1253) == "Instance" or not v1253.Parent then
                                if v1254 then
                                    v1254:Destroy();
                                end;
                                v1236[v1253] = nil;
                            end;
                        end;
                        return;
                    else
                        local l_l_Players_9_PlayerFromCharacter_0 = l_Players_9:GetPlayerFromCharacter(v1251);
                        if not l_l_Players_9_PlayerFromCharacter_0 then
                            return;
                        else
                            local l_v1216_Fighter_0 = v1216:GetFighter(l_l_Players_9_PlayerFromCharacter_0);
                            if not l_v1216_Fighter_0 then
                                return;
                            else
                                local v1257 = v1247(v1251);
                                if not v1257 then
                                    return;
                                else
                                    local l_Container_1 = v1257:FindFirstChild("Container");
                                    if not l_Container_1 then
                                        return;
                                    else
                                        local l_EquippedItem_1 = l_v1216_Fighter_0.EquippedItem;
                                        local v1260 = l_EquippedItem_1 and l_EquippedItem_1.Name or nil;
                                        local v1261 = l_v1216_Fighter_0.Loadout or l_v1216_Fighter_0.Slots or l_v1216_Fighter_0.Items or l_v1216_Fighter_0.EquippedItems;
                                        local v1262 = 0;
                                        local v1263 = {};
                                        if type(v1261) == "table" then
                                            local v1264 = table.find(getmetatable(v1261) or {}, "__len") ~= nil;
                                            local v1265 = {};
                                            if v1264 then
                                                for v1266, v1267 in ipairs(v1261) do
                                                    table.insert(v1265, {
                                                        key = v1266, 
                                                        value = v1267
                                                    });
                                                end;
                                            else
                                                local v1268 = {};
                                                for v1269, v1270 in pairs(v1261) do
                                                    table.insert(v1268, {
                                                        key = v1269, 
                                                        value = v1270
                                                    });
                                                end;
                                                table.sort(v1268, function(v1271, v1272) --[[ Line: 0 ]] --[[ Name:  ]]
                                                    if tonumber(v1271.key) and tonumber(v1272.key) then
                                                        return tonumber(v1271.key) < tonumber(v1272.key);
                                                    else
                                                        return tostring(v1271.key) < tostring(v1272.key);
                                                    end;
                                                end);
                                                v1265 = v1268;
                                            end;
                                            for _, v1274 in ipairs(v1265) do
                                                if v1207 > v1262 then
                                                    local l_value_1 = v1274.value;
                                                    local v1276 = nil;
                                                    if type(l_value_1) == "string" then
                                                        v1276 = l_value_1;
                                                    elseif type(l_value_1) == "table" and l_value_1.Name then
                                                        v1276 = l_value_1.Name;
                                                    elseif l_value_1 and l_value_1:IsA("Tool") then
                                                        v1276 = l_value_1.Name;
                                                    end;
                                                    if v1276 and not v1263[v1276] then
                                                        v1263[v1276] = true;
                                                        v1262 = v1262 + 1;
                                                        local l_l_Container_1_FirstChild_0 = l_Container_1:FindFirstChild("Slot_" .. v1262);
                                                        local v1278 = l_l_Container_1_FirstChild_0 and l_l_Container_1_FirstChild_0:FindFirstChild("Highlight");
                                                        if l_l_Container_1_FirstChild_0 and v1278 then
                                                            local v1279 = "rbxassetid://0";
                                                            local v1280 = v1217.ViewModels[v1276];
                                                            if v1280 and v1280.Image then
                                                                v1279 = v1280.Image;
                                                            else
                                                                warn("Billboard Inventory: No ViewModel Image found for", v1276);
                                                            end;
                                                            l_l_Container_1_FirstChild_0.Image = v1279;
                                                            l_l_Container_1_FirstChild_0.Visible = true;
                                                            v1278.Enabled = v1276 == v1260;
                                                        end;
                                                    end;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                        for v1281 = v1262 + 1, v1207 do
                                            local l_l_Container_1_FirstChild_1 = l_Container_1:FindFirstChild("Slot_" .. v1281);
                                            if l_l_Container_1_FirstChild_1 then
                                                l_l_Container_1_FirstChild_1.Visible = false;
                                                local l_Highlight_2 = l_l_Container_1_FirstChild_1:FindFirstChild("Highlight");
                                                if l_Highlight_2 then
                                                    l_Highlight_2.Enabled = false;
                                                end;
                                            end;
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            local v1286 = l_Players_9.PlayerRemoving:Connect(function(v1285) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v40 (ref), v1236 (ref)
                if not v40.InventoryViewer then
                    playerRemovingConnection:Disconnect();
                    return;
                else
                    if v1285.Character and v1236[v1285.Character] then
                        v1236[v1285.Character]:Destroy();
                        v1236[v1285.Character] = nil;
                    end;
                    return;
                end;
            end);
            getgenv().cleanupInventoryViewer = function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v1284 (ref), v1286 (ref), v1250 (ref)
                if v1284 and typeof(v1284) == "RBXScriptConnection" then
                    v1284:Disconnect();
                    v1284 = nil;
                end;
                if v1286 and typeof(v1286) == "RBXScriptConnection" then
                    v1286:Disconnect();
                    v1286 = nil;
                end;
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v1250 (ref)
                    v1250();
                end);
            end;
            print("Billboard Inventory Display initialized successfully.");
        end);
    end;
    return;
end;
