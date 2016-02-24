# Problem Set 3
# Danielle Korman
# February 25 2016

rm(list=ls())

# First, with S3
# Define a new class "door"
door <- list(1, 2, 3)
class(door) <- "door"

# Create method PlayGame that takes class door
PlayGame.door <- function(door) {
  #Set method to PlayGame, calling class "door"
  #The user chooses which door, 1, 2 or 3
  if(sample(1:3, 1) == door) {
    return("Congratulations, you win a car!")
    # If the user's input for door is the same as the random sample, they win
}
    else("Sorry, you picked the wrong door. You do not win a car.")
  #If the user's input for door is not the same as the random sample, they lose
}
# Test function
PlayGame.door(door=1)

#### This seems to work, but I'm not sure if the methods and classes are right

# Now, with S4

# Create class door
doorclass <- setClass("door",
         slots = list(x = "numeric"))
# Create object door of class door
door <- doorclass(x = 1:3)
door
# Validity function to check if door is an integer
setValidity("door", function(door){
  if(is.integer(door)==TRUE){
    return("Valid")
  }
  else("Not Valid")
  }
)
# Set PlayGame method
setGeneric("PlayGame", function(x){
  standardGeneric("PlayGame")
})
setMethod("PlayGame", "door", function(door){
  if(sample(1:3, 1) == door) {
    return("Congratulations, you win a car!")
    # If the user's input for door is the same as the random sample, they win
  }
  else("Sorry, you picked the wrong door. You do not win a car.")
}
  )