Scriptname ffsTestCurse extends activemagiceffect

SPELL Property ffsFearOfTheDarkSpell  Auto  

Bool effectFinished = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.MessageBox("I'm cursed")
	while !effectFinished
		if akTarget.GetLightLevel() <= 40
			debug.MessageBox("inthe dark")
			ffsFearOfTheDarkSpell.Cast(akTarget, akTarget)
		EndIf
	endWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.MessageBox("I'm healed")
EndEvent