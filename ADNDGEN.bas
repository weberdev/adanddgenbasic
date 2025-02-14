Rem I don't know what zz means, it could be 22, but I doubt that.
Rem Upon looking at the original AD&D Player's Handbook (effort applied)
Rem I saw that the method of generating ability scores is the purview of the
Rem referee, and is not actually in the original PHB.
Rem Thus, at the very first line, I have taken a liberty with the code.
Rem Mea maxima culpa.

106 d6 = Int(Rnd * 6 + 1)
Rem 306 zz = d6 + d6 + d6
Rem the above option is 3d6 straight down the line, as Crom intended.
406 zz = (die1 = d6) + (die2 = d6) + (die3 = d6) + (die4 = d6) - MIN(die1, die2, die3, die4)
Rem the above option is 4d6 drop lowest. Values are not assigned by the player.
999 PER = 0
Rem I'm guessing that this will fail if I don't have this value.
Rem Taking more liberties with the code.
1000 ST = zz
1001 If ST = 18 Then PER = Int((Rnd(1) * 100) + 1)
1010 If ST = 3 Then SF = -3 And SFF = 0
1020 If ST > 3 And ST < 6 Then SF = -2 And SFF = 0
1030 If ST > 5 And ST < 8 Then SF = -1 And SFF = 0
1040 If ST > 7 And ST < 17 Then SF = 0
1041 If ST > 7 And ST < 10 Then SFF = 1
1042 If ST > 9 And ST < 12 Then SFF = 2
1043 If ST > 11 And ST < 14 Then SFF = 4
1044 If ST > 13 And ST < 16 Then SFF = 7
1045 If ST = 16 Then SFF = 10
1050 If ST = 17 Then SF = 1 And SFF = 13
1070 If PER > 0 And PER < 51 Then SF = 1 And SFF = 20
1080 If PER > 50 And PER < 100 Then SF = 2
1081 If PER > 50 And PER < 76 Then SFF = 25
1082 If PER > 75 And PER < 91 Then SFF = 30
1083 If PER > 90 And PER < 100 Then SFF = 35
1090 If PER = 100 Then SF = 3 And SFF = 40
1091 Print "CHARACTER'S STRENGTH IS "; ST; PER

Rem 1100 If SF = 0 Then 80
Rem I don't know what this does yet. Throws an error, though.

1110 Print "ADD "; SF; " TO ROLLS TO HIT, DAMAGE, AND OPEN DOORS"
1120 Print "AND "; SFF; "% TO BEND BARS"
Rem 1130 GOTO 80
Rem line 80 isn't defined here, I'll get to it, I'm sure.


1140 IN = zz
1141 Print "CHARACTER'S INT IS "; IN
1150 If IN < 9 Then SP$ = "INTELLIGENCE TOO LOW FOR MAGIC USER"
1160 If IN = 9 Then SP$ = "35% to KNOW SPELL -- MIN/MAX PER LVL 4/6"
1170 If IN > 9 And IN < 13 Then SP$ = "45% TO KNOW SPELL -- MIN/MAX PER LVL 5/7"
1180 If IN > 12 And IN < 15 Then SP$ = "55% TO KNOW SPELL -- MIN/MAX PER LEVEL 6/9"
1190 If IN > 14 And IN < 17 Then SP$ = "65% TO KNOW SPELL -- MIN/MAX PER LEVEL 7/11"
1200 If IN = 17 Then SP$ = "75% TO KNOW SPELL -- MIN/MAX PER LVL 8/14"
1210 If IN = 18 Then SP$ = "85% TO KNOW SPELL -- MIN/MAX PER LVL 9/18"

Rem The initial code had "12$ =" instead of "Then Print"
Rem That comment no longer makes sense as SP$ has replaced THEN PRINT which replaced 12$
Rem I don't know BASIC well enough to say what that means.
Rem I started learning the language today.
Rem On further reflection, strings in this basic dialect seem to need to end with a $.
Rem Perhaps the prior dialect allowed such formatting?
Rem Mine does not.

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
1400 GoTo 1420
1410 lang$ = "LITERATE AND FLUENT IN 4 LANGUAGES"
1420 Print lang$
1430 Print SP$
Rem 1440 goto 80
Rem line 80 is still a mystery.
Rem we'll get there.

1450 WI = zz
1460 B = IN / WI
Rem 1470 If B < .67 Or B > 1.5 Then GoTo 100
Rem I don't know what this Intelligence divided by wisdom value is about.
1480 Print "Character's wisdom is "; WI
1490 If WI = 3 Then WF = -3
1500 If WI = 4 Then WF = -2
1510 If WI > 4 And WI < 8 Then WF = -1
1520 If WI > 7 And WI < 15 Then WF = 0
1530 If WI = 15 Then WF = 1
1540 If WI = 16 Then WF = 2
1550 If WI = 17 Then WF = 3
1560 If WI = 18 Then WF = 4
1570 Print "ADD "; WF; " TO ROLL MAGIC BASED SAVING THROW"
Rem 2580 GOTO 80
Rem very excited for the mystical line 80

1585 DX = zz
1590 Print "CHARACTER'S DEXTERITY IS "; DX;
1600 DX = KC: KC = 0
1610 If DX = 3 Then DF = -3
1620 If DX = 4 Then DF = -2
1630 If DX = 5 Then DF = -1
1640 If DX > 5 And DX < 16 Then DF = 0
1650 If DX = 16 Then DF = 1
1670 If DX = 17 Then DF = 2
1680 If DX = 18 Then DF = 3
1690 If DF = -3 Then GoSub 3600
1700 If DF = -2 Then GoSub 3620

