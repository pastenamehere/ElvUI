local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

-- Flight Map 3.3.3 beta2
-- https://www.curseforge.com/wow/addons/flight-map/files/426246

local function LoadSkin()
	if not E.private.addOnSkins.FlightMap then return end

	FlightMapTimesFrame:StripTextures()
	FlightMapTimesFrame:CreateBackdrop("Default")

	FlightMapTimesFrame:SetStatusBarTexture(E.media.glossTex)
	E:RegisterStatusBar(FlightMapTimesFrame)

	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:Point("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)

	local base = "InterfaceOptionsFlightMapPanel"
	for optionID in pairs(FLIGHTMAP_OPTIONS) do
		S:HandleCheckBox(_G[base .. "Option" .. optionID])
	end
end

S:AddCallbackForAddon("FlightMap", "FlightMap", LoadSkin)