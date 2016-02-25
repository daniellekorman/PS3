# Problem Set 3
# Danielle Korman
# February 25 2016

rm(list=ls())

# First, with S3
# Define a new class "door"
# This assigns the object door to the number 2 (could be 1 or 3)
door <- list(2)
# Assigns the class of object door to class door
class(door) <- "door"

# Create method PlayGame in S3
PlayGame <- function(x) {
  UseMethod("PlayGame", x)
}

# This function checks if a random number chosen from 1-3, which contains the car,
# matches with the user's choice of door (in this case, door 2)
# @param x The Input variable
# @param PlayGame The method used in this function
# @param door An object of class door, which is the user's choice of door (2)
# @return Either a congratulatory message if the numbers match, or a message of condolences
# @author Danielle Korman
PlayGame.door <- function(door) {
  if(sample(1:3, 1) == door) {
    return("Congratulations, you win a car!")
}
    else("Sorry, you picked the wrong door. You do not win a car.")
}

# Test function
PlayGame.door(door)

# Now, with S4

# Create class door, where the object is numeric
setClass("door",
                      representation = representation(
         x = "numeric"),
         prototype = prototype(
           x = c())
         )
# Create object door of class door
door <- new("door", x=2)
door

# Validity function to check if door is an integer
# Uneccessary because the original SetClass specified x as numeric, so
# won't work unless x is an integer, but this is what the validity would look like
setValidity("door", function(door){
  if(is.integer(door)==TRUE){
    return("Valid")
  }
  else("Not Valid")
  }
)

# Set PlayGame generic so that it can be used as a method
setGeneric("PlayGame", function(x){
  standardGeneric("PlayGame")
})

# Set PlayGame method
# This function again uses the method PlayGame to see if a random sample of 1-3
# matches the door chosen by the user
# @param x A numeric, previously defined in object door as 2
# @param door The input, object of class door where x=2
# @return A message saying the user won a car if the numbers match, or that they
# lost if the numbers don't match
# @author Danielle Korman

setMethod("PlayGame", c(x="door"), function(x){
  if(sample(1:3, 1) == x@x) {
    return("Congratulations, you win a car!")
  }
  else("Sorry, you picked the wrong door. You do not win a car.")
}
  )
# Test method PlayGame with object door
PlayGame(door)
