Rem This is an archival and expansion of some handwritten code I was shown.
Rem Most likely written between 1983 and 1985, but 1983 is the minimum year.
Rem It's an archival piece, at least in some ways. I expanded on some features, implementing
Rem Functionality from D&D volumes of the era.
Rem This version omits Unerathed Arcana (1985), and such material will be included in a later fork.

101 Option Base 1
105 Randomize Timer

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
153 AbilityNames(1) = "Strength"
154 AbilityNames(2) = "Intelligence"
155 AbilityNames(3) = "Wisdom"
156 AbilityNames(4) = "Dexterity"
157 AbilityNames(5) = "Constitution"
158 AbilityNames(6) = "Charisma"

160 For I = 1 To 6
    Print "You rolled a "; Abilities(I)
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

180 Input "Are these Stats okay? Enter y if yes, anything else if no.", response$
181 If LCase$(response$) <> "y" Then GoTo 160

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
1000 St = AbilityAssignedArray(1)
1001 If St = 18 Then PER = Int((Rnd(1) * 100) + 1)
1002 DA = 0
1003 OD = 1
1004 OW = 0

Rem  Strength Table II.: Ability Adjustments from Player's Handbook [1, p. 9]
1010 If St = 3 Then SF = -3 And SFF = 0 And DA = -1
1020 If St > 3 And St < 6 Then SF = -2 And SFF = 0 And DA = -1
1030 If St > 5 And St < 8 Then SF = -1 And SFF = 0
1031 If St > 7 And St < 16 Then OD = 2
1032 If St > 15 And St < 18 Then OD = 3
1033 If PER > 50 And PER < 100 Then OD = 4
1034 If PER = 100 Then OD = 5 And OW = 2
1035 If PER > 90 And PER < 100 Then OW = 1
1040 If St > 7 And St < 17 Then SF = 0
1041 If St > 7 And St < 10 Then SFF = 1
1042 If St > 9 And St < 12 Then SFF = 2
1043 If St > 11 And St < 14 Then SFF = 4
1044 If St > 13 And St < 16 Then SFF = 7
1045 If St = 16 Then SF = 1 And SFF = 10 And DA = 1
1050 If St = 17 Then SF = 1 And SFF = 13 And DA = 1
Rem there should be a case for non-percentile 18 strength for non-fighters
Rem Edgiest of edge cases, correction is made after class is chosen.
1070 If PER > 0 And PER < 51 Then SF = 1 And SFF = 20 And DA = 3
1080 If PER > 50 And PER < 100 Then SF = 2
1081 If PER > 50 And PER < 76 Then SFF = 25 And DA = 3
1082 If PER > 75 And PER < 91 Then SFF = 30 And DA = 4
1083 If PER > 90 And PER < 100 Then SFF = 35 And DA = 5
1090 If PER = 100 Then SF = 3 And SFF = 40 And DA = 6
1091 If St < 18 Then Print "CHARACTER'S STRENGTH IS "; St
1092 If St = 18 Then Print "CHARACTER'S STRENGTH IS 18, WITH "; PER; "% EXCEPTIONAL STRENGTH IF A FIGHTER"

Rem This is not part of the initial code, but a debug.


1110 SH$ = "ADD " + LTrim$(Str$(SF)) + " TO ROLLS TO HIT ROLLS, " + LTrim$(Str$(DA)) + " TO DAMAGE ROLLS"
Rem See PHB 1e, PHB
1120 SO$ = "AND " + LTrim$(Str$(SFF)) + "% TO BEND BARS OR LIFT GATES. SEALED DOORS CAN BE OPENED ON A " + LTrim$(Str$(OD)) + " OR LESS ON 1D6"
1121 If OW > 0 Then WL$ = "WIZARD LOCKED DOORS CAN BE OPENED ON A " + LTrim$(Str$(OW)) + " OR LESS ON 1D6. ONE TRY."

1140 IN = AbilityAssignedArray(2)
Rem  Intelligence Table II. from Player's Handbook [1, p. 10]
1141 Print "CHARACTER'S INTELLIGENCE IS "; IN
1150 If IN < 9 Then SP$ = "INTELLIGENCE TOO LOW FOR MAGIC USER"
1160 If IN = 9 Then SP$ = "35% to KNOW SPELL -- MIN/MAX PER LVL 4/6"
1170 If IN > 9 And IN < 13 Then SP$ = "45% TO KNOW SPELL -- MIN/MAX PER LVL 5/7"
1180 If IN > 12 And IN < 15 Then SP$ = "55% TO KNOW SPELL -- MIN/MAX PER LEVEL 6/9"
1190 If IN > 14 And IN < 17 Then SP$ = "65% TO KNOW SPELL -- MIN/MAX PER LEVEL 7/11"
1200 If IN = 17 Then SP$ = "75% TO KNOW SPELL -- MIN/MAX PER LVL 8/14"
1210 If IN = 18 Then SP$ = "85% TO KNOW SPELL -- MIN/MAX PER LVL 9/18"


Rem I'm not sure which version of the chart this is.
1220 If IN = 3 Then GoTo 1240
1230 GoTo 1250
1240 lang$ = "DIFFICULT SPEECH - ILLITERATE"
1250 If IN > 3 And IN < 6 Then GoTo 1270
1260 GoTo 1280
1270 lang$ = "EASY SPEECH BUT ILLITERATE"
1280 If IN > 5 And IN < 9 Then GoTo 1300
1290 GoTo 1310
1300 lang$ = "BARELY LITERATE"
1310 If IN > 8 And IN < 13 Then GoTo 1330
1320 GoTo 1340
1330 lang$ = "LITERATE IN NATIVE TONGUE"
1340 GoTo 1360
1350 lang$ = "LITERATE AND FLUENT IN TWO LANGUAGES"
1360 If IN > 15 And IN < 18 Then GoTo 1380
1370 GoTo 1390
1380 lang$ = "LITERATE AND FLUENT IN 3 LANGUAGES"
1390 If IN = 18 Then GoTo 1410
1400 GoTo 1450
1410 lang$ = "LITERATE AND FLUENT IN 4 LANGUAGES"

1450 WI = AbilityAssignedArray(3)

Rem WISDOM TABLE I. from PHB [1, p. 11]
1480 Print "CHARACTER'S WISDOM IS "; WI
1490 If WI = 3 Then WF = -3
1500 If WI = 4 Then WF = -2
1510 If WI > 4 And WI < 8 Then WF = -1
1520 If WI > 7 And WI < 15 Then WF = 0
1530 If WI = 15 Then WF = 1
1540 If WI = 16 Then WF = 2
1550 If WI = 17 Then WF = 3
1560 If WI = 18 Then WF = 4
1570 Print "ADD "; WF; " TO ROLL MAGIC BASED SAVING THROW"


1585 DX = AbilityAssignedArray(4)
1590 Print "CHARACTER'S DEXTERITY IS "; DX


Rem DEXTERITY TABLE I. from PHB [1, p. 11]
DA = 0
1610 If DX = 3 Then DF = -3 And DA = 4
1620 If DX = 4 Then DF = -2 And DA = 3
1630 If DX = 5 Then DF = -1 And DA = 2
1631 If DX = 6 Then DA = 1
1640 If DX > 5 And DX < 16 Then DF = 0
1641 If DX = 15 Then DA = -1
1650 If DX = 16 Then DF = 1 And DA = -2
1670 If DX = 17 Then DF = 2 And DA = -3
1680 If DX = 18 Then DF = 3 And DA = -4
1690 If DF = -3 Then GoSub 3600
1700 If DF = -2 Then GoSub 3620
1710 If DF = -1 Then GoSub 3640
1720 If DF = 1 Then GoSub 3660
1730 If DF = 2 Then GoSub 3680
1740 If DF = 3 Then GoSub 3700

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
1743 If DX = 9 Then ThiefSkills(1) = ThiefSkills(1) - 15 And ThiefSkills(2) = ThiefSkills(2) - 10 And ThiefSkills(3) = ThiefSkills(3) - 10 And ThiefSkills(4) = ThiefSkills(4) - 20 And ThiefSkills(5) = ThiefSkills(5) - 10
1744 If DX = 10 Then ThiefSkills(1) = ThiefSkills(1) - 10 And ThiefSkills(2) = ThiefSkills(2) - 5 And ThiefSkills(3) = ThiefSkills(3) - 10 And ThiefSkills(4) = ThiefSkills(4) - 15 And ThiefSkills(5) = ThiefSkills(5) - 5
1745 If DX = 11 Then ThiefSkills(1) = ThiefSkills(1) - 5 And ThiefSkills(3) = ThiefSkills(3) - 5 And ThiefSkills(4) = ThiefSkills(4) - 10
1746 If DX = 12 Then ThiefSkills(3) = ThiefSkills(3) - 5
Rem Dexteriy 13 through 15 have no effect on thief skills
1747 If DX = 16 Then ThiefSkills(2) = ThiefSkills(2) + 5
1748 If DX = 17 Then ThiefSkills(1) = ThiefSkills(1) + 5 And ThiefSkills(2) = ThiefSkills(2) + 10
1749 If DX = 18 Then ThiefSkills(1) = ThiefSkills(1) + 10 And ThiefSkills(2) = ThiefSkills(2) + 15 And ThiefSkills(3) = ThiefSkills(3) + 5 And ThiefSkills(4) = ThiefSkills(4) + 10 And ThiefSkills(5) = ThiefSkills(5) + 10

Rem MF$: Missile fire mod.
Rem DG$: Defensive adjustment for reflex saves and armor class
1760 MF$ = "Add " + LTrim$(Str$(DF)) + " TO MISSILE FIRE ROLLS 'TO HIT'"
1770 DG$ = "ADD " + LTrim$(Str$(DA)) + " TO ARMOR CLASS"
1790 CO = AbilityAssignedArray(5)
1820 Print "CHARACTER'S CONSTITUTION IS "; CO

1840 CH = AbilityAssignedArray(6)
1850 Print "CHARACTER'S CHARISMA IS "; CH

Rem CHARISMA TABLE from PHB [1, p. 13]
1860 If CH = 3 Then XF = 1
1870 If CH = 4 Then XF = 1
1880 If CH > 4 And CH < 6 Then XF = 2
1890 If CH > 6 And CH < 9 Then XF = 3
1900 If CH > 8 And CH < 12 Then XF = 4
1910 If CH > 11 And CH < 14 Then XF = 5
1920 If CH = 14 Then XF = 6
1930 If CH = 15 Then XF = 7
1940 If CH = 16 Then XF = 8
1950 If CH = 17 Then XF = 10
1960 If CH = 18 Then XF = 15
1970 Print "CAN HAVE "; XF; " RETAINERS"
1980 L = 0


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
2150 If St < 9 Then GoTo 2170
2160 If CO < 7 Then GoTo 2190
2170 GoTo 2210
2180 Print " STRENGTH TOO LOW FOR A FIGHTER": GoTo 2200
2190 Print " CONSTITUTION TOO LOW FOR A FIGHTER"
2200 Print " PLEASE SELECT AGAIN": GoTo 2000

2210 If CN = 5 Then GoTo 2230
2220 GoTo 2270
2230 If IN < 9 Then GoTo 2250
2240 If DX < 6 Then GoTo 2260
2250 Print " INTELLIGENCE TOO LOW FOR A MAGIC USER": GoTo 2200
2260 Print " DEXTERITY TOO LOW FOR A MAGIC USER": GoTo 2200

2270 If CN = 2 Then 2290
2280 GoTo 2390
2290 If St < 12 Then 2340
2300 If IN < 9 Then 2350
2310 If WI < 13 Then 2360
2320 If CO < 9 Then 2370
2330 If CH < 17 Then 2380
2340 Print " STRENGTH TOO LOW FOR A PALADIN": GoTo 2200
2350 Print " INTELLIGENCE TOO LOW FOR A PALADIN": GoTo 2200
2360 Print " WISDOM TOO LOW FOR A PALADIN": GoTo 2200
2370 Print " CONSTITUTION TOO LOW FOR A PALADIN": GoTo 2200
2380 Print " CHARISMA TOO LOW FOR A PALADIN": GoTo 2200

2390 If CN = 3 Then GoTo 2410
2400 GoTo 2480
2410 If St < 13 Then GoTo 2440
2420 If IN < 13 Then GoTo 2450
2430 If WI < 14 Then GoTo 2460
2431 If CO < 14 Then GoTo 2470
2440 Print " STRENGTH TOO LOW FOR A RANGER": GoTo 2200
2450 Print " INTELLIGENCE TOO LOW FOR A RANGER": GoTo 2200
2460 Print " WISDOM TOO LOW FOR A RANGER": GoTo 2200
2470 Print " CONSTITUTION TOO LOW FOR A RANGER": GoTo 2200

2480 If CN = 4 Then GoTo 2500
2490 GoTo 2630
2500 If St < 15 Then GoTo 2580
2510 If DX < 15 Then GoTo 2590
2520 If CO < 15 Then GoTo 2600
2530 If IN < 10 Then GoTo 2610
2540 If WI < 10 Then GoTo 2620
2580 Print " STRENGTH TOO LOW FOR A CAVALIER": GoTo 2200
2590 Print " DEXTERITY TOO LOW FOR A CAVALIER": GoTo 2200
2600 Print " CONSTITUTION TOO LOW FOR A CAVALIER": GoTo 2200
2610 Print " INTELLIGENCE TOO LOW FOR A CAVALIER": GoTo 2200
2620 Print " WISDOM TOO LOW FOR A CAVALIER": GoTo 2200

2630 If CN = 6 Then GoTo 2650
2640 GoTo 2690
2650 If IN < 15 Then 2670
2660 If DX < 16 Then 2680
2670 Print " INTELLIGENCE TOO LOW FOR AN ILLUSIONIST": GoTo 2200
2680 Print " DEXTERITY TOO LOW FOR AN ILLUSIONIST": GoTo 2200

2690 If CN = 7 Then GoTo 2710
2700 GoTo 2720
2710 If WI < 9 Then Print "WISDOM TOO LOW FOR A CLERIC": GoTo 2200

2720 If CN = 8 Then GoTo 2740
2730 GoTo 2780
2740 If WI < 12 Then GoTo 2760
2750 If CH < 15 Then GoTo 2770
2760 Print " WISDOM TOO LOW FOR A DRUID": GoTo 2200
2770 Print " CHARISMA TOO LOW FOR A DRUID": GoTo 2200

2780 If CN = 9 Then GoTo 2800
2790 GoTo 2810
2800 If DX < 9 Then Print " DEXTERITY TOO LOW FOR A THIEF": GoTo 2200

2810 If CN = 10 Then GoTo 2830
2820 GoTo 2870
2830 If IN < 11 Then GoTo 2850
2840 If DX < 12 Then GoTo 2860
2850 Print " INTELLIGENCE TOO LOW FOR AN ASSASSIN": GoTo 2200
2860 Print " DEXTERITY TOO LOW FOR AN ASSASSIN": GoTo 2200

2870 If CN = 11 Then GoTo 2890
2880 GoTo 2970
2890 If St < 15 Then GoTo 2930
2900 If WI < 15 Then GoTo 2940
2910 If DX < 15 Then GoTo 2950
2920 If CO < 11 Then GoTo 2960
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

3080 CLASS$ = CLASS$(CN)


3090 CZ$ = " CLERIC VERSUS UNDEAD TABLE (1d20)"
3100 CU$ = " SKEL ZOMB GHOU WIGT WRAI MUMM SPEC VAMP"
3110 Z1$ = " 7    9    11   --   --   --   --   --  "


3120 TY$ = " THIEF'S ABILITIES"
3130 TA$ = " PICK REMV PICK MOVE CLIM HIDE NEAR"
3140 TB$ = " LOCK TRAP PCKT SILT SURF SHDW NOIS"
3150 K1$ = " 15%  10%  20%  20%  87%  10%  1-2"


3160 RACE$(1) = "DWARVEN": RACE$(2) = "ELVEN": RACE$(3) = "GNOME"
3170 RACE$(4) = "HALF-ELVEN": RACE$(5) = "HALFLING": RACE$(6) = "HALF-ORC": RACE$(7) = "HUMAN"
3180 Print "         RACE LIST"
3190 Print " 1: DWARVEN  2: ELVEN"
3200 Print " 3: GNOME    4: HALF-ELVEN"
3210 Print " 5: HALFLING 6: HALF-ORC"
3220 Print " 7: HUMAN"
3230 Print " SELECT THE RACE YOU WISH"
3240 Print " YOUR CHARACTER TO BE AND ENTER THE"
3250 Input " NUMBER FROM THE TABLE ABOVE", RA$

3251 RA = Val(RA$)
3260 If RA < 1 Or RA > 7 Then GoTo 3180

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
3361 If CN > 3 And STR = 18 Then SF = 1 And SFF = 16 And DA = 2 And OD = 3
3370 CLASS$ = CLASS$(CN)
3371 RACE$ = RACE$(RA)

3380 Print "   SUMMARY OF CHARACTER "
3390 Print "   RACE: ", RACE$
3400 Print "   CLASS: ", CLASS$; Tab(22); "GOLD: "; GOLD



3430 Print " STRENGTH: ": Print St
3440 Print SH$
3441 Print SO$
3442 If OW > 1 Then Print SW$
3450 Print " INTELLIGENCE: ": Print IN
3460 If CN = 5 Then Print IZ$
3470 Print lang$
3480 Print " WISDOM: ": Print WI
3490 If WF = 0 Then GoTo 3510
3500 Print " ADD "; WF; " TO ROLL - MAGIC BASED SAVING THROWS"
3510 Print " CONSTITUTION ": Print CO
3520 Print " CHARISMA ": Print CH
3530 Print " MAY HAVE "; XF; " RETAINERS"


3540 If CN = 7 Then GoTo 3560
3550 GoTo 3570

3560 Print CZ$
3561 Print CU$
3562 Print Z1$

3570 If CN = 9 Then GoTo 3590
3580 GoTo 4000
3590 Print TY$
3591 Print TA$
3592 Print TK$
3593 Print K1$
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
    Dim temp As Integer

    Rem Generate six stats
    For i = 1 To 6
        stats(i) = RollStat
    Next i
    Call quicksort(stats(), 1, 6)
    Call ReverseArray(stats())
End Sub

Rem Implementation of Method II for Generation of Ability Scores from Dungeon Master's Guide [4, p. 11]
Sub GenerateSortedStatsMII (stats() As Integer)
    Rem TODO: Implement this (I am lazy, and this is unpopular)
End Sub

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

Rem [2] G. Gygax, Unearthed Arcana, 1st ed. Lake Geneva, WI: TSR, 1985.

Rem [3] Howard, "Untitled handwritten character generator," c. 1980s. Private manuscript, reproduced with indirect permission. Circa 1983-1985 (presumed).

Rem [4] G. Gygax, Advanced Dungeons & Dragons Dungeon Masters Guide, 1st ed. Lake Geneva, WI: TSR Hobbies, Inc., 1979.






