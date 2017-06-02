# TennisScoringKata_pt2

This is a second attempt at doing a kata for tennis scoring. The idea this round is to treat a game of tennis as a state machine. 

Some final notes:

I liked:
  - the idea of scoring tennis as a state machine, instead of mapping points directly to strings in the first round
  - TDD kept my business logic correct as I wrote more complicated cases. Simple tests I wrote in the beginning would break when I made changes, so it was great seeing those save me!
I didnt Laike:
  - The logic for evaluating game state is somewhat complex, lots of if, <=, >= && all over the place, i.e. kinda ugly
  
How I could have done this better:
  - Evaluating game state logic for each case was tricky! It would have been nice to give meaning to each expression. 
  
  For example: 
  - (score1 >= 3 && score2 >= 3) could have been given meaning since it was repeated 3 times in the function. 
  In the case of our tennis scoring game, this means: "The Game is now in a back and forth state" 
  - ((score1 == 4 && score2 < 3) means "server has advantage"
  
