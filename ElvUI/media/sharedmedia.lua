local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local LSM = E.Libs.LSM
local M = [[Interface\AddOns\ElvUI\Media\]]

function E:TextureString(texString, dataString)
	return "|T"..texString..(dataString or "").."|t"
end

E.Media = {
	Fonts = {
		ActionMan = M..[[Fonts\ActionMan.ttf]],
		ContinuumMedium = M..[[Fonts\ContinuumMedium.ttf]],
		DieDieDie = M..[[Fonts\DieDieDie.ttf]],
		Expressway = M..[[Fonts\Expressway.ttf]],
		Homespun = M..[[Fonts\Homespun.ttf]],
		Invisible = M..[[Fonts\Invisible.ttf]],
		PTSansNarrow = M..[[Fonts\PTSansNarrow.ttf]]
	},
	Sounds = {
		AwwCrap = M..[[Sounds\AwwCrap.ogg]],
		BbqAss = M..[[Sounds\BbqAss.ogg]],
		DumbShit = M..[[Sounds\DumbShit.ogg]],
		HarlemShake = M..[[Sounds\HarlemShake.ogg]],
		HelloKitty = M..[[Sounds\HelloKitty.ogg]],
		MamaWeekends = M..[[Sounds\MamaWeekends.ogg]],
		RunFast = M..[[Sounds\RunFast.ogg]],
		ElvUIAska = M..[[Sounds\SndIncMsg.ogg]],
		StopRunningSlimeBall = M..[[Sounds\StopRunningSlimeBall.ogg]],
		Warning = M..[[Sounds\Warning.ogg]],
		Whisper = M..[[Sounds\Whisper.ogg]],
		YankieBangBang = M..[[Sounds\YankieBangBang.ogg]]
	},
	ChatEmojis = {
		Angry = M..[[ChatEmojis\Angry.tga]],
		Blush = M..[[ChatEmojis\Blush.tga]],
		BrokenHeart = M..[[ChatEmojis\BrokenHeart.tga]],
		CallMe = M..[[ChatEmojis\CallMe.tga]],
		Cry = M..[[ChatEmojis\Cry.tga]],
		Facepalm = M..[[ChatEmojis\Facepalm.tga]],
		Grin = M..[[ChatEmojis\Grin.tga]],
		Heart = M..[[ChatEmojis\Heart.tga]],
		HeartEyes = M..[[ChatEmojis\HeartEyes.tga]],
		Joy = M..[[ChatEmojis\Joy.tga]],
		Kappa = M..[[ChatEmojis\Kappa.tga]],
		Meaw = M..[[ChatEmojis\Meaw.tga]],
		MiddleFinger = M..[[ChatEmojis\MiddleFinger.tga]],
		Murloc = M..[[ChatEmojis\Murloc.tga]],
		OkHand = M..[[ChatEmojis\OkHand.tga]],
		OpenMouth = M..[[ChatEmojis\OpenMouth.tga]],
		Poop = M..[[ChatEmojis\Poop.tga]],
		Rage = M..[[ChatEmojis\Rage.tga]],
		SadKitty = M..[[ChatEmojis\SadKitty.tga]],
		Scream = M..[[ChatEmojis\Scream.tga]],
		ScreamCat = M..[[ChatEmojis\ScreamCat.tga]],
		SemiColon = M..[[ChatEmojis\SemiColon.tga]],
		SlightFrown = M..[[ChatEmojis\SlightFrown.tga]],
		Smile = M..[[ChatEmojis\Smile.tga]],
		Smirk = M..[[ChatEmojis\Smirk.tga]],
		Sob = M..[[ChatEmojis\Sob.tga]],
		StuckOutTongue = M..[[ChatEmojis\StuckOutTongue.tga]],
		StuckOutTongueClosedEyes = M..[[ChatEmojis\StuckOutTongueClosedEyes.tga]],
		Sunglasses = M..[[ChatEmojis\Sunglasses.tga]],
		Thinking = M..[[ChatEmojis\Thinking.tga]],
		ThumbsUp = M..[[ChatEmojis\ThumbsUp.tga]],
		Wink = M..[[ChatEmojis\Wink.tga]],
		ZZZ = M..[[ChatEmojis\ZZZ.tga]],
		
		-- Twitch emotes
		FourHead = M..[[ChatEmojis\Twitch\4Head.tga]],
		ANELE = M..[[ChatEmojis\Twitch\ANELE.tga]],
		ArsonNoSexy = M..[[ChatEmojis\Twitch\ArsonNoSexy.tga]],
		BabyRage = M..[[ChatEmojis\Twitch\BabyRage.tga]],
		BCWarrior = M..[[ChatEmojis\Twitch\BCWarrior.tga]],
		BibleThump = M..[[ChatEmojis\Twitch\BibleThump.tga]],
		BloodTrail = M..[[ChatEmojis\Twitch\BloodTrail.tga]],
		cmonBruh = M..[[ChatEmojis\Twitch\cmonBruh.tga]],
		KAPOW = M..[[ChatEmojis\Twitch\KAPOW.tga]],
		KappaTwitch = M..[[ChatEmojis\Twitch\Kappa.tga]],
		KappaClaus = M..[[ChatEmojis\Twitch\KappaClaus.tga]],
		KappaPride = M..[[ChatEmojis\Twitch\KappaPride.tga]],
		KappaRoss = M..[[ChatEmojis\Twitch\KappaRoss.tga]],
		Keepo = M..[[ChatEmojis\Twitch\Keepo.tga]],
		Kippa = M..[[ChatEmojis\Twitch\Kippa.tga]],
		Klappa = M..[[ChatEmojis\Twitch\Klappa.tga]],
		Kreygasm = M..[[ChatEmojis\Twitch\Kreygasm.tga]],
		SeemsGood = M..[[ChatEmojis\Twitch\SeemsGood.tga]],
		WutFace = M..[[ChatEmojis\Twitch\WutFace.tga]],
		
		LUL = M..[[ChatEmojis\Twitch\LUL.tga]],
		BlessRNG = M..[[ChatEmojis\Twitch\BlessRNG.tga]],
		GlassesTwitch = M..[[ChatEmojis\Twitch\B.tga]],
		HeartTwitch = M..[[ChatEmojis\Twitch\3.tga]],
		CoolStoryBob = M..[[ChatEmojis\Twitch\CoolStoryBob.tga]],
		DarkMode = M..[[ChatEmojis\Twitch\DarkMode.tga]],
		HSWP = M..[[ChatEmojis\Twitch\HSWP.tga]],
		NotLikeThis = M..[[ChatEmojis\Twitch\NotLikeThis.tga]],
		PogChamp = M..[[ChatEmojis\Twitch\PogChamp.tga]],
		SMOrc = M..[[ChatEmojis\Twitch\SMOrc.tga]],
		SSSsss = M..[[ChatEmojis\Twitch\SSSsss.tga]],
		mcaT = M..[[ChatEmojis\Twitch\mcaT.tga]],
		KonCha = M..[[ChatEmojis\Twitch\KonCha.tga]],
		MrDestructoid = M..[[ChatEmojis\Twitch\MrDestructoid.tga]],
		PunOko = M..[[ChatEmojis\Twitch\PunOko.tga]],
		TheIllumonati = M..[[ChatEmojis\Twitch\TheIllumonati.tga]],
		duDudu = M..[[ChatEmojis\Twitch\duDudu.tga]],

		-- BTTV & FrankerFaceZ emotes
		TwoHead = M..[[ChatEmojis\BTTV\2Head.tga]],
		ThreeHead = M..[[ChatEmojis\BTTV\3Head.tga]],
		FiveHead = M..[[ChatEmojis\BTTV\5Head.tga]],
		AYAYA = M..[[ChatEmojis\BTTV\AYAYA.tga]],
		confusedCat = M..[[ChatEmojis\BTTV\confusedCat.tga]],
		whatdidusay = M..[[ChatEmojis\BTTV\D.tga]],
		EZ = M..[[ChatEmojis\BTTV\EZ.tga]],
		FeelsAmazingMan = M..[[ChatEmojis\BTTV\FeelsAmazingMan.tga]],
		FeelsBadMan = M..[[ChatEmojis\BTTV\FeelsBadMan.tga]],
		FeelsGoodMan = M..[[ChatEmojis\BTTV\FeelsGoodMan.tga]],
		FeelsOkayMan = M..[[ChatEmojis\BTTV\FeelsOkayMan.tga]],
		FeelsRageMan = M..[[ChatEmojis\BTTV\FeelsRageMan.tga]],
		GabeN = M..[[ChatEmojis\BTTV\GabeN.tga]],
		gachiGASM = M..[[ChatEmojis\BTTV\gachiGASM.tga]],
		HAhaa = M..[[ChatEmojis\BTTV\HAhaa.tga]],
		KKomrade = M..[[ChatEmojis\BTTV\KKomrade.tga]],
		monkaHmm = M..[[ChatEmojis\BTTV\monkaHmm.tga]],
		monkaOMEGA = M..[[ChatEmojis\BTTV\monkaOMEGA.tga]],
		monkaS = M..[[ChatEmojis\BTTV\monkaS.tga]],
		monkaW = M..[[ChatEmojis\BTTV\monkaW.tga]],
		OMEGALUL = M..[[ChatEmojis\BTTV\OMEGALUL.tga]],
		Patrick = M..[[ChatEmojis\BTTV\Patrick.tga]],
		PedoBear = M..[[ChatEmojis\BTTV\PedoBear.tga]],
		pepeClown = M..[[ChatEmojis\BTTV\pepeClown.tga]],
		Pepega = M..[[ChatEmojis\BTTV\Pepega.tga]],
		pepeHands = M..[[ChatEmojis\BTTV\pepeHands.tga]],
		pepeLaugh = M..[[ChatEmojis\BTTV\pepeLaugh.tga]],
		pepeSword = M..[[ChatEmojis\BTTV\pepeSword.tga]],
		Pog = M..[[ChatEmojis\BTTV\Pog.tga]],
		Pogey = M..[[ChatEmojis\BTTV\Pogey.tga]],
		POGGERS = M..[[ChatEmojis\BTTV\POGGERS.tga]],
		PogU = M..[[ChatEmojis\BTTV\PogU.tga]],
		PressF = M..[[ChatEmojis\BTTV\PressF.tga]],
		RIP = M..[[ChatEmojis\BTTV\RIP.tga]],
		sadCat = M..[[ChatEmojis\BTTV\sadCat.tga]],
		roflanEbalo = M..[[ChatEmojis\BTTV\roflanEbalo.tga]],
		TGGasm = M..[[ChatEmojis\BTTV\TGGasm.tga]],

		KEKW = M..[[ChatEmojis\BTTV\KEKW.tga]],
		KEKWait = M..[[ChatEmojis\BTTV\KEKWait.tga]]
	},
	ChatLogos = {
		ElvRainbow = M..[[ChatLogos\ElvRainbow.tga]],
		ElvMelon = M..[[ChatLogos\ElvMelon.tga]],
		ElvBlue = M..[[ChatLogos\ElvBlue.tga]],
		ElvGreen = M..[[ChatLogos\ElvGreen.tga]],
		ElvOrange = M..[[ChatLogos\ElvOrange.tga]],
		ElvPink = M..[[ChatLogos\ElvPink.tga]],
		ElvPurple = M..[[ChatLogos\ElvPurple.tga]],
		ElvYellow = M..[[ChatLogos\ElvYellow.tga]],
		ElvRed = M..[[ChatLogos\ElvRed.tga]],
		Bathrobe = M..[[ChatLogos\Bathrobe.tga]],
		HelloKitty = M..[[ChatLogos\HelloKitty.tga]],
		Illuminati = M..[[ChatLogos\Illuminati.tga]],
		MrHankey = M..[[ChatLogos\MrHankey.tga]],
		Rainbow = M..[[ChatLogos\Rainbow.tga]],
		TyroneBiggums = M..[[ChatLogos\TyroneBiggums.tga]]
	},
	Textures = {
		AllianceLogo = M..[[Textures\Alliance-Logo.blp]],
		Arrow = M..[[Textures\Arrow.tga]],
		ArrowRight = M..[[Textures\ArrowRight.tga]],
		ArrowUp = M..[[Textures\ArrowUp.tga]],
		BagJunkIcon = M..[[Textures\BagJunkIcon.blp]],
		BagQuestIcon = M..[[Textures\BagQuestIcon.tga]],
		Black8x8 = M..[[Textures\Black8x8.tga]],
		White8x8 = [[Interface\BUTTONS\WHITE8X8]], -- not elvui
		Broom = M..[[Textures\Broom.blp]],
		ChatEmojis = M..[[Textures\ChatEmojis]],
		ChatLogos = M..[[Textures\ChatLogos]],
		Close = M..[[Textures\Close.tga]],
		Combat = M..[[Textures\Combat.tga]],
		Copy = M..[[Textures\Copy.tga]],
		Cross = M..[[Textures\Cross.tga]],
		DPS = M..[[Textures\DPS.tga]],
		GlowTex = M..[[Textures\GlowTex.tga]],
		Healer = M..[[Textures\Healer.tga]],
		HelloKitty = M..[[Textures\HelloKitty.tga]],
		HelloKittyChat = M..[[Textures\HelloKittyChat.tga]],
		Highlight = M..[[Textures\Highlight.tga]],
		HordeLogo = M..[[Textures\Horde-Logo.blp]],
		Leader = M..[[Textures\Leader.tga]],
		LevelUpTex = M..[[Textures\LevelUpTex.blp]],
		Logo = M..[[Textures\Logo.tga]],
		Mail = M..[[Textures\Mail.tga]],
		Melli = M..[[Textures\Melli.tga]],
		Minimalist = M..[[Textures\Minimalist.tga]],
		Minus = M..[[Textures\Minus.tga]],
		MinusButton = M..[[Textures\MinusButton.tga]],
		Nameplates = M..[[Textures\Nameplates.blp]],
		NormTex = M..[[Textures\NormTex.tga]],
		NormTex2 = M..[[Textures\NormTex2.tga]],
		Pause = M..[[Textures\Pause.tga]],
		Play = M..[[Textures\Play.tga]],
		Plus = M..[[Textures\Plus.tga]],
		PlusButton = M..[[Textures\PlusButton.tga]],
		PvPIcons = M..[[Textures\PVP-Icons.blp]],
		RaidIcons = M..[[Textures\RaidIcons.blp]],
		Reset = M..[[Textures\Reset.tga]],
		Resting = M..[[Textures\Resting.tga]],
		Resting1 = M..[[Textures\Resting1.tga]],
		RoleIcons = M..[[Textures\RoleIcons.tga]],
		SkullIcon = M..[[Textures\SkullIcon.tga]],
		Smooth = M..[[Textures\Smooth.tga]],
		Spark = M..[[Textures\Spark.tga]],
		Tank = M..[[Textures\Tank.tga]],
		ExitVehicle = M..[[Textures\ExitVehicle.tga]]
	}
}

LSM:Register("border", "ElvUI GlowBorder", E.Media.Textures.GlowTex)
LSM:Register("font", "Continuum Medium", E.Media.Fonts.ContinuumMedium)
LSM:Register("font", "Die Die Die!", E.Media.Fonts.DieDieDie, LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register("font", "Action Man", E.Media.Fonts.ActionMan)
LSM:Register("font", "Expressway", E.Media.Fonts.Expressway, LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register("font", "PT Sans Narrow", E.Media.Fonts.PTSansNarrow, LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register("font", "Homespun", E.Media.Fonts.Homespun, LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register("sound", "ElvUI Aska", E.Media.Sounds.SndIncMsg)
LSM:Register("sound", "Awww Crap", E.Media.Sounds.AwwCrap)
LSM:Register("sound", "BBQ Ass", E.Media.Sounds.BbqAss)
LSM:Register("sound", "Big Yankie Devil", E.Media.Sounds.YankieBangBang)
LSM:Register("sound", "Dumb Shit", E.Media.Sounds.DumbShit)
LSM:Register("sound", "Mama Weekends", E.Media.Sounds.MamaWeekends)
LSM:Register("sound", "Runaway Fast", E.Media.Sounds.RunFast)
LSM:Register("sound", "Stop Running", E.Media.Sounds.StopRunningSlimeBall)
LSM:Register("sound", "Warning", E.Media.Sounds.Warning)
LSM:Register("sound", "Whisper Alert", E.Media.Sounds.Whisper)
LSM:Register("statusbar", "Melli", E.Media.Textures.Melli)
LSM:Register("statusbar", "ElvUI Gloss", E.Media.Textures.NormTex)
LSM:Register("statusbar", "ElvUI Norm", E.Media.Textures.NormTex2)
LSM:Register("statusbar", "Minimalist", E.Media.Textures.Minimalist)
LSM:Register("statusbar", "ElvUI Blank", E.Media.Textures.White8x8)
LSM:Register("background", "ElvUI Blank", E.Media.Textures.White8x8)