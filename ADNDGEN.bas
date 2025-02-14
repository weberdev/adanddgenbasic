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
Rem 1100 If SF = 0 Then 80
Rem I don't know what this does yet. Throws an error, though.
1110 Print "ADD "; SF; " TO ROLLS TO HIT, DAMAGE, AND OPEN DOORS"
1120 Print "AND "; SFF; "% TO BEND BARS"
Rem 1130 GOTO 80
Rem line 80 isn't defined here, I'll get to it, I'm sure.
1140 IN = zz
1150 If IN < 9 Then Print "INTELLIGENCE TOO LOW FOR MAGIC USER"
1160 If IN = 9 Then Print "35% to KNOW SPELL -- MIN/MAX PER LVL 4/6"
1170 If IN > 9 And IN < 13 Then Print "45% TO KNOW SPELL -- MIN/MAX PER LVL 5/7"
1180 If IN > 12 And IN < 15 Then Print "55% TO KNOW SPELL -- MIN/MAX PER LEVEL 6/9"
1190 If IN > 14 And IN < 17 Then Print "65% TO KNOW SPELL -- MIN/MAX PER LEVEL 7/11"
2200 If IN = 17 Then Print "75% TO KNOW SPELL -- MIN/MAX PER LVL 8/14"
2210 If IN = 18 Then Print "85% TO KNOW SPELL -- MIN/MAX PER LVL 9/18"
Rem The initial code had "12$ =" instead of "Then Print"
Rem I don't know BASIC well enough to say what that means.
Rem I started learning the language today.
2220 If IN = 3 Then GoTo 2240
2230 GoTo 2250
2240 Print "DIFFICULT SPEECH - ILLITERATE"
2250 If IN > 3 And IN < 6 Then GoTo 2270
2260 GoTo 2280
2270 Print "EASY SPEECH BUT ILLITERATE"
2280 If IN > 5 And IN < 9 Then GoTo 2300
2290 GoTo 2310
2300 Print "BARELY LITERATE"
2310 If IN > 8 And IN < 13 Then GoTo 2330
2320 GoTo 2340
2330 Print "LITERATE IN NATIVE TONGUE"
2340 GOTO 2360

