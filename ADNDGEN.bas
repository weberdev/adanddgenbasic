Rem This is an archival and expansion of some handwritten code I was shown.
Rem Most likely written between 1983 and 1985, but 1983 is the minimum year.
Rem It's an archival piece, at least in some ways.
Rem I expanded on some features, implementing functionality from D&D volumes of the era.
Rem This version omits Unearthed Arcana (1985), and such material will be included in a later fork.

101 Option Base 1
105 Randomize Timer

Type ClassDef
    ClassName As String * 30: ClassIndex As Integer
    HitDie As Integer: Category As String * 30
    MinStr As Integer: MinInt As Integer: MinWis As Integer
    MinDex As Integer: MinCon As Integer: MinCha As Integer
    Rem This next one is needed for one thing. Is it really needed?
    Rem Yes, as it turns out.
    MaxWis As Integer
    RaceDwarf As Integer: RaceElf As Integer: RaceGnome As Integer
    RaceHalfElf As Integer: RaceHalfling As Integer: RaceHalfOrc As Integer: RaceHuman As Integer
    GoldDieNum As Integer: GoldDieSize As Integer
    Rem these can be left empty
    IsMultiClass As Integer: SecondHD As Integer: ThirdHD As Integer
    Title As String
End Type

Type RaceDef
    RaceName As String * 20: RaceIndex As Integer
    MinStr As Integer: MaxStr As Integer: MinInt As Integer: MaxInt As Integer
    MinWis As Integer: MaxWis As Integer: MinDex As Integer: MaxDex As Integer
    MinCon As Integer: MaxCon As Integer: MinCha As Integer: MaxCha As Integer
End Type

Dim OffensiveSpells(9) As String
For I = 1 To 9
    Read OffensiveSpells(I)
Next I
Data "Burning Hands","Charm Person","Enlarge","Friends","Light","Magic Missile","Push","Shocking Grasp","Sleep"
Dim DefensiveSpells(9) As String
For I = 1 To 9
    Read DefensiveSpells(I)
Next I
Data "Affect Normal Fires","Dancing Lights","Feather Fall","Hold Portal","Jump","Protection From Evil","Shield","Spider Climb","Ventriloquism"
Dim MiscSpells(9) As String
For I = 1 To 9
    Read MiscSpells(I)
Next I
Data "Comprehend Languages","Detect Magic","Erase","Find Familiar","Identify","Mending","Message","Unseen Servant","Write"


Dim IllusL1Spells(12) As String
For I = 1 To 12
    Read IllusL1Spells(I)
Next I
Rem List of Level 1 Illusionist spells [1. pp.94-95]
Data "Audible Glamer","Change Self","Color Spray","Dancing Lights","Darkness","Detect Illusion","Detect Invisibility","Gaze Reflection","Hypnotism","Light","Phantasmal Force","Wall of Fog"


Dim MinorDiscipline(22) As String
For I = 1 To 22
    Read MinorDiscipline(I)
Next I
Rem 3: reroll if magic-user
Data "Animal Telepathy","Body Equilibrium","Body Weaponry","Cell Adjustment","Clairaudience","Clairvoyance"
Rem 9: no thieves. 10: no Fighters. 12: no clerics.
Rem Why? no idea. Gygax says so..
Data "Detection of Good or Evil","Detection of Magic","Domination","Empathy","ESP","Expansion"
Rem 18: No Thieves
Data "Hypnosis","Invisibility","Levitation","Mind Over Body","Molecular Agitation","Object Reading"
Rem 20: No clerics.
Data "Precognition","Reduction","Sensitivity to Psychic Impressions","Suspend Animation"


Dim Classes(11) As ClassDef

Classes(1).ClassName = "Fighter": Classes(1).ClassIndex = 1: Classes(1).HitDie = 10
Classes(1).Category = "Fighter"
Classes(1).MinStr = 9: Classes(1).MinInt = 0: Classes(1).MinWis = 0
Classes(1).MinDex = 0: Classes(1).MinCon = 7: Classes(1).MinCha = 0
Rem Futureproofing for UA barbarian. My honest reaction: >:(
Classes(1).MaxWis = 18
Classes(1).RaceDwarf = 1: Classes(1).RaceElf = 1: Classes(1).RaceGnome = 1
Classes(1).RaceHalfElf = 1: Classes(1).RaceHalfling = 1
Classes(1).RaceHalfOrc = 1: Classes(1).RaceHuman = 1
Classes(1).GoldDieNum = 5: Classes(1).GoldDieSize = 4
Classes(1).Title = "Veteran"

Classes(2).ClassName = "Paladin": Classes(2).ClassIndex = 2: Classes(2).HitDie = 10
Classes(2).Category = "Fighter"
Classes(2).MinStr = 12: Classes(2).MinInt = 9: Classes(2).MinWis = 13
Classes(2).MinDex = 0: Classes(2).MinCon = 9: Classes(2).MinCha = 17
Classes(2).MaxWis = 18
Classes(2).RaceHuman = 1
Classes(2).GoldDieNum = 5: Classes(2).GoldDieSize = 4
Classes(2).Title = "Gallant"

Classes(3).ClassName = "Ranger": Classes(3).ClassIndex = 3: Classes(3).HitDie = 16
Classes(3).Category = "Fighter"
Classes(3).MinStr = 13: Classes(3).MinInt = 13: Classes(3).MinWis = 14: Classes(3).MinCon = 14
Classes(3).MaxWis = 18
Rem Elves can't be rangers for some reason.
Rem Rangers don't have to be dextrous for some reason.
Classes(3).RaceHalfElf = 1: Classes(3).RaceHuman = 1
Classes(3).GoldDieNum = 5: Classes(3).GoldDieSize = 4
Classes(3).Title = "Runner"


Classes(4).ClassName = "Cavalier": Classes(4).ClassIndex = 4: Classes(4).HitDie = 10
Classes(4).Category = "Fighter"
Classes(4).MinStr = 15: Classes(4).MinInt = 10: Classes(4).MinWis = 10
Classes(4).MinDex = 15: Classes(4).MinCon = 15: Classes(4).MaxWis = 18
Rem per Dragon Magazine 72 [5], Cavaliers can be human, elven and half-elven
Rem this will change with Unearthed Arcana
Classes(4).RaceElf = 1: Classes(4).RaceHalfElf = 1: Classes(4).RaceHuman = 1
Classes(4).GoldDieNum = 5: Classes(4).GoldDieSize = 4
Classes(4).Title = "Probably cutting this"

Classes(5).ClassName = "Magic-User": Classes(5).ClassIndex = 5: Classes(5).HitDie = 4
Classes(5).Category = "Magic-User"
Classes(5).MinInt = 9: Classes(5).MinDex = 6: Classes(5).MaxWis = 18
Classes(5).RaceElf = 1: Classes(5).RaceHalfElf = 1: Classes(5).RaceHuman = 1
Classes(5).GoldDieNum = 2: Classes(5).GoldDieSize = 4
Classes(5).Title = "Prestidigitator"

Classes(6).ClassName = "Illusionist": Classes(6).ClassIndex = 6: Classes(6).HitDie = 4
Classes(6).Category = "Magic-User"
Classes(6).MinInt = 15: Classes(6).MinDex = 16: Classes(6).MaxWis = 18
Classes(6).RaceGnome = 1: Classes(6).RaceHuman = 1
Classes(6).GoldDieNum = 2: Classes(6).GoldDieSize = 4
Rem Not an error, l1 wizards and illusionists have the same title.
Classes(6).Title = "Prestidigitator"


Classes(7).ClassName = "Cleric": Classes(7).ClassIndex = 7: Classes(7).HitDie = 8
Classes(7).Category = "Cleric"
Classes(7).MinWis = 9: Classes(7).MaxWis = 18
Classes(7).RaceDwarf = 1: Classes(7).RaceElf = 1: Classes(7).RaceGnome = 1
Classes(7).RaceHalfElf = 1: Classes(7).RaceHalfOrc = 1: Classes(7).RaceHuman = 1
Classes(7).GoldDieNum = 3: Classes(7).GoldDieSize = 6
Classes(7).Title = "Acolyte"

Classes(8).ClassName = "Druid": Classes(8).ClassIndex = 8: Classes(8).HitDie = 8
Classes(8).Category = "Cleric"
Classes(8).MinWis = 12: Classes(8).MinCha = 15: Classes(8).MaxWis = 18
Rem the restriction on elves and nature classes comes from Moorcock and Poul Anderson. Elves are not-nearly as Tolkeinian in early D&D.
Classes(8).RaceHalfElf = 1: Classes(8).RaceHalfling = 1: Classes(8).RaceHuman = 1
Classes(8).GoldDieNum = 3: Classes(8).GoldDieSize = 6
Classes(8).Title = "Aspirant"

Classes(9).ClassName = "Thief": Classes(9).ClassIndex = 9: Classes(9).HitDie = 6
Classes(9).Category = "Thief"
Classes(9).MinDex = 9: Classes(9).MaxWis = 18
Rem everyone can steal
Classes(9).RaceDwarf = 1: Classes(9).RaceElf = 1: Classes(9).RaceGnome = 1
Classes(9).RaceHalfElf = 1: Classes(9).RaceHalfling = 1: Classes(9).RaceHalfOrc = 1
Classes(9).RaceHuman = 1
Classes(9).GoldDieNum = 2: Classes(9).GoldDieSize = 6
Classes(9).Title = "Rogue (Apprentice)"

Classes(10).ClassName = "Assassin": Classes(10).ClassIndex = 10: Classes(10).HitDie = 6
Classes(10).Category = "Thief"
Classes(10).MinInt = 11: Classes(10).MinDex = 12: Classes(10).MaxWis = 18
Classes(10).RaceDwarf = 1: Classes(10).RaceElf = 1: Classes(10).RaceGnome = 1
Classes(10).RaceHalfElf = 1: Classes(10).RaceHalfOrc = 1: Classes(10).RaceHuman = 1
Classes(10).GoldDieNum = 2: Classes(10).GoldDieSize = 6
Classes(10).Title = "Bravo (Apprentice)"

Classes(11).ClassName = "Monk": Classes(11).ClassIndex = 11: Classes(11).HitDie = 4
Classes(11).Category = "Monk"
Classes(11).MinStr = 15: Classes(11).MinWis = 15: Classes(11).MinDex = 15: Classes(11).MinCon = 11
Classes(11).MaxWis = 18
Classes(11).RaceHuman = 1
Classes(11).GoldDieNum = 5: Classes(11).GoldDieSize = 4
Classes(11).Title = "Novice"

Rem In which we define the multi-class combinations from the PHB SECTION "The-Multi-Classed Character" [1, pp. 32-33]
Rem arguments exist about whether or not it's a section or table: it is a section.
Dim MultiClasses(13) As ClassDef

MultiClasses(1).ClassName = "Cleric/Fighter": MultiClasses(1).ClassIndex = (12): MultiClasses(1).HitDie = 10: MultiClasses(1).SecondHD = 8
MultiClasses(1).Category = "Cleric/Fighter"
MultiClasses(1).MinStr = 9: MultiClasses(1).MinCon = 7: MultiClasses(1).MinWis = 9: MultiClasses(1).MaxWis = 18
MultiClasses(1).RaceHalfElf = 1: MultiClasses(1).RaceHalfOrc = 1
MultiClasses(1).GoldDieNum = 5: MultiClasses(1).GoldDieSize = 4

MultiClasses(2).ClassName = "Cleric/Fighter/Magic-User": MultiClasses(2).ClassIndex = (13): MultiClasses(2).HitDie = 10: MultiClasses(2).SecondHD = 8: MultiClasses(2).ThirdHD = 4
MultiClasses(2).Category = "Cleric/Fighter/Magic-User"
MultiClasses(2).MinStr = 9: MultiClasses(2).MinCon = 7: MultiClasses(2).MinWis = 9: MultiClasses(2).MaxWis = 18
MultiClasses(2).RaceHalfElf = 1
MultiClasses(2).GoldDieNum = 5: MultiClasses(2).GoldDieSize = 4

MultiClasses(3).ClassName = "Cleric/Ranger": MultiClasses(3).ClassIndex = 14: MultiClasses(3).HitDie = 8: MultiClasses(3).SecondHD = 8
MultiClasses(3).Category = "Cleric/Fighter"
MultiClasses(3).MinStr = 13: MultiClasses(3).MinInt = 13: MultiClasses(3).MinWis = 14: MultiClasses(3).MinCon = 14: MultiClasses(3).MaxWis = 18
MultiClasses(3).RaceHalfElf = 1
MultiClasses(3).GoldDieNum = 5: MultiClasses(3).GoldDieSize = 4

MultiClasses(4).ClassName = "Cleric/Magic-User": MultiClasses(4).ClassIndex = 15: MultiClasses(4).HitDie = 8: MultiClasses(4).SecondHD = 4
MultiClasses(4).Category = "Cleric/Magic-User"
MultiClasses(4).MinWis = 9: MultiClasses(4).MinInt = 9: MultiClasses(4).MaxWis = 18
MultiClasses(4).RaceHalfElf = 1
MultiClasses(4).GoldDieNum = 3: MultiClasses(4).GoldDieSize = 5

MultiClasses(5).ClassName = "Cleric/Thief": MultiClasses(5).ClassIndex = 16: MultiClasses(5).HitDie = 8: MultiClasses(5).SecondHD = 6
MultiClasses(5).Category = "Cleric/Thief"
MultiClasses(5).MinWis = 9: MultiClasses(5).MinDex = 9: MultiClasses(5).MaxWis = 18
MultiClasses(5).RaceHalfElf = 1: MultiClasses(5).RaceHalfOrc = 1
MultiClasses(5).GoldDieNum = 3: MultiClasses(5).GoldDieSize = 5

MultiClasses(6).ClassName = "Cleric/Assassin": MultiClasses(6).ClassIndex = 17: MultiClasses(6).HitDie = 8: MultiClasses(6).SecondHD = 6
MultiClasses(6).Category = "Cleric/Thief"
MultiClasses(6).MinWis = 9: MultiClasses(6).MinDex = 13: MultiClasses(6).MinInt = 11: MultiClasses(6).MaxWis = 18
MultiClasses(6).RaceHalfOrc = 1
MultiClasses(6).GoldDieNum = 3: MultiClasses(6).GoldDieSize = 5

MultiClasses(7).ClassName = "Fighter/Magic-User": MultiClasses(7).ClassIndex = 18: MultiClasses(7).HitDie = 10: MultiClasses(7).SecondHD = 4
MultiClasses(7).Category = "Fighter/Magic-User"
MultiClasses(7).MinStr = 9: MultiClasses(7).MinCon = 7: MultiClasses(7).MinInt = 9: MultiClasses(7).MaxWis = 18
MultiClasses(7).RaceElf = 1: MultiClasses(7).RaceHalfElf = 1
MultiClasses(7).GoldDieNum = 4: MultiClasses(7).GoldDieSize = 4

MultiClasses(8).ClassName = "Fighter/Illusionist": MultiClasses(8).ClassIndex = 19: MultiClasses(8).HitDie = 10: MultiClasses(8).SecondHD = 4
MultiClasses(8).Category = "Fighter/Magic-User"
MultiClasses(8).MinStr = 9: MultiClasses(8).MinCon = 7: MultiClasses(8).MinDex = 16: MultiClasses(8).MinInt = 15: MultiClasses(8).MaxWis = 18
MultiClasses(8).RaceGnome = 1
MultiClasses(8).GoldDieNum = 4: MultiClasses(8).GoldDieSize = 4

MultiClasses(9).ClassName = "Fighter/Thief": MultiClasses(9).ClassIndex = 20: MultiClasses(9).HitDie = 10: MultiClasses(9).SecondHD = 6
MultiClasses(9).Category = "Fighter/Thief"
MultiClasses(9).MinStr = 9: MultiClasses(9).MinCon = 7: MultiClasses(9).MinDex = 9: MultiClasses(9).MaxWis = 18
MultiClasses(9).RaceDwarf = 1: MultiClasses(9).RaceElf = 1: MultiClasses(9).RaceGnome = 1
MultiClasses(9).RaceHalfElf = 1: MultiClasses(9).RaceHalfling = 1: MultiClasses(9).RaceHalfOrc = 1
MultiClasses(9).GoldDieNum = 4: MultiClasses(9).GoldDieSize = 4

MultiClasses(10).ClassName = "Fighter/Assassin": MultiClasses(10).ClassIndex = 21: MultiClasses(10).HitDie = 10: MultiClasses(10).SecondHD = 6
MultiClasses(10).Category = "Fighter/Thief"
MultiClasses(10).MinStr = 9: MultiClasses(10).MinCon = 7: MultiClasses(10).MinDex = 13: MultiClasses(10).MinInt = 11: MultiClasses(10).MaxWis = 18
MultiClasses(10).RaceHalfOrc = 1
MultiClasses(10).GoldDieNum = 4: MultiClasses(10).GoldDieSize = 4

MultiClasses(11).ClassName = "Fighter/Magic-User/Thief": MultiClasses(11).ClassIndex = 22: MultiClasses(11).HitDie = 10: MultiClasses(11).SecondHD = 4: MultiClasses(11).ThirdHD = 6
MultiClasses(11).Category = "Fighter/Magic-User/Thief"
MultiClasses(11).MinStr = 9: MultiClasses(11).MinCon = 7: MultiClasses(11).MinInt = 9: MultiClasses(11).MinDex = 9: MultiClasses(11).MaxWis = 18
MultiClasses(11).RaceElf = 1: MultiClasses(11).RaceHalfElf = 1
MultiClasses(11).GoldDieNum = 4: MultiClasses(11).GoldDieSize = 4

MultiClasses(12).ClassName = "Magic-User/Thief": MultiClasses(12).ClassIndex = 23: MultiClasses(12).HitDie = 4: MultiClasses(12).SecondHD = 6
MultiClasses(12).Category = "Magic-User/Thief"
MultiClasses(12).MinInt = 9: MultiClasses(12).MinDex = 9: MultiClasses(12).MaxWis = 18
MultiClasses(12).RaceElf = 1: MultiClasses(12).RaceHalfElf = 1
MultiClasses(12).GoldDieNum = 3: MultiClasses(12).GoldDieSize = 4

MultiClasses(13).ClassName = "Illusionist/Thief": MultiClasses(13).ClassIndex = 24: MultiClasses(13).HitDie = 4: MultiClasses(13).SecondHD = 6
MultiClasses(13).Category = "Magic-User/Thief"
MultiClasses(13).MinInt = 15: MultiClasses(13).MinDex = 16: MultiClasses(13).MaxWis = 18
MultiClasses(13).RaceGnome = 1
MultiClasses(13).GoldDieNum = 3: MultiClasses(13).GoldDieSize = 4




Dim Races(7) As RaceDef

Races(1).RaceName = "Dwarf"
Races(1).RaceIndex = 1
Races(1).MinStr = 8: Races(1).MaxStr = 18: Races(1).MinInt = 3: Races(1).MaxInt = 18
Races(1).MinWis = 3: Races(1).MaxWis = 18: Races(1).MinDex = 3: Races(1).MaxDex = 17
Races(1).MinCon = 12: Races(1).MaxCon = 18: Races(1).MinCha = 3: Races(1).MaxCha = 16

Races(2).RaceName = "Elf"
Races(2).RaceIndex = 2
Races(2).MinStr = 3: Races(2).MaxStr = 18: Races(2).MinInt = 8: Races(2).MaxInt = 18
Races(2).MinWis = 3: Races(2).MaxWis = 18: Races(2).MinDex = 7: Races(2).MaxDex = 18
Races(2).MinCon = 6: Races(2).MaxCon = 18: Races(2).MinCha = 8: Races(2).MaxCha = 18

Races(3).RaceName = "Gnome"
Races(3).RaceIndex = 3
Races(3).MinStr = 6: Races(3).MaxStr = 18: Races(3).MinInt = 7: Races(3).MaxInt = 18
Races(3).MinWis = 3: Races(3).MaxWis = 18: Races(3).MinDex = 3: Races(3).MaxDex = 18
Races(3).MinCon = 8: Races(3).MaxCon = 18: Races(3).MinCha = 3: Races(3).MaxCha = 18

Races(4).RaceName = "Half-Elf"
Races(4).RaceIndex = 4
Races(4).MinStr = 3: Races(4).MaxStr = 18: Races(4).MinInt = 4: Races(4).MaxInt = 18
Races(4).MinWis = 3: Races(4).MaxWis = 18: Races(4).MinDex = 6: Races(4).MaxDex = 18
Races(4).MinCon = 6: Races(4).MaxCon = 18: Races(4).MinCha = 3: Races(4).MaxCha = 18

Races(5).RaceName = "Halfling"
Races(5).RaceIndex = 5
Races(5).MinStr = 6: Races(5).MaxStr = 17: Races(5).MinInt = 6: Races(5).MaxInt = 18
Races(5).MinWis = 3: Races(5).MaxWis = 17: Races(5).MinDex = 8: Races(5).MaxDex = 18
Races(5).MinCon = 10: Races(5).MaxCon = 18: Races(5).MinCha = 3: Races(5).MaxCha = 18

Races(6).RaceName = "Half-Orc"
Races(6).RaceIndex = 6
Races(6).MinStr = 6: Races(6).MaxStr = 18: Races(6).MinInt = 3: Races(6).MaxInt = 17
Races(6).MinWis = 3: Races(6).MaxWis = 14: Races(6).MinDex = 3: Races(6).MaxDex = 17
Races(6).MinCon = 13: Races(6).MaxCon = 18: Races(6).MinCha = 3: Races(6).MaxCha = 12

Races(7).RaceName = "Human"
Races(7).RaceIndex = 7
Races(7).MinStr = 3: Races(7).MaxStr = 18: Races(7).MinInt = 3: Races(7).MaxInt = 18
Races(7).MinWis = 3: Races(7).MaxWis = 18: Races(7).MinDex = 3: Races(7).MaxDex = 18
Races(7).MinCon = 3: Races(7).MaxCon = 18: Races(7).MinCha = 3: Races(7).MaxCha = 18



Rem Making a secondary system to assign ability scores.
110 Dim Abilities(6) As Integer
120 GenerateSortedStats Abilities()
130 For I = 1 To 6
    131 Print Str$(I) + "." + Str$(Abilities(I)) + "  ";
132 Next I
140 Print " "
150 Dim AbilityAssignedArray(6) As Integer
151 Dim UsedAbilityArray(6) As Integer
152 Dim AbilityNames(6) As String
AbilityNames(1) = "Strength": AbilityNames(2) = "Intelligence": AbilityNames(3) = "Wisdom"
AbilityNames(4) = "Dexterity": AbilityNames(5) = "Constitution": AbilityNames(6) = "Charisma"

160 For I = 1 To 6
    Print "You rolled a "; Abilities(I)
    If Abilities(I) > 18 Then Print "Something is WRONG. This should not exceed 18.": Abilities(I) = 18
    If Abilities(I) < 3 Then Print "Something is WRONG. This should not be less than 3.": Abilities(I) = 3
    Print "Assign this score to one of the following unassigned stats:"

    Rem Show unassigned abilities
    For J = 1 To 6
        If UsedAbilityArray(J) = 0 Then Print J; ". "; AbilityNames(J)
    Next J

    Input "Enter the number of the stat to assign this to: ", choice

    While choice < 1 Or choice > 6 Or UsedAbilityArray(choice) = 1
        Print "Invalid choice. Try again."
        Input "Enter the number of the stat to assign this to: ", choice
    Wend

    AbilityAssignedArray(choice) = Abilities(I)
    UsedAbilityArray(choice) = 1
Next I

170 Print
171 Print "Final Assigned Stats:"
172 For I = 1 To 6
    Print AbilityNames(I); ": "; AbilityAssignedArray(I)
Next I

180 Input "Are these ability scores okay? Enter y if yes, anything else if no.", response$
181 If LCase$(response$) <> "y" Then
    For I = 1 To 6
        UsedAbilityArray(I) = 0
    Next I
    GoTo 150
End If
Dim AvailRaces(7) As RaceDef
For I = 1 To UBound(Races)
    If (AbilityAssignedArray(1) >= Races(I).MinStr) And (AbilityAssignedArray(2) >= Races(I).MinInt) And (AbilityAssignedArray(3) >= Races(I).MinWis) And (AbilityAssignedArray(4) >= Races(I).MinDex) And (AbilityAssignedArray(5) >= Races(I).MinCon) And (AbilityAssignedArray(6) >= Races(I).MinCha) Then AvailRaces(I) = Races(I)
Next I


190 Print
Do
    Print "Available Races:"
    For I = 1 To UBound(Races)
        Print I; ". "; Races(I).RaceName;
        If AvailRaces(I).RaceIndex = 0 Then
            Print " (Not Eligible)"
        Else
            Print
        End If
    Next I

    Input "Enter the number of your chosen race: ", RA
    If RA >= 1 And RA <= UBound(Races) Then
        If AvailRaces(RA).RaceIndex <> 0 Then
            Exit Do
        Else
            Print "That race is not eligible based on your ability scores. Choose again."
        End If
    Else
        Print "Invalid input. Please enter a number from 1 to "; UBound(Races)
    End If
Loop
Dim ChosenRace As RaceDef
Select Case RA

    Case 1

        Print "YOU HAVE CHOSEN TO BE A DWARF"
        Rem Dwarves get +1 CON, -1 CHA
        AbilityAssignedArray(5) = AbilityAssignedArray(5) + 1
        AbilityAssignedArray(6) = AbilityAssignedArray(6) - 1

        Rem Dwarves have MAX DEX 17, MAX CHA 16, MIN CHA (as it's reduced) 3
        If AbilityAssignedArray(4) > 17 Then AbilityAssignedArray(4) = 17: Print "MAXIMUM DWARF DEXTERITY IS 17"
        If AbilityAssignedArray(6) < 3 Then AbilityAssignedArray(6) = 3
        If AbilityAssignedArray(6) > 16 Then AbilityAssignedArray(6) = 16: Print "MAXIMUM DWARF CHARISMA IS 16"
    Case 2
        Print "YOU HAVE CHOSEN TO BE AN ELF"
        Rem Elves Have Min INT 8, DEX 7, CON 6, and CHA 8
        Rem Elves Get +1 Dex, -1 Con
        AbilityAssignedArray(4) = AbilityAssignedArray(4) + 1
        AbilityAssignedArray(5) = AbilityAssignedArray(5) - 1

        Rem Elves have No maximum stats that are salient at this point
        Rem Con might've caught a stray penalty, however.
        If AbilityAssignedArray(5) < 6 Then AbilityAssignedArray(5) = 6
    Case 3 Rem Gnomes have Min STR 6, INT 7, Con 8
        Print "YOU HAVE CHOSEN TO BE A GNOME"
        Rem Gnomes get gno ability score modifiers.
        Rem Gnor do they have caps
    Case 4
        Print "YOU HAVE CHOSEN TO BE A HALF-ELF"
        Rem Half-elves have Min 4 INT, 6 Dex, 6 CON

        Rem Half Elves have no ability score modifiers, nor salient ability score caps
    Case 5
        Rem Halflings have Min 6 str, 6 int, 8 dex, 10 con
        Print "YOU HAVE CHOSEN TO BE A HALFLING"

        Rem Halflings Get +1 Dex, -1 str
        AbilityAssignedArray(1) = AbilityAssignedArray(1) - 1
        AbilityAssignedArray(4) = AbilityAssignedArray(4) + 1

        Rem Halflings have max str 17, max wis 17
        If AbilityAssignedArray(1) > 17 Then AbilityAssignedArray(1) = 17: Print "MAXIMUM HALFLING STRENGTH IS 17"
        If AbilityAssignedArray(3) > 17 Then AbilityAssignedArray(3) = 17: Print "MAXIMUM HALFLING WISDOM IS 17"

        Rem Halflings have min str 6
        If AbilityAssignedArray(1) < 6 Then AbilityAssignedArray(1) = 6
    Case 6
        Print "YOU HAVE CHOSEN TO BE A HALF-ORC"
        Rem Half-orcs have min 6 str, min 13 con
        Rem Half-orcs get +1 STR, +1 CON, -2 CHA
        AbilityAssignedArray(1) = AbilityAssignedArray(1) + 1
        AbilityAssignedArray(5) = AbilityAssignedArray(5) + 1
        AbilityAssignedArray(6) = AbilityAssignedArray(6) - 2

        Rem Half Orcs have max 17 int, 14 wis 17 dex, 12 cha
        If AbilityAssignedArray(2) > 17 Then AbilityAssignedArray(2) = 17: Print "MAXIMUM HALF-ORC INTELLIGENCE IS 17"
        If AbilityAssignedArray(3) > 14 Then AbilityAssignedArray(3) = 14: Print "MAXIMUM HALF-ORC WISDOM IS 14"
        If AbilityAssignedArray(4) > 17 Then AbilityAssignedArray(4) = 17: Print "MAXIMUM HALF-ORC DEXTERITY IS 17"
        If AbilityAssignedArray(6) > 12 Then AbilityAssignedArray(6) = 12: Print "MAXIMUM HALF-ORC CHARISMA IS 12"

        Rem Half-orcs have min 3 CHA, and that's salient with the penalty
        If AbilityAssignedArray(6) < 3 Then AbilityAssignedArray(6) = 3
    Case 7
        Print "YOU ARE A HUMAN"
End Select
ChosenRace = Races(RA)
Rem This is for percentile strength, something that dtwentials and 5e zoomers missed.
Rem It's not, honestly, a great mechanic.
999 PER = 0

Rem ST = strength score
Rem PER = percentile value on 18 str
Rem SF = Hit probability
Rem SFF = Bend Bars/Lift Gates percentage
Rem DA = Damage Adjustment
Rem OD = Open sealed doors on 1d6
Rem OW = Open wizard locked doors on 1d6
1000 StrengthScore = AbilityAssignedArray(1)
1001 If StrengthScore = 18 Then PER = Int((Rnd(1) * 100) + 1)
1002 DA = 0
1003 OD = 1
1004 OW = 0
1005 SF = 0



Rem  Strength Table II.: Ability Adjustments from Player's Handbook [1, p. 9]
Select Case StrengthScore
    Case 3
        SF = -3: SFF = 0: DA = -1
    Case 4 To 5
        SF = -2: SFF = 0: DA = -1
    Case 6 To 7
        SF = -1: SFF = 0: DA = 0
    Case 8 To 9
        OD = 2: SFF = 1
    Case 10 To 11
        OD = 2: SFF = 2
    Case 12 To 13
        OD = 2: SFF = 4
    Case 14 To 15
        OD = 2: SFF = 7
    Case 16
        SF = 1: SFF = 10: DA = 1
    Case 17
        SF = 1: SFF = 13: DA = 1
    Case 18
        Select Case PER
            Case 1 To 50
                SF = 1: DA = 3: OD = 3: SFF = 20
            Case 51 To 75
                SF = 2: DA = 3: OD = 4: SFF = 25
            Case 76 To 90
                SF = 2: DA = 4: OD = 4: SFF = 30
            Case 91 To 99
                SF = 2: DA = 5: OD = 4: OW = 1: SFF = 35
            Case 100
                SF = 3: DA = 6: OD = 5: OW = 2: SFF = 40
            Case Else
                SF = 1: DA = 2: OD = 3: SFF = 16
        End Select
    Case Else
        SF = 0: SFF = 0: DA = 0
End Select


1091 If StrengthScore < 18 Then Print "CHARACTER'S STRENGTH IS "; StrengthScore
1092 If StrengthScore = 18 Then Print "CHARACTER'S STRENGTH IS 18, WITH "; PER; "% EXCEPTIONAL STRENGTH IF A FIGHTER"


1110 SH$ = "ADD " + LTrim$(Str$(SF)) + " TO ROLLS TO HIT ROLLS, " + LTrim$(Str$(DA)) + " TO DAMAGE ROLLS"
1120 SO$ = "AND " + LTrim$(Str$(SFF)) + "% TO BEND BARS OR LIFT GATES. SEALED DOORS CAN BE OPENED ON A " + LTrim$(Str$(OD)) + " OR LESS ON 1D6"
1121 If OW > 0 Then WL$ = "WIZARD LOCKED DOORS CAN BE OPENED ON A " + LTrim$(Str$(OW)) + " OR LESS ON 1D6. ONE TRY."

1140 IntelligenceScore = AbilityAssignedArray(2)
1141 Print "CHARACTER'S INTELLIGENCE IS "; IntelligenceScore
Rem  Intelligence Table II. from Player's Handbook [1, p. 10]
SpCh = 0
MnSp = 0
MxSp = 0
Select Case IntelligenceScore
    Case 1 To 8
        SP$ = "INTELLIGENCE TOO LOW FOR MAGIC USER"
    Case 9
        SP$ = "35% to KNOW SPELL -- MIN/MAX PER LVL 4/6": SpCh = 35: MnSp = 4: MxSp = 6
    Case 10 To 12
        SP$ = "45% TO KNOW SPELL -- MIN/MAX PER LVL 5/7": SpCh = 45: MnSp = 5: MxSp = 7
    Case 13 To 14
        SP$ = "55% TO KNOW SPELL -- MIN/MAX PER LEVEL 6/9": SpCh = 55: MnSp = 6: MxSp = 9
    Case 15 To 16
        SP$ = "65% TO KNOW SPELL -- MIN/MAX PER LEVEL 7/11": SpCh = 65: MnSp = 7: MxSp = 11
    Case 17
        SP$ = "75% TO KNOW SPELL -- MIN/MAX PER LVL 8/14": SpCh = 75: MnSp = 8: MxSp = 14
    Case 18
        SP$ = "85% TO KNOW SPELL -- MIN/MAX PER LVL 9/18": SpCh = 85: MnSp = 9: MxSp = 18
    Case Else
        SP$ = "95% TO KNOW SPELL -- MIN/MAX PER LVL 9/18": SpCh = 95: MnSp = 10: MxSp = 100

End Select
Dim bonusLangCount As Integer
Rem Languages Column of INTELLIGENCE TABLE I. [1, p.10]
Select Case IntelligenceScore
    Case 8 To 9
        bonusLangCount = 1
    Case 10 To 11
        bonusLangCount = 2
    Case 12 To 13
        bonusLangCount = 3
    Case 14 To 15
        bonusLangCount = 4
    Case 16
        bonusLangCount = 5
    Case 17
        bonusLangCount = 6
    Case 18
        bonusLangCount = 7
End Select

Rem I'm not sure which version of the chart this is.
Rem It was included in the originaal manuscript.
Select Case IntelligenceScore
    Case 3
        lang$ = "DIFFICULT SPEECH - ILLITERATE"
    Case 4 To 5
        lang$ = "EASY SPEECH BUT ILLITERATE"
    Case 6 To 8
        lang$ = "BARELY LITERATE"
    Case 9 To 12
        lang$ = "LITERATE IN NATIVE TONGUE"
    Case 13 To 15
        lang$ = "LITERATE AND FLUENT IN TWO LANGUAGES"
    Case 16 To 17
        lang$ = "LITERATE AND FLUENT IN THREE LANGUAGES"
    Case 18
        lang$ = "LITERATE AND FLUENT IN FOUR LANGUAGES"
End Select

1450 WisdomScore = AbilityAssignedArray(3)

Rem WISDOM TABLE I. from PHB [1, p. 11]
1480 Print "CHARACTER'S WISDOM IS "; WisdomScore

Select Case WisdomScore
    Case 3
        WF = -3
    Case 4
        WF = -2
    Case 5 To 7
        WF = -1
    Case 8 To 14
        WF = 0
    Case 15
        WF = 1
    Case 16
        WF = 2
    Case 17
        WF = 3
    Case 18
        WF = 4
End Select

1570 If WF <> 0 Then Print "ADD "; WF; " TO ROLL MAGIC BASED SAVING THROW"

1585 DexterityScore = AbilityAssignedArray(4)
1590 Print "CHARACTER'S DEXTERITY IS "; DexterityScore


Rem DEXTERITY TABLE I. from PHB [1, p. 11]
DefAdj = 0
Select Case DexterityScore

    Case 3
        DF = -3: DefAdj = 4
    Case 4
        DF = -2: DefAdj = 3
    Case 5
        DF = -1: DefAdj = 2
    Case 6
        DefAdj = 1
    Case 7 To 14
        DF = 0: DefAdj = 0
    Case 15
        DF = 0: DefAdj = -1
    Case 16
        DF = 1: DefAdj = -2
    Case 17
        DF = 2: DefAdj = -3
    Case 18
        DF = 3: DefAdj = 4

End Select
Select Case DF
    Case -3
        GoSub 3600
    Case -2
        GoSub 3620
    Case -1
        GoSub 3640
    Case 1
        GoSub 3660
    Case 2
        GoSub 3680
    Case 3
        GoSub 3700
End Select

Rem THIEF FUNCTION TABLE from PHB [1, p. 28], does not include RACIAL ADJUSTMENTS section.
1741 Dim ThiefSkills(8) As Integer
1742 For I = 1 To 8
    Read ThiefSkills(I)
Next I
Data 30,25,20,15,10,10,80,0

Rem DEXTERITY TABLE II. from PHB [1, p. 12]
Rem Dexterity affects some but not all thief skills.
Rem for my own sanity in implementation, let me not them them here
Rem Picking Pockets, Opening Locks, Finding/Removing Traps, Moving Silently, and Hiding in Shadows
Rem These are, mercifully, the first five array entries.
Select Case DexterityScore
    Case 9
        ThiefSkills(1) = ThiefSkills(1) - 15: ThiefSkills(2) = ThiefSkills(2) - 10: ThiefSkills(3) = ThiefSkills(3) - 10: ThiefSkills(4) = ThiefSkills(4) - 20: ThiefSkills(5) = ThiefSkills(5) - 10
    Case 10
        ThiefSkills(1) = ThiefSkills(1) - 10: ThiefSkills(2) = ThiefSkills(2) - 5: ThiefSkills(3) = ThiefSkills(3) - 10: ThiefSkills(4) = ThiefSkills(4) - 15: ThiefSkills(5) = ThiefSkills(5) - 5
    Case 11
        ThiefSkills(1) = ThiefSkills(1) - 5: ThiefSkills(3) = ThiefSkills(3) - 5: ThiefSkills(4) = ThiefSkills(4) - 10
    Case 12
        ThiefSkills(3) = ThiefSkills(3) - 5
    Case 16
        ThiefSkills(2) = ThiefSkills(2) + 5
    Case 17
        ThiefSkills(1) = ThiefSkills(1) + 5: ThiefSkills(2) = ThiefSkills(2) + 10
    Case 18
        ThiefSkills(1) = ThiefSkills(1) + 10: ThiefSkills(2) = ThiefSkills(2) + 15: ThiefSkills(3) = ThiefSkills(3) + 5: ThiefSkills(4) = ThiefSkills(4) + 10: ThiefSkills(5) = ThiefSkills(5) + 10
End Select

Rem MF$: Missile fire mod.
Rem DG$: Defensive adjustment for reflex saves and armor class

1760 MF$ = "Add " + LTrim$(Str$(DF)) + " TO MISSILE FIRE ROLLS 'TO HIT'"
1770 DG$ = "ADD " + LTrim$(Str$(DA)) + " TO ARMOR CLASS"
1790 ConstitutionScore = AbilityAssignedArray(5)
1820 Print "CHARACTER'S CONSTITUTION IS "; ConstitutionScore
HPMod = 0
SystemShockSurvival = 0
ResurectionSurvival = 0
Rem Skipped Con Table Earlier.
Rem CONSTITUTION TABLE FROM PHB [1, p. 12]
Select Case ConstitutionScore
    Case 3
        HPMod = -2: SystemShockSurvival = 35: ResurrectionSurvival = 40
    Case 4
        HPMod = -1: SystemShockSurvival = 40: ResurrectionSurvival = 45
    Case 5
        HPMod = -1: SystemShockSurvival = 45: ResurrectionSurvival = 50
    Case 6
        HPMod = -1: SystemShockSurvival = 50: ResurrectionSurvival = 55
    Case 7 To 13
        Rem and for one, fleeting, beautiful moment, we have a clear scalar expression
        HPMod = 0: SystemShockSurvival = 20 + (5 * ConstitutionScore): ResurrectionSurvival = 25 + (5 * ConstitutionScore)
    Case 14
        HPMod = 0: SystemShockSurvival = 88: ResurrectionSurvival = 92
    Case 15
        HPMod = 1: SystemShockSurvival = 91: ResurrectionSurvival = 94
    Case 16
        HPMod = 2: SystemShockSurvival = 95: ResurrectionSurvival = 96
    Case 17
        HPMod = 3: SystemShockSurvival = 97: ResurrectionSurvival = 98
    Case 18
        HPMod = 4: SystemShockSurvival = 99: ResurrectionSurvival = 100
End Select


1840 CharismaScore = AbilityAssignedArray(6)
1850 Print "CHARACTER'S CHARISMA IS "; CharismaScore

Rem XF = extra followers
Rem LltyBase = loyalty base
Rem ReactAdj = Reaction Adjustment
XF = 0
LltyBase = 0
ReactAdj = 0
Rem CHARISMA TABLE from PHB [1, p. 13]
Select Case CharismaScore
    Case 3
        XF = 1: LltyBase = -30: ReactAdj = -25
    Case 4
        XF = 1: LltyBase = -25: ReactAdj = -20
    Case 5
        XF = 2: LltyBase = -20: ReactAdj = -15
    Case 6
        XF = 2: LltyBase = -15: ReactAdj = -10
    Case 7
        XF = 3: LltyBase = -10: ReactAdj = -5
    Case 8
        XF = 4: LltyBase = -5:
    Case 9 To 11
        XF = 4
    Case 12
        XF = 5
    Case 13
        XF = 5: ReactAdj = 5
    Case 14
        XF = 6: LltyBase = 5: ReactAdj = 10
    Case 15
        XF = 7: LltyBase = 15: ReactAdj = 15
    Case 16
        XF = 8: LltyBase = 20: ReactAdj = 25
    Case 17
        XF = 10: LltyBase = 30: ReactAdj = 30
    Case 18
        XF = 15: LltyBase = 40: ReactAdj = 35
End Select
1970 Print "CAN HAVE "; XF; " RETAINERS"
1980 L = 0

If RA = 7 Or RA = 4 Then
    Rem bard check
    If StrengthScore > 14 And IntelligenceScore > 11 And WisdomScore > 14 And DexterityScore > 14 And ConstitutionScore > 9 And CharismaScore > 14 Then Print "Bard is available. Begin as fighter."
End If


Rem 10 classes PHB
Rem 13 multiclasses PHB
Rem 4 classes US
Rem 10 classes OA
Rem The Dragon Cavalier is probably getting filtered, but later,
Rem It goes in the fighter section of the first phb array for now
1999 Dim AvailClasses(37) As ClassDef
Dim FirstPassClassHolder(37) As ClassDef
For I = 1 To 37
    FirstPassClassHolder(I).ClassName = ""
Next I

Rem CHARACTER RACE TABLE II.: CLASS LEVEL LIMITATIONS from PHB [1, p. 14]
For I = 1 To 11
    Select Case RA
        Case 1
            If Classes(I).RaceDwarf = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 2
            If Classes(I).RaceElf = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 3
            If Classes(I).RaceGnome = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 4
            If Classes(I).RaceHalfElf = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 5
            If Classes(I).RaceHalfling = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 6
            If Classes(I).RaceHalfOrc = 1 Then FirstPassClassHolder(I) = Classes(I)
        Case 7
            If Classes(I).RaceHuman = 1 Then FirstPassClassHolder(I) = Classes(I)
    End Select
Next I
For I = 1 To 13
    K = I + 11
    Select Case RA
        Case 1
            If MultiClasses(I).RaceDwarf = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 2
            If MultiClasses(I).RaceElf = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 3
            If MultiClasses(I).RaceGnome = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 4
            If MultiClasses(I).RaceHalfElf = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 5
            If MultiClasses(I).RaceHalfling = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 6
            If MultiClasses(I).RaceHalfOrc = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
        Case 7
            If MultiClasses(I).RaceHuman = 1 Then FirstPassClassHolder(K) = MultiClasses(I)
    End Select
Next I

CurIdx = 1
For I = 1 To 37
    If FirstPassClassHolder(I).ClassName <> "" Then
        If StrengthScore < FirstPassClassHolder(I).MinStr Or IntelligenceScore < FirstPassClassHolder(I).MinInt Or WisdomScore < FirstPassClassHolder(I).MinWis Or DexterityScore < FirstPassClassHolder(I).MinDex Or ConstitutionScore < FirstPassClassHolder(I).MinCon Or CharismaScore < FirstPassClassHolder(I).MinCha Or WisdomScore >= FirstPassClassHolder(I).MaxWis Then
        Else
            Rem debug statement
            Rem Print "Eligible for "; FirstPassClassHolder(I).ClassName
            AvailClasses(CurIdx) = FirstPassClassHolder(I)
            CurIdx = CurIdx + 1
        End If
    End If
Next I

Rem Debug statement to break after class eligibilty was displayed
Rem Input "I think this breaks things?", DEBUG_VAR
Dim CleanedClasses(CurIdx) As ClassDef
For I = 1 To CurIdx
    CleanedClasses(I) = AvailClasses(I)
Next I

2000
Print "Available Classes:"
For I = 1 To CurIdx - 1
    Print I; ". "; CleanedClasses(I).ClassName
Next I

Dim ChosenClass As ClassDef
Input "Enter the number of your chosen class: ", CN
ChosenClass = CleanedClasses(CN)

Rem class category check, mainly for psionic abilities
If InStr(ChosenClass.Category, "Cleric") Then isCL = 1 ':  Print "IS A CLERIC"
If InStr(ChosenClass.Category, "Fighter") Then isFT = 1 ':  Print "IS A FIGHTER"
If InStr(ChosenClass.Category, "Magic-User") Then isMU = 1 ': Print "IS A MAGIC-USER"
If InStr(ChosenClass.Category, "Thief") Then isTF = 1 'H: Print "IS A THIEF"
Rem holding these debug statements for later

Rem Print ChosenClass.Category
Rem Input "WHAT CLASSES ARE THEY", CLASS$


3090 CZ$ = " CLERIC VERSUS UNDEAD TABLE (1d20)"
3100 CU$ = " SKEL ZOMB GHOU WIGT WRAI MUMM SPEC VAMP"
3110 Z1$ = " 7    9    11   --   --   --   --   --  "


3120 TY$ = " THIEF'S ABILITIES"
3130 TA$ = " PICK REMV PICK MOVE CLIM HIDE NEAR READ"
3140 TB$ = " LOCK TRAP PCKT SILT SURF SHDW NOIS LANG"
Rem this line removed for maintainability reasons.
Rem 3150 K1$ = " 15%  10%  20%  20%  87%  10%  1-2"
Rem We'll come back to it after class is chosen.
GOLD = 0
For I = 1 To ChosenClass.GoldDieNum
    goldRoll = Int((Rnd * ChosenClass.GoldDieSize) + 1)
    GOLD = GOLD + goldRoll
Next I

Rem Monks need little money
If ChosenClass.ClassName <> "Monk" Then
    GOLD = GOLD * 10
End If


Rem This is an edge case for non-fighters with 18 STR.
Rem You don't get to break out your golf ball d100s for a MUSCLE WIZARD
3361 If isFT = 0 And STR = 18 Then SF = 1: SFF = 16: DA = 2: OD = 3

Rem We check if the character is a thief, and then adjust for race.
Rem Post-hoc style rationalization: if these functions were not one liners, then they would devour precious vertical space, which is at a premium in old IDEs.
Rem I can trust my logic copying from a table, but scrolling?
Rem Horrifying.
Rem We'll ignore vertical space from increasingly deranged comments.
Rem Implementing PLUS RACIAL ADJUSTMENTS from the PHB table THIEF FUNCTION TABLE (PLUS RACIAL ADJUSTMENTS)  [1, p. 28]
If isTF = 1 Or InStr(ChosenClass.ClassName, "Monk") Then
    Select Case RA

        Case 1
            Rem Dwarf Thieves are good at locks and traps, but bad at climbing walls
            ThiefSkills(2) = ThiefSkills(2) + 10: ThiefSkills(3) = ThiefSkills(3) + 15: ThiefSkills(7) = ThiefSkills(7) - 10: ThiefSkills(8) = ThiefSkills(8) - 5
        Case 2
            Rem Elf Thieves are good at picking pockets, proceeding unseen or unheard, but are bad at lockpicking, spindly dextrous fingers are bad at manipulating locks, you see.
            ThiefSkills(1) = ThiefSkills(1) + 5: ThiefSkills(2) = ThiefSkills(2) - 5: ThiefSkills(4) = ThiefSkills(4) + 5: ThiefSkills(5) = ThiefSkills(5) + 10: ThiefSkills(6) = ThiefSkills(6) + 5

        Case 3
            Rem Gnomes are good at sneaking and opening locks, but are bad at climbing walls. I will be very good at climbing walls when I finish writing this table.
            ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 10: ThiefSkills(4) = ThiefSkills(4) + 5: ThiefSkills(5) = ThiefSkills(5) + 5: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) - 15

        Case 4
            Rem Half elves do not have half the modifers of elves, that would make far too much sense. They pick pockets and hide.
            ThiefSkills(1) = ThiefSkills(1) + 10: ThiefSkills(5) = ThiefSkills(5) + 5
        Case 5
            Rem Halfling thieves are good at everything except climbing walls and reading Languages. They're also very good at generating heinous unreadable lines of code.
            Rem CSc 330 told me that 80 characters was the maximum allowable characters on a line, for legibility reasons. The line below is 328.
            Rem Do I blame Kemeny and Kurtz, Gygax, or myself for this?
            Rem "He traded space for descriptive variable names, descriptive variable names for aeshetic fidelity, aesthetic fidelity for runtime efficiency, and runtime efficiency for life. In the end, he traded life for space." -Afari, Tales
            Rem The above bastardization of Magic card flavor text is 232 characters long and fits perfectly on my maximized QB64 window.
            ThiefSkills(1) = ThiefSkills(1) + 5: ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 5: ThiefSkills(4) = ThiefSkills(4) + 10: ThiefSkills(5) = ThiefSkills(5) + 15: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) - 15: ThiefSkills(8) = ThiefSkills(8) - 5

        Case 6
            Rem Half Orc thieves are bad pickpockets and with languages, but good at hearing, climbing, and mechanics.
            ThiefSkills(1) = ThiefSkills(1) - 5: ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 5: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) + 5: ThiefSkills(8) = ThiefSkills(8) - 10
    End Select
    Dim ThiefString(8) As String


    For J = 1 To 8
        ThiefString(J) = LTrim$(Str$(ThiefSkills(J))) + "%"
    Next J

End If



Rem SET ALIGNMENT
Rem Alignment can be done in multiple ways, this is not an aspect of the stystem that will  extend, thus very low res implementation.
Dim alignment As String
Dim Alignments(9) As String

For I = 1 To 9
    Read Alignments(I)
Next I
Data "Lawful Good","Neutral Good","Chaotic Good","Lawful Neutral","True Neutral","Chaotic Neutral","Lawful Evil","Neutral Evil","Chaotic Evil"
Rem two alignment charts for monks and assassins
Rem monks are lawful
Dim MonkAlignments(3) As String
MonkAlignments(1) = Alignments(1): MonkAlignments(2) = Alignments(4): MonkAlignments(3) = Alignments(7)

Rem asssassins are evil
Rem Saieth Gygax: "perforce, as  the killing of humans and other intelligent life forms for the purpose of profit is basically held to be the antithesis of weal" [1, p.28]
Dim Asslignments(3) As String
Rem QB64's input delay makes me yearn for 2 character varnames.
Asslignments(3) = Alignments(9): Asslignments(2) = Alignments(8): Asslignments(1) = Alignments(7)
Rem we went backwards, wheeee

Rem We DO NOT make 1d alignment arrays for the paladin and the druid.

Dim GoodAlignments(3) As String
GoodAlignments(1) = Alignments(1): GoodAlignments(2) = Alignments(2): GoodAlignments(3) = Alignments(3)

If InStr(ChosenClass.ClassName, "Monk") Then
    Print "As a Monk, your alignment must be Lawful:"
    For I = 1 To 3
        Print I; ". "; MonkAlignments(I)
    Next I
    Do
        Input "Enter the number of your alignment (1-3): ", A$
        A = Val(A$)
        If A < 1 Or A > 3 Then Print "Invalid choice. Please choose a number from 1 to 3."
    Loop While A < 1 Or A > 3
    alignment = MonkAlignments(A)


ElseIf InStr(ChosenClass.ClassName, "Ranger") Then
    Print "As a Ranger, your alignment must be good:"
    For I = 1 To 3
        Print I; ". "; GoodAlignments(I)
    Next I
    Do
        Input "Enter the number of your alignment (1-3): ", A$
        A = Val(A$)
        If A < 1 Or A > 3 Then Print "Invalid choice. Please choose a number from 1 to 3."
    Loop While A < 1 Or A > 3
    alignment = GoodAlignments(A)

ElseIf InStr(ChosenClass.ClassName, "Assassin") Then
    Print "As an Assassin, your alignment must be Evil:"
    For I = 1 To 3
        Print I; ". "; Asslignments(I)
    Next I
    Do
        Input "Enter the number of your alignment (1-3): ", A$
        A = Val(A$)
        If A < 1 Or A > 3 Then Print "Invalid choice. Please choose a number from 1 to 3."
    Loop While A < 1 Or A > 3
    alignment = Asslignments(A)

ElseIf InStr(ChosenClass.ClassName, "Druid") Then
    alignment = "True Neutral"
ElseIf InStr(ChosenClass.ClassName, "Paladin") Then
    alignment = "Lawful Good"
Else
    Print "Choose your alignment:"
    For I = 1 To 9
        Print I; ". "; Alignments(I)
    Next I
    Do
        Input "Enter the number of your alignment (1-9): ", A$
        A = Val(A$)
        If A < 1 Or A > 9 Then Print "Invalid choice. Please choose a number from 1 to 9."
    Loop While A < 1 Or A > 9
    alignment = Alignments(A)

End If

Rem PsiCompatibility generates a number between 1 and 22 because it's fully random anyway.
Rem We expect users not to choose powers they can't take.
Rem If they do, they get a random choice, as that's fair.
Rem PSIONICS: PHB Appendix I. [1, p. 110]
Rem PC must have one or more mental stats at or above 16 to check for psionics
1990 If IntelligenceScore > 15 Or WisdomScore > 15 Or CharismaScore > 15 Then
    Rem 1% chance of psionics, +more for good stats
    Rem we cast this to a shot out of 1000 to avoid floating point interactions

    Rem I'm not going to mess around with >= here, we add 1 for a simple greater than check
    BaseChance = 10
    Rem We get a residue of good mental ability scores
    IntRes = IntelligenceScore - 16
    WisRes = WisdomScore - 16
    ChaRes = CharismaScore - 16
    Rem for each point of int about 16, psionics chance increases by 2.5%
    If IntRes > 0 Then IntRes = IntRes * 25: BaseChance = BaseChance + IntRes
    Rem for each point of wis above 16, psionics chance increases by 1%
    If WisRes > 0 Then WisRes = WisRes * 10: BaseChance = BaseChance + WisRes
    Rem for each point of cha above 16, psionics chance increase by 0.5%
    If ChaRes > 0 Then ChaRes = ChaRes * 5: BaseChance = BaseChance + ChaRes

    If BaseChance Mod 10 = 5 Then BaseChance = BaseChance - 5

    Rem As an aside, even with perfect 18s, chances of psionics are vanishingly low
    Rem 1+5+2+1 = 9% of the top end

    PsiRoll = Int((Rnd(1) * 1000) + 1)
    If BaseChance > PsiRoll Then
        Print "Psionics available"
        Rem I just want to implement the check for now
        Rem Please I just want to stop doing this
        Rem psionic ability is a percentile roll
        PA = Int((Rnd(1) * 100) + 1)
        Rem plus one for each point of mental attribute > 12
        MD = 0
        If IntelligenceScore > 12 Then MD = MD + (IntelligenceScore - 12)
        If WisdomScore > 12 Then MD = MD + (WisdomScore - 12)
        If CharismaScore > 12 Then MD = MD + (CharismaScore - 12)
        Rem If two or more exceed sixteen, double the modifier
        If (IntelligenceScore > 16 And WisdomScore > 16) Or (IntelligenceScore > 16 And CharismaScore > 16) Or (WisdomScore > 16 And CharismaScore > 16) Then MD = MD * 2
        Rem If all three? Quadruple it.
        Rem As the precondition is necessarily true, we double it again
        If IntelligenceScore > 16 And WisdomScore > 16 And CharismaScore > 16 Then MD = MD * 2
        Rem add modifier to base
        PS = PA + MD

        Rem Quoth Gygax: "The total is the *psionic strength* of the individual; it is the strength for attack and for defense."
        Rem Continued: "Psionic ability is double psionic strength, i.e. 10 to 344."
        Rem Continued: "On-ehalf of *psionic ability* is attack strength, one-half is defense strength."
        PA = 2 * PS
        PD = PS

        Rem Each psionicist gets a random number of attack modes, (chosen), a random number of defense modes (chosen), and a random number of psionic disciplines (randomly assigned).
        Rem Number of psionic attack modes is determined by percentile dice and applied to a table.
        MentPer = Int((Rnd(1) * 100) + 1)
        AtCt = 0
        Select Case MentPer
            Case 1 To 25
                AtCt = 1
            Case 26 To 50
                AtCt = 2
            Case 51 To 75
                AtCt = 3
            Case 76 To 95
                AtCt = 4
            Case Else
                AtCt = 5
        End Select

        Dim AttackModes(5) As String
        AttackModes(1) = "Psionic Blast"
        AttackModes(2) = "Mind Thrust"
        AttackModes(3) = "Ego Whip"
        AttackModes(4) = "Id Insinuation"
        AttackModes(5) = "Psychic Crush"

        Dim Chosen(5) As Integer
        Dim Selected(5) As String

        Print "You may choose"; AtCt; " psionic attack mode(s):"
        For I = 1 To AtCt
            Print "Available modes:"
            For J = 1 To 5
                If Chosen(J) = 0 Then Print J; ": "; AttackModes(J)
            Next J

            Input "Enter number of your choice: ", Pick
            While Pick < 1 Or Pick > 5 Or Chosen(Pick) = 1
                Print "Invalid or already chosen. Try again."
                Input "Enter number of your choice: ", Pick
            Wend

            Chosen(Pick) = 1
            Selected(I) = AttackModes(Pick)
        Next I

        Print
        Print "You have selected the following psionic attack modes:"
        For I = 1 To AtCt
            Print "- "; Selected(I)
        Next I

        Rem Number of psionic defense modes is determined in much the same way.
        Rem The table frequencies differ, though.
        MentPer = Int((Rnd(1) * 100) + 1)
        DfCt = 0
        Select Case MentPer
            Case 1 To 25
                DfCt = 2
            Case 25 To 75
                DfCt = 3
            Case 76 To 90
                DfCt = 4
            Case Else
                DfCt = 5
        End Select

        Dim DefenseModes(5) As String
        DefenseModes(1) = "Mind Blank"
        DefenseModes(2) = "Thought Shield"
        DefenseModes(3) = "Mental Barrier"
        DefenseModes(4) = "Intellect Fortress"
        DefenseModes(5) = "Tower of Iron Will"

        Dim DefChosen(5) As Integer
        Dim DefSelected(5) As String

        Rem Mind Blank is automatic
        DefChosen(1) = 1
        DefSelected(1) = DefenseModes(1)

        Print
        Print "You automatically gain: Mind Blank"

        DEFct = AtCt ' You gain as many defense modes as attack modes
        If DEFct > 1 Then
            Print "You may choose"; DEFct - 1; " additional psionic defense mode(s):"
            For I = 2 To DEFct
                Print "Available defense modes:"
                For J = 2 To 5
                    If DefChosen(J) = 0 Then Print J; ": "; DefenseModes(J)
                Next J

                Input "Enter number of your choice: ", Pick
                While Pick < 2 Or Pick > 5 Or DefChosen(Pick) = 1
                    Print "Invalid or already chosen. Try again."
                    Input "Enter number of your choice: ", Pick
                Wend

                DefChosen(Pick) = 1
                DefSelected(I) = DefenseModes(Pick)
            Next I
        End If

        Print
        Print "Your psionic defense modes:"
        For I = 1 To DEFct
            Print "- "; DefSelected(I)
        Next I

        Rem Number of Psionic Disciplines is PERCENTILE AGAIN
        Rem ON ANOTHER ODDLY SHAPED TABLE
        MentPer = Int((Rnd(1) * 100) + 1)
        MnD = 0
        MjD = 0
        Select Case MentPer
            Case 1 To 10
                MnD = 1
            Case 11 To 25
                MnD = 2
            Case 26 To 40
                MnD = 3
            Case 41 To 55
                MnD = 2: MjD = 1
            Case 56 To 70
                MnD = 3: MjD = 1
            Case 71 To 80
                MnD = 4: MjD = 1
            Case 81 To 90
                MnD = 3: MjD = 2
            Case 91 To 95
                MnD = 5: MjD = 1
            Case Else
                MnD = 4: MjD = 2
        End Select

        Rem We make an executive decision here, one taken for my sanity.
        Rem Choosing powers when rolling? No. We reroll.
        Rem Gygax again [1. p. 111]
        Rem "Roll again (or select one*)"
        Rem "*Consult your referee for his ruling on this."

        Rem Not Gygax anymore:
        Rem "As your referee: no you may not pick. I am not writing that."
        Rem This may change in a later fork.

        Rem Psionic disciplines are earned via leveling.
        Rem You get one minor one at character creation.
        Rem The theoretical 18 INT 18 WIS 18 CHA psionicist is less weary from rolling 1 minor power at level 1.

        Rem 24 options.
        Rem The TABLE OF PSIONIC DISCIPLINES says Minor(Devotions) disciplines should be generated by rolling a d12 and a d6.
        Rem Presumably we add 12 to the d12 roll if the d6 is a 4+.
        Rem That makes sense in 1978.
        Rem Then in 2012 Joseph Goodman invented the d24.
        Rem What I'm trying to say here:
        Rem I don't want to generate a variable between one and twelve, and a variable between one and six.
        Rem we'll make one between 1 and 24.
        DV$ = ""

        RollDiscipline:
        Rem MN stands for Minor Number
        MN = Int((Rnd(1) * 24) + 1)

        If MN > 22 Then GoTo RollDiscipline
        If isFT And MN = 10 Then GoTo RollDiscipline
        If isCL And (MN = 12 Or MN = 20) Then GoTo RollDiscipline
        If isMU And MN = 3 Then GoTo RollDiscipline
        If isTF And (MN = 9 Or MN = 18) Then GoTo RollDiscipline
        If MN < 23 Then DV$ = MinorDiscipline(MN)
    End If
End If


Rem monks, unarmored nimble fighters, do not get their dexterity to AC
Rem I cannot tell how this class works.
Dim baseAC As Integer

baseAC = 10 + DefAdj
Rem "Armor class below 10 is not possibble except through cursed items." [2, p.73]
If baseAC > 10 Then baseAC = 10

If InStr(ChosenClass.ClassName, "Monk") Then baseAC = 10


Rem Language Determination
Dim LangList(18) As String
LangList(1) = "Dwarvish"
LangList(2) = "Elvish"
LangList(3) = "Gnome"
LangList(4) = "Goblin"
LangList(5) = "Gnoll"
LangList(6) = "Halfling"
LangList(7) = "Hobgoblin"
LangList(8) = "Kobold"
LangList(9) = "Orc"
LangList(10) = "Dragon"
LangList(11) = "Giant"
LangList(12) = "Ogre"
LangList(13) = "Troll"
LangList(14) = "Pixie"
LangList(15) = "Lizard Man"
LangList(16) = "Minotaur"
LangList(17) = "Centaur"
LangList(18) = "Doppelganger"

Dim KnownLangs(10) As String
KnownLangs(1) = "Common"
KnownLangs(2) = alignment
Dim KL As Integer
KL = 2
Select Case RA
    Case 1
        KL = KL + 1: KnownLangs(KL) = "Dwarvish"
    Case 2
        KL = KL + 1: KnownLangs(KL) = "Elvish"
    Case 3
        KL = KL + 1: KnownLangs(KL) = "Gnome"
    Case 4
        KL = KL + 1: KnownLangs(KL) = "Elvish"
    Case 5
        KL = KL + 1: KnownLangs(KL) = "Halfling"
End Select

If isCL And ChosenClass.ClassName = "Druid" Then
    KL = KL + 1: KnownLangs(KL) = "Druidic"
End If

If isTF Then
    KL = KL + 1: KnownLangs(KL) = "Thieves' Cant"
End If
Dim Pick As Integer
Dim LangChosen(18) As Integer
Print "You may choose"; bonusLangCount; " additional language(s):"
For I = 1 To bonusLangCount
    Print "Available languages:"
    For J = 1 To 18
        If LangChosen(J) = 0 Then Print J; ". "; LangList(J)
    Next J

    Do
        Input "Enter the number of your choice: ", Pick
        If Pick < 1 Or Pick > 18 Or LangChosen(Pick) = 1 Or KnownLangs(3) = LangList(Pick) Then
            Print "Invalid or already chosen. Try again."
        End If
    Loop While Pick < 1 Or Pick > 18 Or LangChosen(Pick) = 1

    KL = KL + 1
    KnownLangs(KL) = LangList(Pick)
    LangChosen(Pick) = 1
Next I

Dim AttackMatrix(15) As Integer
If isFT = 1 Or isCL = 1 Or ChosenClass.ClassName = "Monk" Then
    For I = 1 To 11
        AttackMatrix(I) = 9 + I
    Next I
    For I = 1 To 5
        AttackMatrix(10 + I) = 20
    Next I
Else
    For I = 1 To 10
        AttackMatrix(I) = 10 + I
    Next I
    For I = 1 To 5
        AttackMatrix(10 + I) = 20
    Next I
End If
If InStr(ChosenClass.ClassName, "Monk") Then GOLD = GOLD / 10
If ChosenClass.Title = "" Then ChosenClass.Title = "Multiclassed"
3380 Print "   SUMMARY OF CHARACTER "
3390 Print "RACE: ", ChosenRace.RaceName;:
3400 Print " CLASS: ", ChosenClass.ClassName; " TITLE: ", ChosenClass.Title

Print "GOLD: "; GOLD
Print "Equipment can be found on pages 35-36 of the PHB."
Print "ALIGNMENT: "; alignment




Dim HitPoints As Integer
If ChosenClass.SecondHD > 0 Then
    If ChosenClass.ThirdHD > 0 Then
        HitPoints = Int((Int((Rnd * ChosenClass.HitDie) + 1) + Int((Rnd * ChosenClass.SecondHD) + 1) + Int((Rnd * ChosenClass.ThirdHD) + 1)) / 3)
    Else
        If ChosenClass.ClassName = "Cleric/Ranger" Then
            HitPoints = Int((Int((Rnd * 8) + 1) + Int((Rnd * 8) + 1) + Int((Rnd * 8) + 1)) / 2)

        Else
            HitPoints = Int((Int((Rnd * ChosenClass.HitDie) + 1) + Int((Rnd * ChosenClass.SecondHD) + 1)) / 2)
        End If
    End If
ElseIf InStr(ChosenClass.ClassName, "Monk") Then
    HitPoints = Int((Rnd * 4) + 1) + Int((Rnd * 4) + 1)
ElseIf InStr(ChosenClass.ClassName, "Ranger") Then
    HitPoints = Int((Rnd * 8) + 1) + Int((Rnd * 8) + 1)
Else
    HitPoints = Int((Rnd * ChosenClass.HitDie) + 1)
End If
If isFT = 0 And ConstitutionScore > 16 Then HPMod = 2

HitPoints = HitPoints + HPMod
Rem monks are edgy edge case boys.
Rem rangers get this too
If InStr(ChosenClass.ClassName, "Monk") Or InStr(ChosenClass.ClassName, "Ranger") Then HitPoints = HitPoints + HPMod
If HitPoints < 1 Then HitPoints = 1
Print "HP: ";: Print HitPoints;: Print " BASE ARMOR CLASS: ";: Print baseAC


Rem dwarf constitution spell modifier
Rem there was no variable name that wasn't *afflicted*
DfCnSpMd = 0
Rem SAVES GO HERE

Rem SAVING THROW MATRIX FOR CHARACTERS AND HUMAN TYPES [2, p.79]
Dim ClericSaves(5) As Integer
ClericSaves(1) = 10: ClericSaves(2) = 13: ClericSaves(3) = 14: ClericSaves(4) = 16: ClericSaves(5) = 15
Dim FighterSaves(5) As Integer
FighterSaves(1) = 14: FighterSaves(2) = 17: FighterSaves(3) = 18: FighterSaves(4) = 20: FighterSaves(5) = 19
Dim MUSaves(5) As Integer
MUSaves(1) = 14: MUSaves(2) = 13: MUSaves(3) = 11: MUSaves(4) = 15: MUSaves(5) = 12
Dim TFSaves(5) As Integer
TFSaves(1) = 13: TFSaves(2) = 12: TFSaves(3) = 14: TFSaves(4) = 16: TFSaves(5) = 15
Dim SaveTypes(5) As String
SaveTypes(1) = "Paralysis, Poison, and Death": SaveTypes(2) = "Petrification or Polymorph": SaveTypes(3) = "Rod, Staff, or Wand": SaveTypes(4) = "Breath Weapon": SaveTypes(5) = "Spell"
Dim saveChecker(5, 4) As Integer
Rem make a 5x4 array and fill it with 20s
Rem sort of vibing my way to best saves for multiclassed characters
Rem the intent is to find the minimum and put it in the corresponding save array slot.
For I = 1 To 5
    For J = 1 To 4
        saveChecker(I, J) = 20
    Next J
Next I

Rem if a cleric, fill line 1 with cleric saves
If isCL Then
    For I = 1 To 5
        saveChecker(I, 1) = ClericSaves(I)
    Next I
End If

Rem if a fighter, fill line 2 with fighter saves
If isFT Then
    For I = 1 To 5
        saveChecker(I, 2) = FighterSaves(I)
    Next I
End If

Rem if a magic-user, fill line 3 with mu saves
Rem astute readers will notice a pattern
If isMU Then
    For I = 1 To 5
        saveChecker(I, 3) = MUSaves(I)
    Next I
End If

Rem if a thief, fill line 4 with thief saves
Rem SURPRISE THOUGH: ALSO IF A MONK
If isTF Or InStr(ChosenClass.ClassName, "Monk") Then
    For I = 1 To 5
        saveChecker(I, 4) = TFSaves(I)
    Next I
End If

Dim FinalSaves(5) As Integer

For I = 1 To 5
    MinSave = saveChecker(I, 1)
    For J = 2 To 4
        If saveChecker(I, J) < MinSave Then
            MinSave = saveChecker(I, J)
        End If
    Next J
    FinalSaves(I) = MinSave
Next I
If ChosenClass.ClassName = "Paladin" Then
    For I = 1 To 5
        FinalSaves(I) = FinalSaves(I) - 2
    Next I
End If

Rem Dwarves get a modifier based on Constitution/3.5 to RSW and Spell saves [1, p.15]
Rem This applies to gnomes as well. [1, p.16]
Rem Furthermore, halflings [1, p.17]

If RA = 1 Or RA = 3 Or RA = 5 Then
    Select Case ConstitutionScore
        Case 7 To 10
            DfCnSpMd = 2
        Case 11 To 13
            DfCnSpMd = 3
        Case 14 To 17
            DfCnSpMd = 4
        Case 18
            DfCnSpMd = 5
    End Select
    FinalSaves(3) = FinalSaves(3) - DfCnSpMd: FinalSaves(5) = FinalSaves(5) - DfCnSpMd
End If


Print " STRENGTH: ";: Print StrengthScore
Print SH$;: Print SO$;: If OW > 1 Then Print WL$
Print " INTELLIGENCE: ";: Print IntelligenceScore
Print lang$
Print " WISDOM: ";: Print WisdomScore
If WF <> 0 Then Print " ADD "; WF; " TO ROLL - MAGIC BASED SAVING THROWS"
Print " DEXTERITY";: Print DexterityScore
Print " CONSTITUTION ";: Print ConstitutionScore
Print " CHARISMA ";: Print CharismaScore
Print " MAY HAVE "; XF; " RETAINERS"
For I = 1 To 5
    Print SaveTypes(I);: Print FinalSaves(I);: Print ". ";:
Next I

If MN > 0 Then
    Print "Character is psionic"
    Print "Psionic Ability: " + Str$(PS)
    Print "Psionic Attack Strength: " + Str$(PA)
    Print "Psionic Defense Strength: " + Str$(MD)
    Print "Number of Psionic Attack Modes: " + Str$(AtCt)

    Print "Psionic Attack Modes: ";
    For I = 1 To UBound(Selected$)
        If I < UBound(Selected$) Then
            Print Selected$(I); ", ";
        Else
            Print Selected$(I); ".";
        End If
    Next I
    Print

    Print "Number of Psionic Defense Modes: " + Str$(DfCt)

    Print "Psionic Defense Modes: ";
    For I = 1 To UBound(DefSelected$)
        If I < UBound(DefSelected$) Then
            Print DefSelected$(I); ", ";
        Else
            Print DefSelected$(I); ".";
        End If
    Next I
    Print

    Print "Number of Minor Disciplines: " + Str$(MnD)
    If MjD > 0 Then Print "Number of Major Disciplines: " + Str$(MjD)
    Print "Psychic Discipline: " + DV$
End If

If isCL = 1 And ChosenClass.ClassName <> "Druid" Then
    Print "Cleric Spells Per Day: "
    Print "Level 1: 1"
    Print CZ$
    Print CU$
    Print Z1$
End If

If ChosenClass.ClassName = "Druid" Then
    Print "Druid Spells Per Day: "
    Print "Level 1: 2"
End If

Rem Magic-users get one spell from each of three l1 tables: offensive, defensive, and misc. [2, p. 39]
Rem if a  10 is rolled, they pick on that table
Rem Read Magic is also free.
If InStr(ChosenClass.ClassName, "Magic-User") Then

    Dim StarterSpells(4) As String
    StarterSpells(1) = "Read Magic"

    Rem this is either bad style or Gygaxian style.
    Rem We define three spell lists (above), and then load them into an array.
    Dim SpellLists(3, 9) As String
    For I = 1 To 9
        SpellLists(1, I) = OffensiveSpells(I)
    Next I
    For I = 1 To 9
        SpellLists(2, I) = DefensiveSpells(I)
    Next I
    For I = 1 To 9
        SpellLists(3, I) = MiscSpells(I)
    Next I

    Rem iterate through lists
    For I = 1 To 3
        spellNum = Int(Rnd * 10) + 1

        If spellNum = 10 Then
            Print "Available spells in category "; I
            For K = 1 To 9
                Print K; ". "; SpellLists(I, K)
            Next K

            Do
                Input "You get to CHOOSE a spell (1-9): ", SPnum
                If SPnum < 1 Or SPnum > 9 Then
                    Print "Invalid choice. Please choose a number from 1 to 9."
                End If
            Loop While SPnum < 1 Or SPnum > 9

            StarterSpells(I + 1) = SpellLists(I, SPnum)

        Else
            StarterSpells(I + 1) = SpellLists(I, spellNum)
        End If
    Next I
    Print "Spells Known:"
    For I = 1 To 4
        Print StarterSpells(I)
    Next I
    Print "Magic-User Spells Per Day"
    Print "Level 1: 1"
End If


Rem Illusionists generate three random spells, rerolling duplicates. [2, p. 39]
If InStr(ChosenClass.ClassName, "Illusionist") Then
    Dim SpellsKnown(3) As String
    idx1 = 0
    idx2 = 0
    For I = 1 To 3
        IlluStart:
        spellNum = Int(Rnd * 12) + 1
        If spellNum = idx1 Or spellNum = idx2 Then GoTo IlluStart
        SpellsKnown(I) = IllusL1Spells(spellNum)
        If I = 1 Then idx1 = spellNum
        If I = 2 Then idx2 = spellNum
    Next I
    Print "Spells Known:"
    For I = 1 To 3
        Print SpellsKnown(I)
    Next I
    Print "Illusionist Spells Per Day"
    Print "Level 1: 1"
End If


If isTF = 1 Then

    Print TY$: Print TA$: Print TB$
    ThiefString(8) = " --"
    Print "  ";
    For I = 1 To 8
        Print ThiefString(I);
        Print "  ";
    Next I
    Print ""
End If

If InStr(ChosenClass.ClassName, "Monk") Then
    Rem We remove PICK PCKT from the thief skills, because monks don't pick pockets.
    TA$ = " PICK REMV MOVE CLIM HIDE NEAR"
    TB$ = " LOCK TRAP SILT SURF SHDW NOIS"

    Print "MONK SKILLS": Print TA$: Print TB$
    Print "  ";
    For I = 1 To 7
        If I <> 3 Then Print ThiefString(I);
        If I <> 3 Then Print "  ";
    Next I
    Print ""

End If
GoTo 3720
3600 X1$ = "ADD "
3601 X2$ = "3"
3602 X3$ = " TO"
3610 Return

3620 X1$ = "ADD "
3621 X2$ = "2"
3622 X3$ = " TO"
3630 Return

3640 X1$ = "ADD "
3641 X2$ = "2"
3642 X3$ = " TO"
3650 Return

3660 X1$ = "SUBTRACT "
3661 X2$ = "1"
3662 X3$ = " FROM"
3670 Return

3680 X1$ = "SUBTRACT "
3681 X2$ = "2"
3682 X3$ = " FROM"
3690 Return

3700 X1$ = "SUBTRACT "
3701 X2$ = "3"
3702 X3$ = " FROM"
3710 Return

Rem Stonecunning is a thirdism, but that's fine.
Rem This didn't get a table heading, but it's in the Dwarf section of the PHB [1, p. 15]
3720 If RA = 1 Then
    Print "DWARVEN STONECUNNING"
    Print " DETECT        OBSERVE   NOTICE  SPOT  INTUIT"
    Print "  SLOPE   CONSTRUCTION   SHIFTS  TRAP   DEPTH"
    Print "    75%            75%      66%   50%     50%"
End If
Rem I don't think this improves with level.

Rem As it turns out, Gnomes get stonecunning too.
If RA = 3 Then
    Print "Gnomish Stonecunning"
    Print " DETECT    NOTICE   INTUIT  DETERMINE"
    Print "  SLOPE    UNSAFE    DEPTH  DIRECTION"
    Print "    80%       70%      60%        50%"
End If

Print "LANGUAGES KNOWN:"
For I = 1 To KL
    Print "- "; KnownLangs(I)
Next I

Input "What is your character's name?", name$
Dim filename As String
filename = "character_" + Date$ + "_" + Time$

For I = 1 To Len(filename)
    Select Case Mid$(filename, I, 1)
        Case "/", ":"
            Mid$(filename, I, 1) = "_"
    End Select
Next I
filename = filename + ".txt"

Open filename For Output As #1

Print #1, "=== ADVANCED DUNGEONS & DRAGONS CHARACTER ==="
Print #1, ""
Print #1, "Name: "; name$
Print #1, "Race: "; ChosenRace.RaceName
Print #1, "Class: "; ChosenClass.ClassName; " (Title: "; ChosenClass.Title; ")"
Print #1, "Alignment: "; alignment
Print #1, "Gold: "; GOLD
Print #1, "Hit Points: "; HitPoints
Print #1, "Base Armor Class: "; baseAC
Print #1, "Add "; SF; " to hit in melee, "; DA; " to damage."
Dim MeleeMatrix(15) As Integer
For I = 1 To 15
    MeleeMatrix(I) = AttackMatrix(I) - SF
Next I
Dim RangedMatrix(15) As Integer
For I = 1 To 15
    RangedMatrix(I) = AttackMatrix(I) - DF
Next I
Dim MatrixNumbers(15) As Integer
For I = 1 To 15
    MatrixNumbers(I) = 11 - I
Next I

Print #1, "== TO HIT ARMOR CLASS =="
Print #1, "AC:     ";
For I = 1 To 15
    Print #1, Using "## "; MatrixNumbers(I);
Next I
Print #1, ""

Print #1, "Melee:  ";
For I = 1 To 15
    Print #1, Using "## "; MeleeMatrix(I);
Next I
Print #1, ""

Print #1, "Ranged: ";
For I = 1 To 15
    Print #1, Using "## "; RangedMatrix(I);
Next I
Print #1, ""


Print #1, ""
Print #1, "== ABILITY SCORES =="
If PER > 0 Then
    Print #1, "STR: "; StrengthScore; " ("; PER; "%)"
Else
    Print #1, "STR: "; StrengthScore
End If
Print #1, "INT: "; IntelligenceScore
Print #1, "WIS: "; WisdomScore
Print #1, "DEX: "; DexterityScore
Print #1, "CON: "; ConstitutionScore
Print #1, "CHA: "; CharismaScore
Print #1, ""
Print #1, "== SAVING THROWS =="
For I = 1 To 5
    Print #1, SaveTypes(I); ": "; FinalSaves(I)
Next I

Print #1, ""
Print #1, "== DERIVED ATTRIBUTES =="
Print #1, "Strength: "
Print #1, "- Bend Bars/Lift Gates: "; SFF; "%"
Print #1, "- Open sealed doors: "; OD; "/6"
If OW > 0 Then Print #1, "Open Wizard Locked doors: "; OW; "/6"
If isMU = 1 Then
    Print #1, "Intelligence: "
    Print #1, "- "; SP$
End If

If WF <> 0 Then
    Print #1, "Wisdom: "
    Print #1, "- Add "; WF; " to saves against mental attacks."
End If

Print #1, "Dexterity: "
Print #1, "- Defensive Adjustment: "; DefAdj
Print #1, "- Reaction/Attacking Adjustment: "; DF

Print #1, "Constitution: "
Print #1, "- HP modifier per HD: "; HPMod
Print #1, "- System Shock Survival: "; SystemShockSurvival; "%"
Print #1, "- Resurrection Survival: "; ResurrectionSurvival; "%"

Print #1, "Charisma: "
Print #1, "- Maximum Retainerss: "; XF
Print #1, "- Base Loyalty: "; LltyBase
Print #1, "- Reaction Adjustment: "; ReactAdj

Print #1, ""
Print #1, "== LANGUAGES =="
For I = 1 To KL
    Print #1, "- "; KnownLangs(I)
Next I
Print #1, ""

If isCL = 1 And ChosenClass.ClassName <> "Druid" Then
    Print #1, "Cleric Spells Per Day: Level 1: 1"
End If

If ChosenClass.ClassName = "Druid" Then
    Print #1, "Druid Spells Per Day: Level 1: 2"
End If

If InStr(ChosenClass.ClassName, "Magic-User") Then
    Print #1, "Magic-User Spells Per Day: Level 1: 1"
    Print #1, "Known Spells:"
    For I = 1 To 4
        Print #1, "- "; StarterSpells(I)
    Next I
End If

If InStr(ChosenClass.ClassName, "Illusionist") Then
    Print #1, "Illusionist Spells Per Day: Level 1: 1"
    Print #1, "Known Spells:"
    For I = 1 To 3
        Print #1, "- "; SpellsKnown(I)
    Next I
End If

If isTF = 1 Then
    Print #1, "== THIEF SKILLS =="

    Print #1, TY$: Print #1, TA$: Print #1, TB$
    For I = 1 To 8
        Print #1, ThiefString(I);
        If I < 8 Then Print #1, " | ";
    Next I
    Print #1, ""
End If
If InStr(ChosenClass.ClassName, "Monk") Then
    Print #1, "== MONK SKILLS ==": Print #1, TA$: Print #1, TB$
    Print #1, "  ";
    For I = 1 To 7
        If I <> 3 Then Print #1, ThiefString(I);
        If I <> 3 Then Print #1, "  ";
    Next I
    Print #1, ""

End If


If MN > 0 Then
    Print #1, "Character is psionic"
    Print #1, "Psionic Ability: " + Str$(PS)
    Print #1, "Psionic Attack Strength: " + Str$(PA)
    Print #1, "Psionic Defense Strength: " + Str$(MD)
    Print #1, "Number of Psionic Attack Modes: " + Str$(AtCt)

    Print #1, "Psionic Attack Modes: ";
    For I = 1 To UBound(Selected$)
        If I < UBound(Selected$) Then
            Print #1, Selected$(I); ", ";
        Else
            Print #1, Selected$(I); ".";
        End If
    Next I
    Print #1,

    Print #1, "Number of Psionic Defense Modes: " + Str$(DfCt)

    Print #1, "Psionic Defense Modes: ";
    For I = 1 To UBound(DefSelected$)
        If I < UBound(DefSelected$) Then
            Print #1, DefSelected$(I); ", ";
        Else
            Print #1, DefSelected$(I); ".";
        End If
    Next I


    Print #1, "Number of Minor Disciplines: " + Str$(MnD)
    If MjD > 0 Then Print #1, "Number of Major Disciplines: " + Str$(MjD)
    Print #1, "Psychic Discipline: " + DV$
End If


Print #1, ""
Print #1, "=== END OF CHARACTER SHEET ==="
Print #1, "Generated: "; Date$; " "; Time$

Close #1

Print "Character written to: "; filename

4000 Print "DONE"


Function ROLLDIERESULT
    ROLLDIERESULT = Int(Rnd * 6) + 1
End Function

Function RollStat
    Dim rolls(4) As Integer
    For i = 1 To 4
        rolls(i) = ROLLDIERESULT
    Next i

    Rem Find the lowest roll
    lowest = rolls(1)
    For i = 2 To 4
        If rolls(i) < lowest Then
            lowest = rolls(i)
        End If
    Next i

    Rem Sum all rolls and subtract the lowest
    total = 0
    For i = 1 To 4
        total = total + rolls(i)
    Next i
    RollStat = total - lowest
End Function

Rem Implementation of Method I for Generation of Ability Scores from Dungeon Master's Guide [4, p. 11]
Sub GenerateSortedStats (stats() As Integer)
    Rem    Dim temp As Integer

    Rem Generate six stats
    For i = 1 To 6
        stats(i) = RollStat
    Next i
    Call quicksort(stats(), 1, 6)
    Call ReverseArray(stats())
End Sub

Rem Implementation of Method II for Generation of Ability Scores from Dungeon Master's Guide [4, p. 11]
Rem Sub GenerateSortedStatsMII (stats() As Integer)
Rem TODO: Implement this (I am lazy, and this is unpopular)
Rem End Sub

Rem Quicksort adapted from RosettaCode example
Rem https://rosettacode.org/wiki/Sorting_algorithms/Quicksort#QB64
Sub quicksort (arr() As Integer, leftN As Integer, rightN As Integer)
    Dim pivot As Integer, leftNIdx As Integer, rightNIdx As Integer
    leftNIdx = leftN
    rightNIdx = rightN
    If (rightN - leftN) > 0 Then
        pivot = (leftN + rightN) \ 2 ' integer division
        While (leftNIdx <= pivot) And (rightNIdx >= pivot)
            While (arr(leftNIdx) < arr(pivot)) And (leftNIdx <= pivot)
                leftNIdx = leftNIdx + 1
            Wend
            While (arr(rightNIdx) > arr(pivot)) And (rightNIdx >= pivot)
                rightNIdx = rightNIdx - 1
            Wend
            Swap arr(leftNIdx), arr(rightNIdx)
            leftNIdx = leftNIdx + 1
            rightNIdx = rightNIdx - 1
            If (leftNIdx - 1) = pivot Then
                rightNIdx = rightNIdx + 1
                pivot = rightNIdx
            ElseIf (rightNIdx + 1) = pivot Then
                leftNIdx = leftNIdx - 1
                pivot = leftNIdx
            End If
        Wend
        Call quicksort(arr(), leftN, pivot - 1)
        Call quicksort(arr(), pivot + 1, rightN)
    End If
End Sub

Sub ReverseArray (arr() As Integer)
    Dim i As Integer, j As Integer, temp As Integer
    j = UBound(arr)
    For i = 1 To j \ 2
        temp = arr(i)
        arr(i) = arr(j - i + 1)
        arr(j - i + 1) = temp
    Next i
End Sub




Rem REFERENCES

Rem [1] G. Gygax, Advanced Dungeons & Dragons Player's Handbook, 6th ed., Lake Geneva, WI: TSR Hobbies, Inc., Jan. 1980.

Rem [2] G. Gygax, Unearthed Arcana, 1st ed., Lake Geneva, WI: TSR, 1985.

Rem [3] Howard, "Untitled handwritten character generator," c. 1980s. Private manuscript, reproduced with indirect permission.

Rem [4] G. Gygax, Advanced Dungeons & Dragons Dungeon Masters Guide, 1st ed., Lake Geneva, WI: TSR Hobbies, Inc., 1979.

Rem [5] G. Gygax, "From the Sorcerer's Scroll: The Chivalrous Cavalier," Dragon, no. 72, pp. 6-13, Apr. 1983.
