Scriptname ffsPlayerCurseScript  extends ReferenceAlias

Actor combatTarget = None

Message Property ffsCurseMessage  Auto  

SPELL Property ffsCurseofTesting  Auto  

FormList Property ffsSelfCurses Auto
FormList Property ffsTargettedCurses Auto

int curseFormlistCount = 2
int listToUse = 0

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1
		self.GetActorReference().GetActorBase().SetEssential(true)
        self.GetActorReference().Kill()
        ; self.GetActorReference().GetActorBase().SetEssential(false)
        combatTarget = akTarget
	EndIf
EndEvent

Event OnDying(Actor killer)
	;debug.MessageBox("Dying")
	combatTarget = killer
EndEvent

Event OnDeath(Actor killer)
	;debug.MessageBox("Death")
EndEvent

Event OnEnterBleedout()
	; debug.MessageBox("Bleeding Out")
	if combatTarget == Game.GetPlayer()
		; debug.MessageBox("Attacker was player")
		FormList chosenList = ChooseCurse()
		Spell chosenCurse = PickACurse(chosenList)
		ffsCurseMessage.Show()
		chosenCurse.Cast(self.GetActorReference(), GetSpellTarget())
	EndIf
EndEvent

Spell Function PickACurse(FormList listOfCurses)
	int spellToUse = Utility.RandomInt(0, (listOfCurses.GetSize() - 1))
	return listOfCurses.GetAt(spellToUse) as Spell
EndFunction

Actor Function GetSpellTarget()
	if listToUse == 1
		return self.GetActorReference()
	EndIf
	return Game.GetPlayer()
EndFunction

FormList Function ChooseCurse() 
	listToUse = Utility.RandomInt(1, curseFormlistCount)
	FormList chosenList = None
	if listToUse == 1
		return ffsSelfCurses
	ElseIf listToUse == 2
		return ffsTargettedCurses
	EndIf
	return chosenList
EndFunction