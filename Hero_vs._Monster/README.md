## This script simulates a small game inspired by a programming exercise. While learning PowerShell, it gave me a great opportunity to add some dynamism to the task in the script.

## The task was described as follows:

- The hero and the monster both start with 10-10 health.
- Each attack can have a value between 1 and 10.
- The hero attacks first.
- Display how much life the monster has lost and how much life it has left.
- If the monster's health is greater than 0, it can attack the hero.
- Display how much life the hero has lost and how much life he has left.
- Continue this attack sequence until the monster or hero's Health is reduced to zero or below.
- Display the winner's name.
- Most importantly: You must use either the do-while statement or the while statement.

## The program collects the following data in a log file at the end of the last round:

- Number of rounds of the fight
- Winner's name
- Total time of the game (seconds)

## A commonly introduced innovation is dice roll defense when a spell is found. The individual spells (six in number) can be found in "magic_skills.txt". When running the script, they must be in one place or the path must be rewritten to the desired value on line 54 of the .ps1 file.

`$line = Get-Content .\magic_skills.txt`