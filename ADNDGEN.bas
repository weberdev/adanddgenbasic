Rem This is an archival and expansion of some handwritten code I was shown.
Rem Most likely written between 1983 and 1985, but 1983 is the minimum year.
Rem It's an archival piece, at least in some ways.
Rem I expanded on some features, implementing functionality from D&D volumes of the era.
Rem This version omits Unearthed Arcana (1985), and such material will be included in a later fork.

101 Option Base 1
105 Randomize Timer

Type ClassDef
    ClassName As String * 20: ClassIndex As Integer
    HitDie As Integer: Category As String * 12
    MinStr As Integer: MinInt As Integer: MinWis As Integer
    MinDex As Integer: MinCon As Integer: MinCha As Integer
    Rem This next one is needed for one thing. Is it really needed?
    Rem Yes, as it turns out.
    MaxWis As Integer
    RaceDwarf As Integer: RaceElf As Integer: RaceGnome As Integer
    RaceHalfElf As Integer: RaceHalfling As Integer: RaceHalfOrc As Integer: RaceHuman As Integer
    GoldDieNum As Integer: GoldDieSize As Integer
End Type

Type RaceDef
    RaceName As String * 20: RaceIndex As Integer
    MinStr As Integer: MaxStr As Integer: MinInt As Integer: MaxInt As Integer
    MinWis As Integer: MaxWis As Integer: MinDex As Integer: MaxDex As Integer
    MinCon As Integer: MaxCon As Integer: MinCha As Integer: MaxCha As Integer
End Type

Dim Classes(11) As ClassDef

Classes(1).ClassName = "FIGHTER": Classes(1).ClassIndex = 1: Classes(1).HitDie = 10
Classes(1).Category = "Fighter"
Classes(1).MinStr = 9: Classes(1).MinInt = 0: Classes(1).MinWis = 0
Classes(1).MinDex = 0: Classes(1).MinCon = 7: Classes(1).MinCha = 0
Rem Futureproofing for UA barbarian. My honest reaction: >:(
Classes(1).MaxWis = 18
Classes(1).RaceDwarf = 1: Classes(1).RaceElf = 1: Classes(1).RaceGnome = 1
Classes(1).RaceHalfElf = 1: Classes(1).RaceHalfling = 1
Classes(1).RaceHalfOrc = 1: Classes(1).RaceHuman = 1
Classes(1).GoldDieNum = 5: Classes(1).GoldDieSize = 4

Classes(2).ClassName = "PALADIN": Classes(2).ClassIndex = 2: Classes(2).HitDie = 10
Classes(2).Category = "Fighter"
Classes(2).MinStr = 12: Classes(2).MinInt = 9: Classes(2).MinWis = 13
Classes(2).MinDex = 0: Classes(2).MinCon = 9: Classes(2).MinCha = 17
Classes(2).MaxWis = 18
Classes(2).RaceHuman = 1
Classes(2).GoldDieNum = 5: Classes(2).GoldDieSize = 4

Classes(3).ClassName = "RANGER": Classes(3).ClassIndex = 3: Classes(3).HitDie = 16
Classes(3).Category = "Fighter"
Classes(3).MinStr = 13: Classes(3).MinInt = 13: Classes(3).MinWis = 14: Classes(3).MinCon = 14
Classes(3).MaxWis = 18
Rem Elves can't be rangers for some reason.
Rem Rangers don't have to be dextrous for some reason.
Classes(3).RaceHalfElf = 1: Classes(3).RaceHuman = 1
Classes(3).GoldDieNum = 5: Classes(3).GoldDieSize = 4

Classes(4).ClassName = "Cavalier": Classes(4).ClassIndex = 4: Classes(4).HitDie = 10
Classes(4).Category = "Fighter"
Classes(4).MinStr = 15: Classes(4).MinInt = 10: Classes(4).MinWis = 10
Classes(4).MinDex = 15: Classes(4).MinCon = 15: Classes(4).MaxWis = 18
Rem per Dragon Magazine 72 [5], Cavaliers can be human, elven and half-elven
Rem this will change with Unearthed Arcana
Classes(4).RaceElf = 1: Classes(4).RaceHalfElf = 1: Classes(4).RaceHuman = 1
Classes(4).GoldDieNum = 5: Classes(4).GoldDieSize = 4


Classes(5).ClassName = "Magic-User": Classes(5).ClassIndex = 5: Classes(5).HitDie = 4
Classes(5).Category = "Magic-User"
Classes(5).MinInt = 9: Classes(5).MinDex = 6: Classes(5).MaxWis = 18
Classes(5).RaceElf = 1: Classes(5).RaceHalfElf = 1: Classes(5).RaceHuman = 1
Classes(5).GoldDieNum = 2: Classes(5).GoldDieSize = 4

Classes(6).ClassName = "Illusionist": Classes(6).ClassIndex = 6: Classes(6).HitDie = 4
Classes(6).Category = "Magic-User"
Classes(6).MinInt = 15: Classes(6).MinDex = 16: Classes(6).MaxWis = 18
Classes(6).RaceGnome = 1: Classes(6).RaceHuman = 1
Classes(6).GoldDieNum = 2: Classes(6).GoldDieSize = 4


Classes(7).ClassName = "Cleric": Classes(7).ClassIndex = 7: Classes(7).HitDie = 8
Classes(7).Category = "Cleric"
Classes(7).MinWis = 9: Classes(7).MaxWis = 18
Classes(7).RaceDwarf = 1: Classes(7).RaceElf = 1: Classes(7).RaceGnome = 1
Classes(7).RaceHalfElf = 1: Classes(7).RaceHalfOrc = 1: Classes(7).RaceHuman = 1
Classes(7).GoldDieNum = 3: Classes(7).GoldDieSize = 6

Classes(8).ClassName = "Druid": Classes(8).ClassIndex = 8: Classes(8).HitDie = 8
Classes(8).Category = "Cleric"
Classes(8).MinWis = 12: Classes(8).MinCha = 15: Classes(8).MaxWis = 18
Rem the restriction on elves and nature classes comes from Moorcock and Poul Anderson. Elves are not-nearly as Tolkeinian in early D&D.
Classes(8).RaceHalfElf = 1: Classes(8).RaceHalfling = 1: Classes(8).RaceHuman = 1
Classes(8).GoldDieNum = 3: Classes(8).GoldDieSize = 6

Classes(9).ClassName = "Thief": Classes(9).ClassIndex = 9: Classes(9).HitDie = 6
Classes(9).Category = "Thief"
Classes(9).MinDex = 9: Classes(9).MaxWis = 18
Rem everyone can steal
Classes(9).RaceDwarf = 1: Classes(9).RaceElf = 1: Classes(9).RaceGnome = 1
Classes(9).RaceHalfElf = 1: Classes(9).RaceHalfling = 1: Classes(9).RaceHalfOrc = 1
Classes(9).RaceHuman = 1
Classes(9).GoldDieNum = 2: Classes(9).GoldDieSize = 6

Classes(10).ClassName = "Assassin": Classes(10).ClassIndex = 10: Classes(10).HitDie = 6
Classes(10).Category = "Thief"
Classes(10).MinInt = 11: Classes(10).MinDex = 12: Classes(10).MaxWis = 18
Classes(10).RaceDwarf = 1: Classes(10).RaceElf = 1: Classes(10).RaceGnome = 1
Classes(10).RaceHalfElf = 1: Classes(10).RaceHalfOrc = 1: Classes(10).RaceHuman = 1
Classes(10).GoldDieNum = 2: Classes(10).GoldDieSize = 6

Classes(11).ClassName = "Monk": Classes(11).ClassIndex = 11: Classes(11).HitDie = 8
Classes(11).Category = "Monk"
Classes(11).MinStr = 15: Classes(11).MinWis = 15: Classes(11).MinDex = 15: Classes(11).MinCon = 11
Classes(11).MaxWis = 18
Classes(11).RaceHuman = 1
Rem NOTE TO SELF: check for monk status when generating starting gold: Do not apply tenfold scalar if monk.
Classes(11).GoldDieNum = 5: Classes(11).GoldDieSize = 4

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
181 If LCase$(response$) <> "y" Then GoTo 160

Dim AvailRaces(7) As RaceDef
For I = 1 To UBound(Races)
    If (AbilityAssignedArray(1) >= Races(I).MinStr) And (AbilityAssignedArray(2) >= Races(I).MinInt) And (AbilityAssignedArray(3) >= Races(I).MinWis) And (AbilityAssignedArray(4) >= Races(I).MinDex) And (AbilityAssignedArray(5) >= Races(I).MinCon) And (AbilityAssignedArray(6) >= Races(I).MinCha) Then AvailRaces(I) = Races(I)
Next I


190 Print "RACE LIST"
280 Input "ENTER THE NUMBER OF YOUR CHOSEN RACE", RA$

290 RA = Val(RA$)
300 If RA < 1 Or RA > 7 Then GoTo 190

Select Case RA

    Case 1

        Rem Dwarves have Minimum str and con 8 and 12
        If AbilityAssignedArray(1) < 8 Then GoTo 190
        If AbilityAssignedArray(5) < 12 Then GoTo 190

        Rem Dwarves get +1 CON, -1 CHA
        AbilityAssignedArray(5) = AbilityAssignedArray(5) + 1
        AbilityAssignedArray(6) = AbilityAssignedArray(6) - 1

        Rem Dwarves have MAX DEX 17, MAX CHA 16, MIN CHA (as it's reduced) 3
        If AbilityAssignedArray(4) > 17 Then AbilityAssignedArray(4) = 17: Print "MAXIMUM DWARF DEXTERITY IS 17"
        If AbilityAssignedArray(6) < 3 Then AbilityAssignedArray(6) = 3
        If AbilityAssignedArray(6) > 16 Then AbilityAssignedArray(6) = 16: Print "MAXIMUM DWARF CHARISMA IS 16"
    Case 2
        Rem Elves Have Min INT 8, DEX 7, CON 6, and CHA 8
        Rem dear lord those are some restrictions
        If AbilityAssignedArray(2) < 8 Then GoTo 190
        If AbilityAssignedArray(4) < 7 Then GoTo 190
        If AbilityAssignedArray(5) < 6 Then GoTo 190
        If AbilityAssignedArray(6) < 8 Then GoTo 190

        Rem Elves Get +1 Dex, -1 Con
        AbilityAssignedArray(4) = AbilityAssignedArray(4) + 1
        AbilityAssignedArray(5) = AbilityAssignedArray(5) - 1

        Rem Elves have No maximum stats that are salient at this point
        Rem Con might've caught a stray penalty, however.
        If AbilityAssignedArray(5) < 6 Then AbilityAssignedArray(5) = 6
    Case 3 Rem Gnomes have Min STR 6, INT 7, Con 8
        If AbilityAssignedArray(1) < 6 Then GoTo 190
        If AbilityAssignedArray(2) < 7 Then GoTo 190
        If AbilityAssignedArray(5) < 8 Then GoTo 190

        Rem Gnomes get gno ability score modifiers.
        Rem Gnor do they have caps
    Case 4
        Rem Half-elves have Min 4 INT, 6 Dex, 6 CON
        If AbilityAssignedArray(2) < 4 Then GoTo 190
        If AbilityAssignedArray(4) < 6 Then GoTo 190
        If AbilityAssignedArray(5) < 6 Then GoTo 190

        Rem Half Elves have no ability score modifiers, nor salient ability score caps
    Case 5
        Rem Halflings have Min 6 str, 6 int, 8 dex, 10 con
        If AbilityAssignedArray(1) < 6 Then GoTo 190
        If AbilityAssignedArray(2) < 6 Then GoTo 190
        If AbilityAssignedArray(4) < 8 Then GoTo 190
        If AbilityAssignedArray(5) < 10 Then GoTo 190

        Rem Halflings Get +1 Dex, -1 str
        AbilityAssignedArray(1) = AbilityAssignedArray(1) - 1
        AbilityAssignedArray(4) = AbilityAssignedArray(4) + 1

        Rem Halflings have max str 17, max wis 17
        If AbilityAssignedArray(1) > 17 Then AbilityAssignedArray(1) = 17: Print "MAXIMUM HALFLING STRENGTH IS 17"
        If AbilityAssignedArray(3) > 17 Then AbilityAssignedArray(3) = 17: Print "MAXIMUM HALFLING WISDOM IS 17"

        Rem Halflings have min str 6
        If AbilityAssignedArray(1) < 6 Then AbilityAssignedArray(1) = 6
    Case 6
        Rem Half-orcs have min 6 str, min 13 con
        If AbilityAssignedArray(1) < 6 Then GoTo 190
        If AbilityAssignedArray(5) < 13 Then GoTo 190

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
End Select
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
Rem See PHB 1e, PHB
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

1570 Print "ADD "; WF; " TO ROLL MAGIC BASED SAVING THROW"

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

Rem THIEF FUNCTION TABLE from PHB [1, p. 28] does not include RACIAL ADJUSTMENTS section.
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

Rem I didn't want to do this, man
Rem line 1990 is the psionics section
Rem 1981 If RA = 7 Then GoTo 1990
GoTo 2000
Rem cut above line when multiclassing ready
1982 If RA = 7 Then GoTo 2000


Rem Race/class options for multiclassing is buried in race descriptions in the PHB [1, pp.15-17]
Rem 1982 Print " WOULD YOU LIKE TO MULTICLASS?"

Rem In which we define the multi-class combinations from the PHB SECTION "The-Multi-Classed Character" [1, pp. 32-33]
Rem arguments exist about whether or not it's a section or table: it is a section.

Rem let MC = multiclass option
MC = 0
Dim MultiClasses(13) As String
For I = 1 To 13
    Read MultiClasses(I)
Next I
Data "Cleric/Fighter","Cleric/Fighter/Magic-user","Cleric/Ranger","Cleric/Magic-user","Cleric/Thief","Cleric/Assassin","Fighter/Magic-user","Fighter/Illusionist","Fighter/Thief","Fighter/Assassin","Fighter/Magic-user/Thief","Magic-user/Thief","Illusionist/Thief"
Rem quick reference:
Rem 1: cleric/fighter
Rem 2: cleric/fighter/magic-user
Rem 3: cleric/ranger
Rem 4: cleric/magic-user
Rem 5: cleric/thief
Rem 6: cleric/assassin
Rem 7: fighter/magic-user
Rem 8: fighter/illusionist
Rem 9: fighter/thief
Rem 10: fighter/assassin
Rem 11: fighter/magic-user/thief
Rem 12: magic-user/thief
Rem 13: illusionist/thief
Dim AvailMCs(8) As String
For I = 1 To 8
    AvailMCs(I) = ""
Next I

Select Case RA
    Case 1
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS A DWARF WITH REQUIRED ATTRIBUTES, YOU MAY BE A FIGHTER/THIEF": AvailMCs(1) = MultiClasses(9)


    Case 2
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS AN ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/THIEF": AvailMCs(1) = MultiClasses(9)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 And IntelligenceScore > 8 Then Print "AS AN ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/MAGIC-USER/THIEF": AvailMCs(2) = MultiClasses(11)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 5 And IntelligenceScore > 8 Then Print "AS AN ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/MAGIC-USER": AvailMCs(3) = MultiClasses(7)
        If IntelligenceScore > 8 And DexterityScore > 8 Then Print "AS AN ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A MAGIC-USER/THIEF": AvailMCs(4) = MultiClasses(12)



    Case 3
        Rem Gnome rules are fuzzy
        Rem Gnomes can be Fighters, Thieves, assassins, or illusionists
        Rem Multiclassing between Thief and assassin seems incorrect- we assume that you can't do that.
        Rem Multiclassing in general is allowable, however
        Rem thus
        Rem fighter thief
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS A GNOME WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/THIEF": AvailMCs(1) = MultiClasses(9)
        Rem fighter illusionist
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 15 And IntelligenceScore > 14 Then Print "AS A GNOME WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/ILLUSIONIST": AvailMCs(1) = MultiClasses(8)
        Rem thief illusionist
        If DexterityScore > 15 And IntelligenceScore > 14 Then Print "AS A GNOME WITH REQUIRED ATTRIBUTES YOU MAY BE A THIEF/ILLUSIONIST": AvailMCs(3) = MultiClasses(13)
        Rem "NOT explicitly authorized" is an understatement. Skip this.
        GoTo GnomeMultSkip
        Rem The following multiclasses are NOT explicitly authorized
        Rem fighter assassin
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 12 And IntelligenceScore > 10 Then Print "AS A GNOME WITH REQUIRED ATTRIBUTES, YOU MAY BE A FIGHTER/ASSASSIN": Print "ENTER 4 TO SELECT THIS"
        Rem assassin illusionist
        Rem assassin requirements are fully superseded by illusionist
        If DexterityScore > 15 And IntelligenceScore > 14 Then Print "AS A GNOME WITH REQUIRED ATTRIBUTES YOU MAY BE AN ASSASSIN/ILLUSIONIST": Print "ENTER 5 TO SELECT THIS"
        Rem IT IS WORTH NOTING
        Rem the book only lists fighter illusionist, fighter thief, and illusionist thief as acceptable classes
        Rem It depends on what the definition of is is
        GnomeMultSkip:

    Case 4
        Rem half elves
        Rem Half elves can be multiclassed
        Rem QUOTH PHB Half-elf section, Paragraph 2 [1, p. 17]
        Rem A character of half-elven race can also opt to become a multiclassed individual, i.e. cleric/fighter, cleric/ranger, cleric/magic-user, fighter/magic-user, fighte/thief, magic-user/thief, cleric/fighter/magicuser, or a fighter/magic-user/thief.
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/THIEF": AvailMCs(1) = MultiClasses(9)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 And IntelligenceScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/MAGIC-USER/THIEF": AvailMCs(2) = MultiClasses(11)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 5 And IntelligenceScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/MAGIC-USER": AvailMCs(3) = MultiClasses(7)
        If IntelligenceScore > 8 And DexterityScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A MAGIC-USER/THIEF": AvailMCs(4) = MultiClasses(12)
        If StrengthScore > 12 And IntelligenceScore > 12 And WisdomScore > 13 And ConstitutionScore > 13 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A CLERIC/RANGER": AvailMCs(5) = MultiClasses(3)
        If StrengthScore > 8 And ConstitutionScore > 6 And WisdomScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A CLERIC/FIGHTER": AvailMCs(6) = MultiClasses(1)
        If IntelligenceScore > 8 And DexterityScore > 5 And WisdomScore > 8 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A MAGIC-USER/CLERIC": AvailMCs(7) = MultiClasses(12)
        If IntelligenceScore > 8 And WisdomScore > 8 And StrengthScore > 8 And ConstitutionScore > 6 Then Print "AS A HALF ELF WITH REQUIRED ATTRIBUTES YOU MAY BE A FIGHTER/MAGIC-USER/CLERIC": AvailMCs(8) = MultiClasses(2)

    Case 5
        Rem Halflings
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS A HALFLING WITH REQUIRED ATTRIBUTES, YOU MAY BE A FIGHTER/THIEF": AvailMCs(1) = MultiClasses(9)
        Rem THANK GYGAX IT'S EASY

    Case 6
        Rem half-orcs
        Rem Quoth Gygax: It is also possible for a half-orc character to operate in two classes at the same time: cleric/fighter, cleric/thief, cleric/assassin, fighter/thief, or fighter/assassin."   [1, p.17]
        If StrengthScore > 8 And ConstitutionScore > 6 And WisdomScore > 8 Then Print "AS A HALF ORC WITH REQUIRED ATTRIBUTES YOU MAY BE A CLERIC/FIGHTER": AvailMCs(1) = MultiClasses(1)
        If WisdomScore > 8 And DexterityScore > 8 Then Print "AS A HALF OR WITH REQUIRED ATTRIBVUTES YOU MAY BE A CLERIC/THIEF": AvailMCs(2) = MultiClasses(5)
        If WisdomScore > 8 And IntelligenceScore > 10 And DexterityScore > 12 Then Print "AS A HALF ORC WITH REQUIRED ATTRIBUTESYOU MAY BE A CLERIC/ASSASSIN": AvailMCs(3) = MultiClasses(6)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 8 Then Print "AS A HALF ORC WITH REQUIRED ATTRIBUTES, YOU MAY BE A FIGHTER/THIEF": AvailMCs(4) = MultiClasses(9)
        If StrengthScore > 8 And ConstitutionScore > 6 And DexterityScore > 12 And IntelligenceScore > 10 Then Print "AS A HALF ORC WITH REQUIRED ATTRIBUTES, YOU MAY BE A FIGHTER/ASSASSIN": AvailMCs(5) = MultiClasses(10)
    Case Else
        GoTo 2000
End Select
Print
Print "AVAILABLE MULTI-CLASS OPTIONS:"
MC = 0
For I = 1 To UBound(AvailMCs)
    If AvailMCs(I) <> "" Then
        MC = MC + 1
        Print Str$(MC); ". "; AvailMCs(I)
    End If
Next I


GoTo 2000

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
        Rem Going on a tangent here, and this comment is likely to get pulled out in a later git revision, but working on this program has made me appreciate AD&D a lot more.
        Rem Working on the psionics section has made me dislike psionics.


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
                MnD = 2
                MjD = 1
            Case 56 To 70
                MnD = 3
                MjD = 1
            Case 71 To 80
                MnD = 4
                MjD = 1
            Case 81 To 90
                MnD = 3
                MjD = 2
            Case 91 To 95
                MnD = 5
                MjD = 1
            Case Else
                MnD = 4
                MjD = 2
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

        RollDiscipline:
        Rem MN stands for Minor Number
        MN = Int((Rnd(1) * 24) + 1)
        Rem I've just realized that this code CANNOT be where it is.
        Rem NO. I CAN FIX THIS EASILY.

        If MN > 22 Then GoTo RollDiscipline
        If MN < 23 Then DV$ = MinorDiscipline(MN)
        Rem If we have a class mismatch, we can just reroll outside of this mess when class is chosen.

        Rem
    Else GoTo 2000
    End If
End If

2000 Print "       CLASS LIST"
2010 Print " --------------------------"
2020 Print " 1 Fighter 2 Paladin"
2030 Print " 3 Ranger 4 Cavalier"
2040 Print " 5 Magic-User 6 Illusionist"
2050 Print " 7 Cleric 8 Druid"
2060 Print " 9 Thief 10 Assassin"
2070 Print " 11 Monk"
2080 Print " SELECT THE CLASS THAT YOU WISH "
2090 Print " YOUR CHARACTER TO HAVE AND ENTER THE "
2100 Input " NUMBER FROM THE TABLE ABOVE ", CN$
2110 CN = Val(CN$)
2111 If CN < 1 Or CN > 11 Then GoTo 2000

2130 If CN = 1 Then 2150
2140 GoTo 2210
2150 If StrengthScore < 9 Then GoTo 2170
2160 If ConstitutionScore < 7 Then GoTo 2190
2170 GoTo 2210
2180 Print " STRENGTH TOO LOW FOR A FIGHTER": GoTo 2200
2190 Print " CONSTITUTION TOO LOW FOR A FIGHTER"
2200 Print " PLEASE SELECT AGAIN": GoTo 2000

2210 If CN = 5 Then GoTo 2230
2220 GoTo 2270
2230 If IntelligenceScore < 9 Then GoTo 2250
2240 If DexterityScore < 6 Then GoTo 2260
2250 Print " INTELLIGENCE TOO LOW FOR A MAGIC USER": GoTo 2200
2260 Print " DEXTERITY TOO LOW FOR A MAGIC USER": GoTo 2200

2270 If CN = 2 Then 2290
2280 GoTo 2390
2290 If StrengthScore < 12 Then 2340
2300 If IntelligenceScore < 9 Then 2350
2310 If WisdomScore < 13 Then 2360
2320 If ConstitutionScore < 9 Then 2370
2330 If CharismaScore < 17 Then 2380
2340 Print " STRENGTH TOO LOW FOR A PALADIN": GoTo 2200
2350 Print " INTELLIGENCE TOO LOW FOR A PALADIN": GoTo 2200
2360 Print " WISDOM TOO LOW FOR A PALADIN": GoTo 2200
2370 Print " CONSTITUTION TOO LOW FOR A PALADIN": GoTo 2200
2380 Print " CHARISMA TOO LOW FOR A PALADIN": GoTo 2200

2390 If CN = 3 Then GoTo 2410
2400 GoTo 2480
2410 If StrengthScore < 13 Then GoTo 2440
2420 If IntelligenceScore < 13 Then GoTo 2450
2430 If WisdomScore < 14 Then GoTo 2460
2431 If ConstitutionScore < 14 Then GoTo 2470
2440 Print " STRENGTH TOO LOW FOR A RANGER": GoTo 2200
2450 Print " INTELLIGENCE TOO LOW FOR A RANGER": GoTo 2200
2460 Print " WISDOM TOO LOW FOR A RANGER": GoTo 2200
2470 Print " CONSTITUTION TOO LOW FOR A RANGER": GoTo 2200

2480 If CN = 4 Then GoTo 2500
2490 GoTo 2630
2500 If StrengthScore < 15 Then GoTo 2580
2510 If DexterityScore < 15 Then GoTo 2590
2520 If ConstitutionScore < 15 Then GoTo 2600
2530 If IntelligenceScore < 10 Then GoTo 2610
2540 If WisdomScore < 10 Then GoTo 2620
2580 Print " STRENGTH TOO LOW FOR A CAVALIER": GoTo 2200
2590 Print " DEXTERITY TOO LOW FOR A CAVALIER": GoTo 2200
2600 Print " CONSTITUTION TOO LOW FOR A CAVALIER": GoTo 2200
2610 Print " INTELLIGENCE TOO LOW FOR A CAVALIER": GoTo 2200
2620 Print " WISDOM TOO LOW FOR A CAVALIER": GoTo 2200

2630 If CN = 6 Then GoTo 2650
2640 GoTo 2690
2650 If IntelligenceScore < 15 Then 2670
2660 If DexterityScore < 16 Then 2680
2670 Print " INTELLIGENCE TOO LOW FOR AN ILLUSIONIST": GoTo 2200
2680 Print " DEXTERITY TOO LOW FOR AN ILLUSIONIST": GoTo 2200

2690 If CN = 7 Then GoTo 2710
2700 GoTo 2720
2710 If WisdomScore < 9 Then Print "WISDOM TOO LOW FOR A CLERIC": GoTo 2200

2720 If CN = 8 Then GoTo 2740
2730 GoTo 2780
2740 If WisdomScore < 12 Then GoTo 2760
2750 If CharismaScore < 15 Then GoTo 2770
2760 Print " WISDOM TOO LOW FOR A DRUID": GoTo 2200
2770 Print " CHARISMA TOO LOW FOR A DRUID": GoTo 2200

2780 If CN = 9 Then GoTo 2800
2790 GoTo 2810
2800 If DexterityScore < 9 Then Print " DEXTERITY TOO LOW FOR A THIEF": GoTo 2200

2810 If CN = 10 Then GoTo 2830
2820 GoTo 2870
2830 If IntelligenceScore < 11 Then GoTo 2850
2840 If DexterityScore < 12 Then GoTo 2860
2850 Print " INTELLIGENCE TOO LOW FOR AN ASSASSIN": GoTo 2200
2860 Print " DEXTERITY TOO LOW FOR AN ASSASSIN": GoTo 2200

2870 If CN = 11 Then GoTo 2890
2880 GoTo 2970
2890 If StrengthScore < 15 Then GoTo 2930
2900 If WisdomScore < 15 Then GoTo 2940
2910 If DexterityScore < 15 Then GoTo 2950
2920 If ConstitutionScore < 11 Then GoTo 2960
2930 Print " STRENGTH TOO LOW FOR A MONK": GoTo 2200
2940 Print " WISDOM TOO LOW FOR A MONK": GoTo 2200
2950 Print " DEXTERITY TOO LOW FOR A MONK": GoTo 2200
2960 Print " CONSTITUTION TOO LOW FOR A MONK": GoTo 2200


2970 If CN = 1 Then HF(1) = 10
2980 If CN = 2 Then HF(2) = 10
2990 If CN = 3 Then HF(3) = 16
3000 If CN = 4 Then HF(4) = 4
3010 If CN = 5 Then HF(5) = 4
3020 If CN = 6 Then HF(6) = 4
3030 If CN = 7 Then HF(7) = 8
3040 If CN = 8 Then HF(8) = 8
3050 If CN = 9 Then HF(9) = 6
3060 If CN = 10 Then HF(10) = 6
3070 If CN = 11 Then HF(11) = 8


3071 CLASS$(1) = "FIGHTER": CLASS$(2) = "PALADIN": CLASS$(3) = "RANGER": CLASS$(4) = "CAVALIER"
3072 CLASS$(5) = "MAGIC-USER": CLASS$(6) = "ILLUSIONIST": CLASS$(7) = "CLERIC": CLASS$(8) = "DRUID"
3073 CLASS$(9) = "THIEF": CLASS$(10) = "ASSASSIN": CLASS$(11) = "MONK"
Rem class category check, mainly for psionic abilities
isFT = 0
isMU = 0
isCL = 0
If CN < 5 Then isFT = 1
If CN > 4 And CN < 7 Then isMU = 1
If CN > 6 And CN < 9 Then isCL = 1


3080 CLASS$ = CLASS$(CN)


3090 CZ$ = " CLERIC VERSUS UNDEAD TABLE (1d20)"
3100 CU$ = " SKEL ZOMB GHOU WIGT WRAI MUMM SPEC VAMP"
3110 Z1$ = " 7    9    11   --   --   --   --   --  "


3120 TY$ = " THIEF'S ABILITIES"
3130 TA$ = " PICK REMV PICK MOVE CLIM HIDE NEAR READ"
3140 TB$ = " LOCK TRAP PCKT SILT SURF SHDW NOIS LANG"
Rem this line removed for maintainability reasons.
Rem 3150 K1$ = " 15%  10%  20%  20%  87%  10%  1-2"
Rem We'll come back to it after class is chosen.



Rem CHARACTER RACE TABLE II.: CLASS LEVEL LIMITATIONS from PHB [1, p. 14]
3270 If RA = 1 And Not (CN = 1 Or CN = 7 Or CN = 9 Or CN = 10) Then GoTo 3278
3271 If RA = 2 And Not (CN = 1 Or CN = 5 Or CN = 7 Or CN = 9 Or CN = 10) Then GoTo 3278
3272 If RA = 3 And Not (CN = 1 Or CN = 7 Or CN = 6 Or CN = 9 Or CN = 10) Then GoTo 3278
3273 If RA = 4 And Not (CN = 1 Or CN = 3 Or CN = 5 Or CN = 7 Or CN = 8 Or CN = 9 Or CN = 10) Then GoTo 3278
3274 If RA = 5 And Not (CN = 1 Or CN = 8 Or CN = 9) Then GoTo 3278
3275 If RA = 6 And Not (CN = 1 Or CN = 7 Or CN = 9 Or CN = 10) Then GoTo 3278
3276 GoTo 3280
3278 Print "Race/class combination not allowed."

3279 GoTo 2000

3280 If CN = 1 Then m1 = 150
3290 If CN > 1 And CN < 5 Then m1 = 150: If CN = 1 Then M2 = 50
3300 If CN > 1 And CN < 5 Then M2 = 50
3310 If CN > 4 And CN < 7 Then m1 = 60: If CN > 4 And CN < 7 Then M2 = 20
3320 If CN > 5 And CN < 9 Then m1 = 150: If CN > 5 And CN < 9 Then M2 = 30
3330 If CN > 8 And CN < 11 Then m1 = 100: If CN > 8 And CN < 11 Then M2 = 20
3340 If CN = 11 Then m1 = 15: If CN = 11 Then M2 = 5
3350 GOLD = Int((Rnd(1) * m1) + M2)
3360 HP = Int((Rnd(1) * HF(CN)) + 1)
Rem This is an edge case for non-fighters with 18 STR.
Rem You don't get to break out your golf ball d100s for a MUSCLE WIZARD
3361 If CN > 3 And STR = 18 Then SF = 1: SFF = 16: DA = 2: OD = 3
3370 CLASS$ = CLASS$(CN)
3371 RACE$ = RACE$(RA)

Rem We check if the character is a thief, and then adjust for race.
Rem Post-hoc style rationalization: if these functions were not one liners, then they would devour precious vertical space, which is at a premium in old IDEs.
Rem I can trust my logic copying from a table, but scrolling?
Rem Horrifying.
Rem We'll ignore vertical space from increasingly deranged comments.
Rem Implementing PLUS RACIAL ADJUSTMENTS from the PHB table THIEF FUNCTION TABLE (PLUS RACIAL ADJUSTMENTS)  [1, p. 28]
TF = 0
If CN < 10 And CN > 7 Then TF = 1

Rem Dwarf Thieves are good at locks and traps, but bad at climbing walls
3372 If TF = 1 And RA = 1 Then ThiefSkills(2) = ThiefSkills(2) + 10: ThiefSkills(3) = ThiefSkills(3) + 15: ThiefSkills(7) = ThiefSkills(7) - 10: ThiefSkills(8) = ThiefSkills(8) - 5
Rem Elf Thieves are good at picking pockets, proceeding unseen or unheard, but are bad at lockpicking, spindly dextrous fingers are bad at manipulating locks, you see.
3373 If TF = 1 And RA = 2 Then ThiefSkills(1) = ThiefSkills(1) + 5: ThiefSkills(2) = ThiefSkills(2) - 5: ThiefSkills(4) = ThiefSkills(4) + 5: ThiefSkills(5) = ThiefSkills(5) + 10: ThiefSkills(6) = ThiefSkills(6) + 5
Rem Gnomes are good at sneaking and opening locks, but are bad at climbing walls. I will be very good at climbing walls when I finish writing this table.
3374 If TF = 1 And RA = 3 Then ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 10: ThiefSkills(4) = ThiefSkills(4) + 5: ThiefSkills(5) = ThiefSkills(5) + 5: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) - 15
Rem Half elves do not have half the modifers of elves, that would make far too much sense. They pick pockets and hide.
3375 If TF = 1 And RA = 4 Then ThiefSkills(1) = ThiefSkills(1) + 10: ThiefSkills(5) = ThiefSkills(5) + 5
Rem Halfling thieves are good at everything except climbing walls and reading Languages. They're also very good at generating heinous unreadable lines of code.
Rem CSc 330 told me that 80 characters was the maximum allowable characters on a line, for legibility reasons. The line below is 328.
Rem Do I blame Kemeny and Kurtz, Gygax, or myself for this?
Rem "He traded space for descriptive variable names, descriptive variable names for aeshetic fidelity, aesthetic fidelity for runtime efficiency, and runtime efficiency for life. In the end, he traded life for space." -Afari, Tales
Rem The above bastardization of Magic card flavor text is 232 characters long and fits perfectly on my maximized QB64 window.
3376 If TF = 1 And RA = 5 Then ThiefSkills(1) = ThiefSkills(1) + 5: ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 5: ThiefSkills(4) = ThiefSkills(4) + 10: ThiefSkills(5) = ThiefSkills(5) + 15: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) - 15: ThiefSkills(8) = ThiefSkills(8) - 5
Rem Half Orc thieves are bad pickpockets and with languages, but good at hearing, climbing, and mechanics.
3377 If TF = 1 And RA = 6 Then ThiefSkills(1) = ThiefSkills(1) - 5: ThiefSkills(2) = ThiefSkills(2) + 5: ThiefSkills(3) = ThiefSkills(3) + 5: ThiefSkills(6) = ThiefSkills(6) + 5: ThiefSkills(7) = ThiefSkills(7) + 5: ThiefSkills(8) = ThiefSkills(8) - 10

Dim ThiefString(8) As String

3378 If TF = 1 Then
    For J = 1 To 8
        ThiefString(J) = LTrim$(Str$(ThiefSkills(J))) + "%"
    Next J
End If

Rem PsiCompatibility generates a number between 1 and 22 because it's fully random anyway.
Rem We expect users not to choose powers they can't take.
Rem If they do, they get a random choice, as that's fair.
PsiCompatibilityCheck:
If TF = 1 And (MN = 9 Or MN = 18) Then
    MN = Int((Rnd(1) * 22) + 1)

    DV$ = MinorDiscipline(MN)
    GoTo PsiCompatibilityCheck
End If

If isFT = 1 And MN = 10 Then
    MN = Int((Rnd(1) * 22) + 1)

    DV$ = MinorDiscipline(MN)
    GoTo PsiCompatibilityCheck
End If

If isCL = 1 And (MN = 12 Or MN = 20) Then
    MN = Int((Rnd(1) * 22) + 1)

    DV$ = MinorDiscipline(MN)
    GoTo PsiCompatibilityCheck
End If

If isMU = 1 And MN = 3 Then
    MN = Int((Rnd(1) * 22) + 1)

    DV$ = MinorDiscipline(MN)
    GoTo PsiCompatibilityCheck
End If





Rem Level up code (if implemented), will set assassins back two levels of thief skills
3380 Print "   SUMMARY OF CHARACTER "
3390 Print "   RACE: ", RACE$
3400 Print "   CLASS: ", CLASS$; Tab(22); "GOLD: "; GOLD



3430 Print " STRENGTH: ": Print StrengthScore
3440 Print SH$
3441 Print SO$
3442 If OW > 1 Then Print WL$
3450 Print " INTELLIGENCE: ": Print IntelligenceScore
3460 If CN = 5 Then Print IZ$
3470 Print lang$
3480 Print " WISDOM: ": Print WisdomScore
3490 If WF = 0 Then GoTo 3510
3500 Print " ADD "; WF; " TO ROLL - MAGIC BASED SAVING THROWS"
3510 Print " CONSTITUTION ": Print ConstitutionScore
3520 Print " CHARISMA ": Print CharismaScore
3530 Print " MAY HAVE "; XF; " RETAINERS"
3531 If MN > 1 Then
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

3540 If CN = 7 Then GoTo 3560
3550 GoTo 3570

3560 Print CZ$
3561 Print CU$
3562 Print Z1$

3570 If TF = 1 Then GoTo 3590
3580 GoTo 4000
3590 Print TY$
3591 Print TA$
3592 Print TK$: ThiefString(8) = "--"
3593 For I = 1 To 8
    Print ThiefString(I);
Next I
3599 GoTo 4000

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
3720 If RA = 1 Then Print "DWARVEN STONECUNNING"
3721 If RA = 1 Then Print " DETECT        OBSERVE   NOTICE  SPOT  INTUIT"
3722 If RA = 1 Then Print "  SLOPE   CONSTRUCTION   SHIFTS  TRAP   DEPTH"
3723 If RA = 1 Then Print "    75%            75%      66%   50%     50%"
Rem I don't think this improves with level.

Rem As it turns out, Gnomes get stonecunning too.
3724 If RA = 3 Then Print " DETECT    NOTICE   INTUIT  DETERMINE"
3725 If RA = 3 Then Print "  SLOPE    UNSAFE    DEPTH  DIRECTION"
3726 If RA = 3 Then Print "    80%       70%      60%        50%"


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
