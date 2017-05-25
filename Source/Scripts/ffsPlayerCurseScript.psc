Scriptname ffsPlayerCurseScript  extends ReferenceAlias

Actor combatTarget = None

Message Property ffsCurseMessage  Auto  

SPELL Property ffsCurseofTesting  Auto  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1
		self.GetActorReference().GetActorBase().SetEssential(true)
        self.GetActorReference().Kill()
        ;self.GetActorReference().GetActorBase().SetEssential(false)
        combatTarget = akTarget
	EndIf
EndEvent

Event OnDying(Actor killer)
	debug.MessageBox("Dying")
	combatTarget = killer
EndEvent

Event OnDeath(Actor killer)
	debug.MessageBox("Death")
EndEvent

Event OnEnterBleedout()
	debug.MessageBox("Bleeding Out")
	if combatTarget == Game.GetPlayer()
		debug.MessageBox("Attacker was player")
		ffsCurseMessage.Show()
		ffsCurseofTesting.Cast(self.GetActorReference(), Game.GetPlayer())
	EndIf
EndEvent