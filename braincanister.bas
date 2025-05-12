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
psiCount = 0
collisions = 0

Rem PsiCompatibility generates a number between 1 and 22 because it's fully random anyway.
Rem We expect users not to choose powers they can't take.
Rem If they do, they get a random choice, as that's fair.
Rem PSIONICS: PHB Appendix I. [1, p. 110]
Rem PC must have one or more mental stats at or above 16 to check for psionics
For I = 3 To 18
    For w = 3 To 18
        For c = 3 To 18
            For archetype = 1 To 4
                For count = 1 To 50
                    Select Case archetype
                        Case 1:
                            isCL = 1
                            isFT = 0
                            isMU = 0
                            isTF = 0
                        Case 2:
                            isCL = 0
                            isFT = 1
                            isMU = 0
                            isTF = 0
                        Case 3:
                            isCL = 0
                            isFT = 0
                            isMU = 1
                            isTF = 0
                        Case 4:
                            isCL = 0
                            isFT = 0
                            isMU = 0
                            isTF = 1

                    End Select

                    IntelligenceScore = I
                    WisdomScore = w
                    CharismaScore = c
                    If IntelligenceScore > 15 Or WisdomScore > 15 Or CharismaScore > 15 Then
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
                            psiCount = psiCount + 1
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
                            If isFT And MN = 10 Then collisions = collisions + 1: GoTo RollDiscipline
                            If isCL And (MN = 12 Or MN = 20) Then collisions = collisions + 1: GoTo RollDiscipline
                            If isMU And MN = 3 Then collisions = collisions + 1: GoTo RollDiscipline
                            If isTF And (MN = 9 Or MN = 18) Then collisions = collisions + 1: GoTo RollDiscipline
                            If MN < 23 Then DV$ = MinorDiscipline(MN)
                        End If
                    End If
                Next count
            Next archetype
        Next c
    Next w
Next I
Print psiCount
Print collisions
