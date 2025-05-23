Rem Dungeon Master's Personnel Service, by Joseph C. Spann
Rem Originally published in Dragon Magazine 74  (June 1983)
Rem Updated and restored by Ian Weber
Rem This is a digitization of a program in a magazine. I previously updated and rewrote a hand transcription of this project, not knowing the manuscript was itself a transcription.
Rem Is this how medieval monks felt when transcribing archives?
1000 Rem *************************************************************
1010 Rem * *
1020 Rem * DUNGEON MASTER'S PERSONNEL SERVICE *
1030 Rem * ( 40 COLUMN BY 16 LINE CRT DISPLAY ONLY ) *
1040 Rem * SAVE AS "D&DCRT.BAS" - VERSION 1.2 *
1050 Rem * *
1060 Rem ***********************************************************
1070 Rem * GENERATES PLAYER CHARACTERISTIC FOR FANTASY *
1080 Rem * ROLE - PLAYING GAME "DUNGEONS & DRAGONS" Tm *
1090 Rem ***********************************************************
1100 Rem * WRITTEN BY: JOSEPH C. SPANN - MONROE, LA. *
1110 Rem * "DUNGEON MASTER'S PERSONNEL SERVICE"-ver 1.2(C)LAIRTECH *
1120 Rem * "DUNGEONS & DRAGONS" Tm BY TSR HOBBIES INC. *
1130 Rem ***********************************************************
1140 Dim PS(7)
1150 Randomize
1160 Print Chr$(12)
1170 Print
1180 Print " DM'S PERSONNEL SERVICE"
1190 Print "-----------------------------------------"
1200 Print
1210 Print " PRODUCES CHAR. ABILITY SCORES"
1220 Print
1230 Print " FOR"
1240 Print
1250 Print " DUNGEONS & DRAGONS Tm"
1260 Print
1280 Print " IF YOU ARE READY FOR THE 1ST"
1290 Print " CHARACTER, ENTER A ONE (1)."
1300 Input C
1310 On C GOTO 1320
1320 Print Chr$(12)
1330 Rem***************************
1340 Rem BEGIN 3D6 ROLLS FOR ABILITIES
1350 Rem***************************
1360 L = L + 1
1370 Z = Int((Rnd(1) * 6) + 1)
1380 Z2 = Int((Rnd(1) * 6) + 1)
1390 Z3 = Int((Rnd(1) * 6) + 1)
1400 ZZ = Z + Z2 + Z3
1410 If L = 1 Then 1530
1420 If L = 2 Then 1680
1430 If L = 3 Then 1760
1440 If L = 4 Then 2120
1450 If L = 5 Then 2340
1460 If L = 6 Then 2510
1500 Rem***************************
1510 Rem CALCULATIONS FOR STRENGTH
1520 Rem***************************
1530 Print "CHARACTER'S STRENGTH IS "; ZZ
1540 ST = ZZ
1550 If ST = 3 Then SF = -3
1560 If ST > 3 And ST < 6 Then SF = -2
1570 If ST > 5 And ST < 9 Then SF = -1
1580 If ST > 8 And ST < 13 Then SF = 0
1590 If ST > 12 And ST < 16 Then SF = 1
1600 If ST > 15 And ST < 18 Then SF = 2
1610 If ST = 18 Then SF = 3
1620 If SF = 0 Then 1360
1630 Print "*ADD"; SF; "TO ROLLS TO HIT,DAMAGE,OPEN DOORS"
1640 GoTo 1360
1650 Rem***************************
1660 Rem CALCULATIONS FOR CONSTITUTION
1670 Rem***************************
1680 CO = ZZ
1690 A = ST / CO
1700 If A < .67 Or A > 1.5 Then 1370
1710 Print "CONSTITUTION SCORE IS "; ZZ
1720 GoTo 1360
1730 Rem***************************
1740 Rem CALCULATIONS FOR INTELLIGENCE
1750 Rem***************************
1760 Print "CHARACTER'S INTELLIGENCE"; ZZ
1770 IN = ZZ
1780 If IN < 9 Then IZ$ = "*INTELLIGENCE TOO LOW FOR MAGIC USER."
1790 If IN = 9 Then IZ$ = "*35% TO KNOW SPELL-MIN/MAX PER LVL:4/6"
1800 If IN > 9 And IN < 13 Then IZ$ = "*45% TO KNOW SPELL-MIN/MAX PER LVL:5/7"
1810 If IN > 12 And IN < 15 Then IZ$ = "*55% TO KNOW SPELL-MIN/MAX PER LVL:6/9"
1820 If IN > 14 And IN < 17 Then IZ$ = "*65% TO KNOW SPELL-MIN/MAX PER LVL:7/11"
1830 If IN = 17 Then IZ$ = "*75% TO KNOW SPELL-MIN/MAX PER LVL:8/14"
1840 If IN = 18 Then IZ$ = "*85% TO KNOW SPELL - MIN/MAX PER LVL:9/18"
1850 If IN = 3 Then 1870
1860 GoTo 1880
1870 I$ = "* DIFFICULT SPEECH-ILLITERATE"
1880 If IN > 3 And IN < 6 Then 1900
1890 GoTo 1910
1900 I$ = "* EASY SPEECH BUT ILLITERATE"
1910 If IN > 5 And IN < 9 Then 1930
1920 GoTo 1940
1930 I$ = "* BARELY LITERATE."
1940 If IN > 8 And IN < 13 Then 1960
1950 GoTo 1970
1960 I$ = "* LITERATE IN NATIVE TONGUE."
1970 If IN > 12 And IN < 16 Then 1990
1980 GoTo 2000
1990 I$ = "* LITERATE AND FLUENT 2 LANGUAGES"
2000 If IN > 15 And IN < 18 Then 2020
2010 GoTo 2030
2020 I$ = "* LITERATE AND FLUENT 3 LANGUAGES"
2030 If IN = 18 Then 2050
2040 GoTo 2060
2050 I$ = "* LITERATE AND FLUENT 4 LANGUAGES"
2060 Print I$
2070 Print IZ$
2080 GoTo 1360
2090 Rem***************************
2100 Rem CALCULATIONS FOR DEXTERITY
2110 Rem***************************
2120 Print "CHARACTER'S DEXTERITY IS "; ZZ
2130 DX = ZZ
2140 If DX = 3 Then DF = -3
2150 If DX > 3 And DX < 6 Then DF = -2
2160 If DX > 5 And DX < 9 Then DF = -1
2170 If DX > 8 And DX < 13 Then DF = 0
2180 If DX > 12 And DX < 16 Then DF = 1
2190 If DX > 15 And DX < 18 Then DF = 2
2200 If DX = 18 Then DF = 3
2210 If DF = -3 Then GoSub 5320
2220 If DF = -2 Then GoSub 5340
2230 If DF = -1 Then GoSub 5360
2240 If DF = 1 Then GoSub 5380
2250 If DF = 2 Then GoSub 5400
2260 If DF = 3 Then GoSub 5420
2270 If DF = 0 Then GoTo 1360
2280 Print "*ADD "; DF; "TO MISSILE FIRE ROLLS 'TO HIT'"
2290 Print "* "; X1$; X2$; X3$; " ARMOR CLASS."
2300 GoTo 1360
2310 Rem***************************
2320 Rem CALCULATIONS FOR WISDOM
2330 Rem***************************
2340 WI = ZZ
2350 B = IN / WI
2360 If B < .67 Or B > 1.5 Then 1370
2370 Print "CHARACTER'S WISDOM IS "; WI
2380 If WI = 3 Then WF = -3
2390 If WI > 3 And WI < 6 Then WF = -2
2400 If WI > 5 And WI < 9 Then WF = -1
2410 If WI > 8 And WI < 13 Then WF = 0
2420 If WI > 12 And WI < 16 Then WF = 1
2430 If WI > 15 And WI < 18 Then WF = 2
2440 If WI = 18 Then WF = 3
2450 If WF = 0 Then 1360
2460 Print "*ADD"; WF; "TO ROLL-MAGIC BASED SAVING THROW"
2470 GoTo 1360
2480 Rem***************************
2490 Rem CALCULATIONS FOR CHARISMA
2500 Rem***************************
2510 Print "CHARACTER'S CHARISMA IS "; ZZ
2520 Let CH = ZZ
2530 If CH = 3 Then XF = 1
2540 If CH > 3 And CH < 6 Then XF = 2
2550 If CH > 5 And CH < 9 Then XF = 3
2560 If CH > 8 And CH < 13 Then XF = 4
2570 If CH > 12 And CH < 16 Then XF = 5
2580 If CH > 15 And CH < 18 Then XF = 6
2590 If CH = 18 Then XF = 7
2600 Print "*CAN HAVE "; XF; " RETAINERS WITH MORALE OF"; XF; ""
2610 L = 0
2620 Rem***************************
2630 Rem RACE/CLASS SELECTION & CHECKING
2640 Rem***************************
2650 Print " IF YOU HAVE THIS DATA AND ARE READY TO"
2660 Print " PROCEED, ENTER A ONE (1)."
2670 Input VG
2680 On VG GOTO 2690
2690 Print Chr$(12): Print
2700 Print " CLASS/RACE LIST"
2710 Print "-----------------------------------------"
2720 Print " (1) FIGHTER (4) HALFLING"
2730 Print " (2) MAGIC USER (5) ELF"
2740 Print " (3) CLERIC (6) DWARF"
2750 Print " (7) THIEF"
2760 Print
2770 Print "SELECT THE RACE/CLASS THAT YOU WISH"
2780 Print "YOUR CHARACTER TO HAVE AND ENTER THE"
2790 Input "NUMBER FROM THE TABLE ABOVE"; CN
2800 If CN = 4 Then 2820
2810 GoTo 2870
2820 If DX < 9 Or CD < 9 Then 2840
2830 GoTo 2870
2840 Print " DEXTERITY AND/OR CONSTITUTION"
2850 Print " TOO LOW FOR HALFLING"
2860 GoTo 2770
2870 If CN = 5 And IN < 9 Then 2890
2880 GoTo 2900
2890 Print "INTELLIGENCE TOO LOW FOR ELF.": GoTo 2770
2900 If CN = 6 And CO < 9 Then 2920
2910 GoTo 2960
2920 Print "CONSTITUTION TOO LOW FOR DWARF.": GoTo 2770
2930 Rem***************************
2940 Rem HIT DICE ASSIGNED BY RACE/CLASS
2950 Rem***************************
2960 If CN = 1 Then HF = 8
2970 If CN = 2 Then HF = 4
2980 If CN = 3 Then HF = 6
2990 If CN = 4 Then HF = 6
3000 If CN = 5 Then HF = 6
3010 If CN = 6 Then HF = 8
3020 If CN = 7 Then HF = 4
3030 If CN = 0 Then 1160
3040 Print
3050 Rem***************************
3060 Rem CHARACTER LEVEL ASSIGNED AND
3070 Rem HIT POINTS CALCULATED
3080 Rem***************************
3090 Print "CHARACTER LEVEL RANGE..ONE(1) TO FIVE(5)"
3100 Print
3110 Input "AT WHICH LEVEL WILL CHARACTER START"; LL
3120 If LL > 5 Then Print "NUMBER TOO LARGE: RE-ENTER": GoTo 3110
3130 Print Chr$(12)
3140 Print
3150 Print "YOUR CHARACTER HAS "; LL; " HIT DICE"
3160 Print
3170 If CO = 3 Then PF = (-3 * LL)
3180 If CO > 3 And CO < 6 Then PF = (-2 * LL)
3190 If CO > 5 And CO < 9 Then PF = (-1 * LL)
3200 If CO > 8 And CO < 13 Then PF = 0
3210 If CO > 12 And CO < 16 Then PF = LL
3220 If CO > 15 And CO < 18 Then PF = (2 * LL)
3230 If CO = 18 Then PF = (3 * LL)
3240 GoSub 4330
3250 Rem***************************
3260 Rem CLERIC SKILLS ASSIGNED BY LEVEL
3270 Rem***************************
3280 If CN = 3 Then 3300
3290 GoTo 3500
3300 If CN = 3 Then 3320
3310 GoTo 3500
3320 CZ$ = " CLERIC VS. UNDEAD TABLE (1D20)"
3330 CU$ = "SKEL ZOMB GHOU WIGT WRAI MUMM SPEC VAMP"
3340 Print CZ$
3350 Print
3360 Print CU$
3370 Z1$ = " 7 9 11 -- -- -- -- --"
3380 Z2$ = " T 7 9 11 -- -- -- --"
3390 Z3$ = " T T 7 9 11 -- -- --"
3400 Z4$ = " D T T 7 9 11 -- --"
3410 Z5$ = " D D T T 7 9 11 --"
3420 If CN = 3 And LL = 1 Then Print Z1$
3430 If CN = 3 And LL = 2 Then Print Z2$
3440 If CN = 3 And LL = 3 Then Print Z3$
3450 If CN = 3 And LL = 4 Then Print Z4$
3460 If CN = 3 And LL = 5 Then Print Z5$
3470 Rem***************************
3480 Rem THIEF'S SKILLS ASSIGNED BY LEVEL
3490 Rem***************************
3500 If CN = 7 Then 3520
3510 GoTo 3720
3520 TY$ = " THIEVE'S ABILITIES"
3530 TA$ = "PICK REMV PICK MOVE CLIM HIDE HEAR"
3540 TB$ = "LOCK TRAP PCKT SILT SURF SHDW NOIS"
3550 Print TY$
3560 Print TA$
3570 Print TB$
3580 K1$ = " 15% 10% 20% 20% 87% 10% 1-2"
3590 K2$ = " 20% 15% 25% 25% 88% 15% 1-2"
3600 K3$ = " 25% 20% 30% 30% 89% 20% 1-3"
3610 K4$ = " 30% 25% 35% 35% 90% 25% 1-3"
3620 K5$ = " 35% 30% 40% 40% 91% 30% 1-3"
3630 If LL = 1 Then Print K1$
3640 If LL = 2 Then Print K2$
3650 If LL = 3 Then Print K3$
3660 If LL = 4 Then Print K4$
3670 If LL = 5 Then Print K5$
3680 Rem***************************
3690 Rem CHARACTER COUNT DISPLAYED AND
3700 Rem DECISION TO USE IS MADE.
3710 Rem***************************
3720 CC = CC + 1
3730 Print
3740 Print " THIS IS CHARACTER #["; CC; "]"
3750 Print
3760 Input "DO YOU WANT THIS CHARACTER(Y/N)"; D$
3770 If D$ = "N" Then 1320
3780 If D$ = "Y" Then 3790
3790 CC = 0
3800 Rem***************************
3810 Rem OTHER CHARACTER DATA IS INPUT
3820 Rem***************************
3830 Print Chr$(12)
3840 Print: Print: Print
3850 Input "WHAT IS CHARACTER'S NAME"; NA$
3860 Print
3870 Input "WHAT IS CHARACTER'S RACE"; RA$
3880 Print
3890 Input "WHAT IS CHARACTER'S GENDER"; SE$
3900 Print
3910 Input "WHAT IS CHARACTER'S CLASS"; CL$
3920 Print Chr$(12)
3930 Rem***************************
3940 Rem CHARACTER'S GOLD CALCULATED
3950 Rem***************************
3960 Print: Print
3970 Let M1 = Int((Rnd(1) * 6) + 1)
3980 Let M2 = Int((Rnd(1) * 6) + 1)
3990 Let M3 = Int((Rnd(1) * 6) + 1)
4000 Let MT = M1 + M2 + M3
4010 Let GC = (10 * MT)
4020 Rem***************************
4030 Rem SEPARATION BY RACE/CLASS FOR
4040 Rem FINAL DATA CALCULATIONS.
4050 Rem***************************
4060 If CN = 1 Then GoSub 5470
4070 If CN = 2 Then GoSub 6130
4080 If CN = 3 Then GoSub 5580
4090 If CN = 4 Then GoSub 5690
4100 If CN = 5 Then GoSub 5800
4110 If CN = 6 Then GoSub 5910
4128 If CN = 7 Then GoSub 6020
4130 GoSub 4510
4140 Print
4150 Rem********************************
4160 Rem 'END' OR 'CONTINUE' AND CLOSE
4170 Rem***************************
4180 Input "ANOTHER CHARACTER (Y/N)"; GB$
4190 If GB$ = "Y" Then 1320
4200 Print Chr$(12)
4210 Print: Print: Print: Print: Print
4228 Print " THANKS FOR USING ME!"
4230 Print
4240 Print "IF YOU CHANGE YOUR MIND AND"
4250 Print "WANT ANOTHER CHARACTER,JUST"
4260 Print "ENTER THE WORD 'RUN' - BYE."
4270 Clear
4280 End
4290 Print
4300 Rem***************************
4310 Rem SUBROUTINE TO CALCULATE HIT PTS
4320 Rem***************************
4330 Y = Y + 1
4340 PS = Int((Rnd(1) * HF) + 1)
4350 PS(Y) = PS
4360 If Y <> LL Then 4330
4370 For Y = 0 To LL - 1
    4380 PS = PS + PS(Y)
4390 Next Y
4400 PT = PS + PF
4410 If PT <= 0 Then 4430
4420 GoTo 4440
4430 PT = LL
4440 Print "YOUR CHARACTER WOULD HAVE"; PT; "HIT POINTS!"
4450 Print
4460 Y = 0
4470 Return
4480 Rem***************************
4490 Rem RECAP DISPLAY BEGINS
4500 Rem***************************
4510 Print Chr$(12)
4520 Print
4530 Print " RECAP OF CHARACTER ABILITIES"
4540 Print
4550 Print "NAME...."; NA$
4560 Print "RACE...."; RA$; Tab(22); " HIT DICE: "; LL
4570 Print "GENDER.."; SE$
4580 Print "CLASS..."; CL$; Tab(22); " HIT POINTS: *;PT"
4590 Print "LEVEL..."; LL
4600 Print
4610 Print "N O T E !! COPY THIS AND THE INFORMATION"
4620 Print " THAT FOLLOWS TO THE CHARACTER"
4630 Print " RECORD SHEET. IT WILL NOT BE"
4640 Print " AVAILABLE AGAIN!"
4650 Print
4660 Input " TO CONTINUE,ENTER A ONE(1)"; KK
4670 On KK GOTO 4680
4680 Print Chr$(12)
4690 Print NA$; "'S STRENGTH IS.. . . . ."; ST
4700 If SF = 0 Then 4720
4710 Print "*ADD"; SF; "TO ROLL TO:'HIT,DAMAGE,OPEN DOORS"
4720 Print NA$; "'S CONSTITUTION IS.."; CO
4730 Print NA$; "'S INTELLIGENCE IS.."; IN
4740 If CN = 2 Then Print IZ$
4750 Print I$
4760 Print NA$; "'S DEXTERITY IS...."; DX
4770 If DF = 0 Then 4800
4780 Print "*ADD"; DF; "TO MISSILE FIRE ROLLS 'TO HIT'"
4790 Print "*"; X1$; X2$; X3$; " ARMOR CLASS."
4800 Print NA$; "'S WISDOM IS......."; WI
4810 If WF = 0 Then 4830
4820 Print "*ADD*"; WF; "TO ROLL-MAGIC BASED SAVING THROWS"
4830 Print NA$; "'S CHARISMA IS......"; CH
4840 Print "*CHAR MAY HAVE"; XF; "RETAINERS - MORALE OF"; XF
4850 If CN = 3 Then 4900
4860 GoTo 4960
4870 Rem***************************
4880 Rem DISPLAYS CLERIC'S SKILLS
4890 Rem***************************
4900 Print CZ$: Print CU$
4910 If CN = 3 And LL = 1 Then Print Z1$
4920 If CN = 3 And LL = 2 Then Print Z2$
4930 If CN = 3 And LL = 3 Then Print Z3$
4940 If CN = 3 And LL = 4 Then Print Z4$
4950 If CN = 3 And LL = 5 Then Print Z5$
4960 If CN = 7 Then 5010
4970 GoTo 5070
4980 Rem***************************
4990 Rem DISPLAYS THIEF'S SKILLS
5000 Rem***************************
5010 Print TY$: Print TA$: Print TB$
5020 If CN = 7 And LL = 1 Then Print K1$
5030 If CN = 7 And LL = 2 Then Print K2$
5040 If CN = 7 And LL = 3 Then Print K3$
5050 If CN = 7 And LL = 4 Then Print K4$
5060 If CN = 7 And LL = 5 Then Print K5$
5070 Input " TO CONTINUE,ENTER A ONE(1)"; PK
5080 On PK GOTO 5120
5090 Rem***************************
5100 Rem DISPLAYS SAVING THROW TABLE
5110 Rem***************************
5120 Print Chr$(12): Print
5130 Print " SAVING THROW TABLE"
5140 Print "DEATH : :PARALYSIS: : RODS"
5150 Print "RAY OR:MAGIC: OR TURN :DRAGON:STAVES"
5160 Print "POISON:WANDS:TO STONE :BREATH:OR SPELLS"
5170 Print "------:-----:---------:--------:---------"
5180 Print ST$
5190 Print P1$
5200 Print P2$
5210 Print P3$
5220 Print P4$
5230 Print P5$
5240 Rem***************************
5250 Rem DISPLAYS PLAYER'S GOLD SUPPLY
5260 Rem***************************
5270 Print "THIS CHARACTER HAS["; GC; "] GOLD PIECES."
5280 Return
5290 Rem***************************
5300 Rem DISPLAYS WISDOM ADJUSTMENTS
5310 Rem***************************
5320 X1$ = "ADD ": X2$ = "3": X3$ = " TO"
5330 Return
5340 X1$ = "ADD ": X2$ = "2": X3$ = " TO"
5350 Return
5360 X1$ = "ADD ": X2$ = " 1 ": X3$ = " TO"
5370 Return
5380 X1$ = "SUBTRACT ": X2$ = "1": X3$ = " FROM"
5390 Return
5400 X1$ = "SUBTRACT ": X2$ = "2": X3$ = " FROM"
5410 Return
5420 X1$ = "SUBTRACT ": X2$ = "3": X3$ = " FROM"
5430 Return
5440 Rem***************************
5450 Rem SAVING THROW & MISC.-FIGHTER
5460 Rem***************************
5470 If LL < 4 Then ST$ = "..12....13......14.......15......16"
5480 If LL > 3 And LL < 6 Then ST$ = "...10....11......12.......13......14."
5490 P1$ = "MAY WEAR ANY ARMOR AND USE SHIELD."
5500 P2$ = "MAY USE ANY WEAPON."
5510 P3$ = " "
5520 P4$ = "NO SPELLS, BUT MAY USE MAGIC ARTICLE."
5530 P5$ = " "
5540 Return
5550 Rem***************************
5560 Rem SAVING THROW & MISC.-CLERIC
5570 Rem********************************
5580 If LL < 5 Then ST$ = "..11....12......14.......16......15"
5590 If LL = 5 Then ST$ = "...9....10......12.......14......12"
5600 P1$ = "MAY NOT USE EDGED WEAPONS."
5610 P2$ = "MAY WEAR ANY ARMOR AND USE SHIELD. "
5620 P3$ = "MAY USE SLING "
5630 P4$ = "HAS ABILITY TO 'TURN' UNDEAD.'"
5640 P5$ = "USES CLERICAL SPELLS ONLY. "
5650 Return
5660 Rem***************************
5670 Rem SAVING THROW & MISC.- HALFLING
5680 Rem***************************
5690 If LL < 4 Then ST$ = "...8.....9......10.......13......12"
5700 If LL > 3 And LL < 6 Then ST$ = "...6.....7.......8.......10......10"
5710 P1$ = "CANNOT USE LONGBOW OR 2 HANDED SWORD."
5720 P2$ = "ADJUST MISSILE ATTACK 'TO HIT' BY +1."
5730 P3$ = "ADJ AC BY -1 VS. MORE THAN MAN-SIZE OPP."
5740 P4$ = "ONLY 10% CHANCE OF DETECTION IN WOODS."
5750 P5$ = "REMAINS UNSEEN IN DUNGEON ON 1-2 (1D6)"
5760 Return
5770 Rem***************************
5780 Rem SAVING THROW & MISC. - ELF
5790 Rem***************************
5800 If LL < 4 Then ST$ = "..12....13......13.......15......15"
5810 If LL > 3 And LL < 6 Then ST$ = "..18....11......11.......13......12"
5820 P1$ = "HAS 60' INFRA-VISION."
5830 P2$ = "DETECTS OR SECRET DOORS ON 1-2(1D6)."
5840 P3$ = "IMMUNE TO PARALYSIS FROM GHOUL ATTACK."
5850 P4$ = "SPEAKS ELVISH,ORC,HOB-GOBLIN,AND GNOLL."
5860 P5$ = "MAY USE SPELLS AND MAGIC ARTICLES."
5870 Return
5880 Rem***************************
5890 Rem SAVING THROW & MISC. - DWARF
5900 Rem***************************
5910 If LL < 4 Then ST$ = "...8.....9......10.......13......12"
5920 If LL > 3 And LL < 6 Then ST$ = "...6.....7.......8.......10. . . ...10"
5930 P1$ = "HAS 60' INFRA-VISION."
5940 P2$ = "DET'S TRAPS,DUNGEON ANOMALIES,@ 1-2(1D6)"
5950 P3$ = "SPEAKS DWARVISH,GNOME,KOBOLD,AND GOBLIN."
5960 P4$ = "MAY NOT USE A LONGBOW OR 2-HANDED SWORD."
5970 P5$ = " "
5980 Return
5990 Rem***************************
6000 Rem SAVING THROW & MISC. - THIEF
6010 Rem***************************
6020 If LL < 5 Then ST$ = "...13....14......13.......16......15"
6030 If LL = 5 Then ST$ = "..12....13......11.......14......13"
6040 P1$ = "LEATHER ARMOUR ONLY-NO SHIELD"
6050 P2$ = "BACKSTABBING ADDS +4 TO 'TO HIT' ROLL"
6060 P3$ = "BACKSTABBING DOES TWICE NORMAL DAMAGE"
6070 P4$ = "SEE TABLE FOR OTHER SKILLS."
6080 P5$ = " "
6090 Return
6100 Rem***************************
6110 Rem SAVING THROW & MISC.-MAGIC USER
6120 Rem***************************
6130 ST$ = " 13 14 13 16 15"
6140 P1$ = "MAY NOT USE A SHIELD OR WEAR ARMOR."
6150 P2$ = "MAY USE ONLY A DAGGER AS A WEAPON."
6160 P3$ = "CHECK INTELLIGENCE FOR ABILITY TO"
6170 P4$ = "LEARN SPELLS AND # OF SPELLS/LEVEL"
6180 P5$ = " "
6190 Return


