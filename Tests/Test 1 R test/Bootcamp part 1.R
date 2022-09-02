# R bootcamp
# part 1

# Visual introduction to RStudio IDE

# Dr. Tim’s Friendly Follow-Along Tour!
# -	R app vs Rstudio (open both)
# o	R app
# o	show command line
# o	Explain command line
# -	Tour of RStudio IDE
# o	scripts, environment, history, console, plots, help…
# o	Focus on scripts and “Console” (command line interface)
# o	tool tips
# o	Make a folder, keep work in there, 1 folder each week

# ~ 15 min


# Doing Math (arithmetic) in R

5

13

5 + 13

5^13

5-13(5/13)+13^5
# error! syntax counts, try this:

5-13*(5/13)+13^5

# Let's practice!
# Ask for a math arithmetic problem from the class
# See who can answer it the fastest
# Do another






# use commands
sum(52,67,3,5,8,4,3,6,8,8)


# get help on commands

?sum


?mean

# Variables are NAMES that hold a VALUE


tim <- 3

tim

5 -> tim

8888 -> tim

tim

# see the values of your variables in the Environment Pane in RStudio

# Do math with variables

tim*2

tim - 78464

# how many seconds in a year?
60*60*24*365

# how many seconds in any number of years?
years <- 21
60*60*24*365*years

years <- 45
60*60*24*365*years

# remove variables with rm() or in the Environment Pane
rm(tim)
rm(years)

# variables can have other TYPES of data, like text

years <- 34

# overwrite with text
years <- "hello, mom!"

years * 31536000

# find the TYPE of data with class()

class(years)

years <-75638
class(years)

# process text

message <- "you are"

message

paste(message, years)

years <- 45

paste("you are", years, "years old!!")



# Coerce variables from one type to another
# from CHR to NUM or NUM to BIN
# as.integer(), as.numeric(), as.character(), as.logical()

class(years)

as.character(years)

class(as.character(years))

age <- "52"

age + 1

class(age)

as.numeric(age) + 1

class(age)

# fix the data type

numerical_age <- as.numeric(age)

class(numerical_age)

# look at the environment

class(age)

age <- as.numeric(age)


# LISTS!
# some variables are lists

# Collect actual ages of class
ages <- c(25,19,20,20,21,22,21,21,20,20,19,20,20,20,21)

mean(ages)

# Add Waring's age, recompute
ages <- c(25,19,20,20,21,22,21,21,20,20,19,20,20,20,21,45)

mean(ages)

# outliers!



