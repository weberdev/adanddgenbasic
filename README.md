..%%%%...%%%%%...%%..%%...%%%%...%%..%%...%%%%...%%%%%%..%%%%%...........%%%%%...%%..%%..%%..%%...%%%%...%%%%%%...%%%%...%%..%%...%%%%............%%%%...%%..%%..%%%%%...........%%%%%...%%%%%....%%%%....%%%%....%%%%...%%..%%...%%%%..
.%%..%%..%%..%%..%%..%%..%%..%%..%%%.%%..%%..%%..%%......%%..%%..........%%..%%..%%..%%..%%%.%%..%%......%%......%%..%%..%%%.%%..%%..............%%..%%..%%%.%%..%%..%%..........%%..%%..%%..%%..%%..%%..%%......%%..%%..%%%.%%..%%.....
.%%%%%%..%%..%%..%%..%%..%%%%%%..%%.%%%..%%......%%%%....%%..%%..........%%..%%..%%..%%..%%.%%%..%%.%%%..%%%%....%%..%%..%%.%%%...%%%%...........%%%%%%..%%.%%%..%%..%%..........%%..%%..%%%%%...%%%%%%..%%.%%%..%%..%%..%%.%%%...%%%%..
.%%..%%..%%..%%...%%%%...%%..%%..%%..%%..%%..%%..%%......%%..%%..........%%..%%..%%..%%..%%..%%..%%..%%..%%......%%..%%..%%..%%......%%..........%%..%%..%%..%%..%%..%%..........%%..%%..%%..%%..%%..%%..%%..%%..%%..%%..%%..%%......%%.
.%%..%%..%%%%%.....%%....%%..%%..%%..%%...%%%%...%%%%%%..%%%%%...........%%%%%....%%%%...%%..%%...%%%%...%%%%%%...%%%%...%%..%%...%%%%...........%%..%%..%%..%%..%%%%%...........%%%%%...%%..%%..%%..%%...%%%%....%%%%...%%..%%...%%%%..
........................................................................................................................................................................................................................................                             

Once you drag out the ASCII art, you've hit 1.0. Can you imagine that people used to do that by hand? 

You know what else people did by hand? AD&D. This game came out years before I was born- I grew up with 3.5. Some time ago, at a party, I was shown some handwritten code for an AD&D character creator circa 1984 (not that kind of 1984). I photographed it, and convinced myself it wouldn't be a massive task to update it to modern BASIC and maybe I could post it on my Github. Weeks passed. I did not write code. I started writing a transcription of the code, not knowing where I was going: I'd never used BASIC before this project, and honestly? Probably won't do so for anything other than restoration projects. Anyway, life caught up to me and more weeks passed, before the screaming void of my empty Github commits caught up to me. It was time to finish. That was three weeks ago.

I think I'm done now. Every table is cited in IEEE style, and I found it therapeutic to give commentary on the text, BASIC, and my experience writing the code. 

It's not unlikely I made mistakes and I haven't tested every edge case, so please let me know if something's wrong.

Likely Questions:

Why did you do this, Ian?

I like D&D. I like old software, and it's interesting practice working in a language I don't know from existing code with a fairly clear spec. Seems like real world experience. More to the point, I felt like this should be digitally archived. That being said, I rewrote most of it in my push to get things feature complete. It's very much a Ship of Theseus now.  

What does the code do?

Generates a set of 6 ability scores using 4d6 drop lowest. I have a skeleton for Method II (generate 12 via 3d6 and keep the best six), but I don't think it's as popular.
Assigns these ability scores to ability score slots. 
Determines eligible races, and from that, eligible classes.
Checks for psionics and assigns them (not tested, but theoretically sound)
Restricts alignment and determines languages.
Calculates thief skills based on race and dexterity.
Determines starting spells of magic-users and illusionists.
Generates starting gold.
Takes a character name.
Saves your character as a .txt file.

What does the code not do, in the context of AD&D?

Equipment
Attack matrices
Unearthed Arcana

Why is the Cavalier in here? 

It's a nod to the first manuscript, which contained the ten default classes and the Cavalier. It'll be adjusted in the Unearthed Arcana update.

Why are most definitions just jammed into the start of the program?

READs buried in IF statements seem to make QB64 grumpy. While an alignment system based on the first 9 minor psychic disciplines would be fun, it's also not within the scope of classic AD&D. I'll tidy it up soon, idiomatic BASIC and program organization is not really what I was trained in.  

