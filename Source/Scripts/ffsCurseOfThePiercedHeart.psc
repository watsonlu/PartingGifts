Scriptname ffsCurseOfThePiercedHeart extends activemagiceffect

int CursePower = 10

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.MessageBox("I have pierced heart")
    RegisterForAnimationEvent(Game.GetPlayer(), "FootSprintRight") 
    RegisterForAnimationEvent(Game.GetPlayer(), "FootSprintLeft") 
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Actor player = Game.GetPlayer();
	player.DamageActorValue("Health", CursePower)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.MessageBox("I no longer have pierced heart")
EndEvent