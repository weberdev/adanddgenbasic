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
2200 If IN = 17 Then SP$ = "75% TO KNOW SPELL -- MIN/MAX PER LVL 8/14"
2210 If IN = 18 Then SP$ = "85% TO KNOW SPELL -- MIN/MAX PER LVL 9/18"

Rem The initial code had "12$ =" instead of "Then Print"
Rem That comment no longer makes sense as SP$ has replaced THEN PRINT which replaced 12$
Rem I don't know BASIC well enough to say what that means.
Rem I started learning the language today.
Rem On further reflection, strings in this basic dialect seem to need to end with a $.
Rem Perhaps the prior dialect allowed such formatting?
Rem Mine does not.

2220 If IN = 3 Then GoTo 2240
2230 GoTo 2250
2240 lang$ = "DIFFICULT SPEECH - ILLITERATE"
2250 If IN > 3 And IN < 6 Then GoTo 2270
2260 GoTo 2280
2270 lang$ = "EASY SPEECH BUT ILLITERATE"
2280 If IN > 5 And IN < 9 Then GoTo 2300
2290 GoTo 2310
2300 lang$ = "BARELY LITERATE"
2310 If IN > 8 And IN < 13 Then GoTo 2330
2320 GoTo 2340
2330 lang$ = "LITERATE IN NATIVE TONGUE"
2340 GoTo 2360
2350 lang$ = "LITERATE AND FLUENT IN TWO LANGUAGES"
2360 If IN > 15 And IN < 18 Then GoTo 2380
2370 GoTo 2390
2380 lang$ = "LITERATE AND FLUENT IN 3 LANGUAGES"
2390 If IN = 18 Then GoTo 2410
2400 GoTo 2420
2410 lang$ = "LITERATE AND FLUENT IN 4 LANGUAGES"
2420 Print lang$
2430 Print SP$
Rem 2440 goto 80
Rem line 80 is still a mystery.
Rem we'll get there.

2450 WI = zz
2460 B = IN / WI
Rem 2470 If B < .67 Or B > 1.5 Then GoTo 100
Rem I don't know what this Intelligence divided by wisdom value is about.
2480 Print "Character's wisdom is "; WI
2490 If WI = 3 Then WF = -3
2500 If WI = 4 Then WF = -2
2510 If WI > 4 And WI < 8 Then WF = -1
2520 If WI > 7 And WI < 15 Then WF = 0
2530 If WI = 15 Then WF = 1
2540 If WI = 16 Then WF = 2
2550 If WI = 17 Then WF = 3
2560 If WI = 18 Then WF = 4
2570 Print "ADD "; WF; " TO ROLL MAGIC BASED SAVING THROW"
Rem 2580 GOTO 80
Rem very excited for the mystical line 80

2585 DX = zz
2590 Print "CHARACTER'S DEXTERITY IS "; DX;
2600 DX
