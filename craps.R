# MIT License
#
# Copyright (c) 2019 Shane Zabel 
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# =============================================================================
#
# Simulation of the game of craps 
# Testing 3 different craps strategies: 
# Even wager, Martingale, Reverse Martingale 
# 
###############################################################################

craps <- function(){
	#Initialize simulation parameters
	#$1000 starting cash, $100 initial bet, 5 rounds, each round 10 games max
	starting_cash <- c(1000)
	first_bet <- c(100)
	max_rounds <- c(5)
	max_games <- c(10)
	
	#Set craps parameters
	field <- c(2,3,12)
	wins <- c(7,11)
	point <- c(4, 5, 6, 8, 9, 10)
	
	#Open file for writing
	outFile <- file("Craps_Results.txt","w")
	
	for(i in 1:max_rounds){
		#Initialize paramaters within a round
		current_round <- i
		current_cash_1 <- current_cash_2 <- current_cash_3 <- starting_cash
		bet_1 <- bet_2 <- bet_3 <- first_bet
		num_games_1 <- num_games_2 <- num_games_3 <- c(0)
		
		#Initialize round results printout
		cat("\n","Start of Round ",current_round,"\n")
		cat("Round\t\tGame\t\t\tEvenWager\tMartingale\tReverseMartingale", "\n")	
		
		for(j in 1:max_games){
			#Initialize parameters within a game. game_flag switches when the roll wins/looses
			current_iteration <- j
			game_flag <- c(0)
			
			#Update games played counter
			if(bet_1 != 0){
				num_games_1 <- num_games_1 +1
			}
			if(bet_2 != 0){
				num_games_2 <- num_games_2 +1
			}
			if(bet_3 != 0){
				num_games_3 <- num_games_3 +1
			}
			
			#Game continues until all strategies are out of cash or roll wins/looses
			while( ((current_cash_1 > 0) | (current_cash_2 > 0) | (current_cash_3 > 0)) & game_flag==0){
				#Initialize curent point
				current_point <- c(0)
				#Roll dice
				first_die <- sample(1:6,1)
				second_die <- sample(1:6,1)
				roll <- first_die + second_die
				
				#Case if roll is a winner
				if(roll %in% wins){
					#Add cash based on bet
					current_cash_1 <- current_cash_1 + bet_1
					current_cash_2 <- current_cash_2 + bet_2
					current_cash_3 <- current_cash_3 + bet_3
					
					#Update bets based on strategy
					#Even wager strategy
					if(current_cash_1 == 0 ){
						bet_1 <- c(0)
					}else{
						bet_1 <- first_bet
					}
					#Martingale strategy
					if(current_cash_2 == 0){
						bet_2 <- c(0)
					}else{
						bet_2 <- first_bet
					}
					#Reverse Martingale strategy
					if(current_cash_3 == 0){
						bet_3<- c(0)
					}else{
						#If there is not enough cash to double the bet, bet remaining cash
						if(current_cash_3<bet_3*2){
							bet_3 <- current_cash_3
						}else{
							bet_3 <- bet_3*2
						}
					}
					
					#Switch game_flag
					game_flag <- c(1)
				}
				
				#Case if roll is a looser
				if(roll %in% field){
					#Reduce cash based on bet
					current_cash_1 <- current_cash_1 - bet_1
					current_cash_2 <- current_cash_2 - bet_2
					current_cash_3 <- current_cash_3 - bet_3
					
					#Update bets based on strategy
					#Even wager strategy
					if(current_cash_1 == 0 ){
						bet_1 <- c(0)
					}else{
						bet_1 <- first_bet
					}
					#Martingale strategy
					if(current_cash_2 == 0 ){
						bet_2 <- c(0)
					}else{
						#If there is not enough cash to double the bet, bet remaining cash
						if(current_cash_2<bet_2*2){
							bet_2 <- current_cash_2
						}else{
							bet_2 <- bet_2*2
						}
					}
					#Reverse Martingale strategy
					if(current_cash_3 == 0 ){
						bet_3 <- c(0)
					}else{
						bet_3 <- first_bet
					}
					
					#Switch game flag
					game_flag <- c(1)
				}
				
				#Case if roll sets a point
				if(roll %in% point){
					#Set the point
					current_point <- roll
					#Initialize point roll
					z <- c(0)
					
					#Keep rolling until the point is hit or a 7 is rolled
					while(z != current_point && z != 7){
						#Roll the dice
						x <- sample(1:6,1)
						y <- sample(1:6,1)
						z <- x + y
						
						#Case where point is rolled
						if(z == current_point){			
							#Add cash based on bet
							current_cash_1 <- current_cash_1 + bet_1
							current_cash_2 <- current_cash_2 + bet_2
							current_cash_3 <- current_cash_3 + bet_3
							
							#Update bets based on strategy
							#Even wager strategy
							if(current_cash_1 == 0){
								bet_1 <- c(0)
							}else{
								bet_1 <- first_bet
							}
							#Martingale strategy
							if(current_cash_2 == 0){
								bet_2 <- c(0)
							}else{
								bet_2 <- first_bet
							}
							#Reverse Martingale strategy
							if(current_cash_3 == 0){
								bet_3 <- c(0)
							}else{
								#If there is not enough cash to double the bet, bet remaining cash
								if(current_cash_3<bet_3*2){
									bet_3 <- current_cash_3
								}else{
									bet_3 <- bet_3*2
								}
							}
						}
						
						#Case where a 7 is rolled
						if(z == 7){
							#Reduce cash based on bet
							current_cash_1 <- current_cash_1 - bet_1
							current_cash_2 <- current_cash_2 - bet_2
							current_cash_3 <- current_cash_3 - bet_3
							
							#Update bets based on strategy
							#Even wager strategy
							if(current_cash_1 == 0){
								bet_1 <- c(0)
							}else{
								bet_1 <- first_bet
							}
							#Martingale strategy
							if(current_cash_2 == 0){
								bet_2 <- c(0)
							}else{
								#If there is not enough cash to double the bet, bet remaining cash
								if(current_cash_2<bet_2*2){
									bet_2 <- current_cash_2
								}else{
									bet_2 <- bet_2*2
								}
							}
							#Reverse Martingale strategy
							if(current_cash_3 == 0){
								bet_3 <- c(0)
							}else{
								bet_3 <- first_bet
							}
						}
						
						#If neither the point or a 7 is rolled, do nothing and roll again
					}
					
					#Switch game flag
					game_flag <- c(1)
				}
				#End of game
			}
			
			#Print out results of game
			cat(current_round, "\t\t", current_iteration, "\t\t\t", current_cash_1, "\t\t", current_cash_2, "\t\t", current_cash_3, "\n")
		}
		
		#Write round results to file
		row1<-t(c("Round ",current_round,":\n"))
		row2<-t(c("Strategy\tNumber of Games\t\tEnding Balance (Dollars)","\n"))
		row3<-t(c("1\t\t", num_games_1, "\t\t\t", current_cash_1,"\n"))
		row4<-t(c("2\t\t", num_games_2, "\t\t\t", current_cash_2,"\n"))
		row5<-t(c("3\t\t", num_games_3, "\t\t\t", current_cash_3,"\n"))
		result<-data.frame(row1, row2, row3, row4, row5)
		
		write.table(result, file=outFile, append=TRUE, quote=FALSE, row.names=FALSE, col.names=FALSE, sep=" ")
		#End of round
	}
	close(outFile)
	cat("End of Program")
#End of program
}
