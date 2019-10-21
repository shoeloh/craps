README.txt

Program was written in R

No compiling of R … its an interpreted language. Just run the program file in R and execute the function craps()

Program file is craps.R

Output file is Craps_Results.txt

In intial trials, averaged over the 5 rounds all strategies were loosing strategies. Even wager strategy (strategy 1) lost the least amount of money on average. Reverse Martingale strategy (strategy 3) lost the most on average. Martingale strategy (strategy 2) had the highest return on any single round ($1600).

Best strategy was to not play.

Sample Output:

 Start of Round  1 
Round		 Game			 Strategy 1	 Strategy 2	 Strategy 3 
1 		 1 			 1100 		 1100 		 1100 
1 		 2 			 1000 		 1000 		 900 
1 		 3 			 900 		 800 		 800 
1 		 4 			 1000 		 1200 		 900 
1 		 5 			 900 		 1100 		 700 
1 		 6 			 1000 		 1300 		 800 
1 		 7 			 1100 		 1400 		 1000 
1 		 8 			 1000 		 1300 		 600 
1 		 9 			 1100 		 1500 		 700 
1 		 10 			 1000 		 1400 		 500 

 Start of Round  2 
Round		 Game			 Strategy 1	 Strategy 2	 Strategy 3 
2 		 1 			 900 	 	 900 		 900 
2 		 2 			 1000 		 1100 		 1000 
2 		 3 			 1100 		 1200 		 1200 
2 		 4 			 1200 		 1300 		 1600 
2 		 5 			 1100 		 1200 		 800 
2 		 6 			 1200 		 1400 		 900 
2 		 7 			 1300 		 1500 		 1100 
2 		 8 			 1200 		 1400 		 700 
2 		 9 			 1100 		 1200 		 600 
2 		 10 			 1000 		 800 		 500 

 Start of Round  3 
Round		 Game			 Strategy 1		 Strategy 2		 Strategy 3 
3 		 1 			 900 		 	 900 		 	 900 
3 		 2 			 800 		 	 700 		 	 800 
3 		 3 			 700 		 	 300 		 	 700 
3 		 4 			 600 		 	 0 		 	 600 
3 		 5 			 500 		 	 0 		 	 500 
3 		 6 			 400 		 	 0 		 	 400 
3 		 7 			 300 		 	 0 		 	 300 
3 		 8 			 400 		 	 0 		 	 400 
3 		 9 			 300 		 	 0 		 	 200 
3 		 10 			 400 		 	 0 		 	 300 

 Start of Round  4 
Round		 Game			 Strategy 1	 Strategy 2	 Strategy 3 
4 		 1 			 1100 		 1100 		 1100 
4 		 2 			 1200 		 1200 		 1300 
4 		 3 			 1300 		 1300 		 1700 
4 		 4 			 1200 		 1200 		 900 
4 		 5 			 1100 		 1000 		 800 
4 		 6 			 1000 		 600 	 	 700 
4 		 7 			 900 		 0 		 600 
4 		 8 			 1000 		 0 		 700 
4 		 9 			 900 		 0 		 500 
4 		 10 			 800 		 0 		 400 




 Start of Round  5 
Round		 Game			 Strategy 1	 Strategy 2	 Strategy 3 
5 		 1 			 900 		 900 	       	 900 
5 		 2 			 800 		 700 		 800 
5 		 3 			 900 		 1100 		 900 
5 		 4 			 1000 		 1200 		 1100 
5 		 5 			 1100 		 1300 		 1500 
5 		 6 			 1000 		 1200 		 700 
5 		 7 			 900 		 1000 		 600 
5 		 8 			 1000 		 1400 		 700 
5 		 9 			 1100 		 1500 		 900 
5 		 10 			 1200 		 1600 		 1300 

