# Problem Set 3
# Danielle Korman
# February 25 2016

rm(list=ls())

# Question 1
# Define a new class "door"
door <- list(1, 2, 3)
class(door) <- "door"

# Question 2
PlayGame.door <- function(door) {
  if(sample(1:3, 1) == door) {
    return("Congratulations, you win a car!")
}
    else("Sorry, you picked the wrong door. You do not win a car.")
}
PlayGame.door(door=2)
