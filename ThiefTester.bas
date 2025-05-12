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
For DexterityScore = 9 To 18
    For I = 1 To 8
        Read ThiefSkills(I)
    Next I

    For RA = 1 To 6

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
    Next RA
Next DexterityScore


