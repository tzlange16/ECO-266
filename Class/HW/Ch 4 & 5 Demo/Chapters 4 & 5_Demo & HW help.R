# Chapter 4 Homework Helper

## plot a PDF and CDF
## for each distribution we encounter


# *** How to do homework with R ***

# STEPS:
# - find the distribution, from clues
# - find how to use distribution (PDF, CDF, etc)
# - gather the data you have
# - connect data to distribution parameters
# - plug them into R function
# - use words to explain everything, make notes
# - check and recheck all steps




# *** R's probability distribution functions ***


# NAMES ***
# use a prefix-root structure: "pgeom", "dbinom"

# prefixes:
# r = random number generator
# d = probability density function, or PDF
# p = cumulative density function, or CDF
# q = quantile function

# DISCRETE Distributions from chapter 4
dhyper()
dbinom()
dgeom()
dpois()

# CONTINUOUS distributions from Chapter 5
dunif() # uniform PDF
dexp() # exponential PDF
ppois() # poisson (discrete) PDF, again



# USES ***
# "d" prefix
# "d" prefix, gives a PDF. Therefore it evaluates the probability of that one particular event only.

# for example:
dbinom(x=7, size=10, prob = 0.75)
# evaluates the probability that, that you would get 7 heads total, if you had a coin that was biased to land on heads 75% of the time, and you flipped it 10 times.

# "p" prefix
# "p" prefix, gives a CDF. So, it evaluates the sum of all probabilies across a range. BY DEFAULT that range is EVERYTHING UP TO that particular event only. But this can be changed with the "lower.tail" optional parameter.

# for example:
pbinom(q=18, size=20, prob = 0.63)
# evaluates the probability that you would get 18 OR FEWER SUCCESSES, in a sample of 20, if each trial had an independent 63% probability of success.

# this is the same as:
pbinom(q=18, size=20, prob = 0.63, lower.tail = TRUE)

# but setting "lower.tail = FALSE" gives you the probability of 18 OR MORE SUCCESSES:
pbinom(q=18, size=20, prob = 0.63, lower.tail = FALSE)

# this is the same as:
1 - pbinom(q=18, size=20, prob = 0.63, lower.tail = TRUE)
# because probabilities always sum to one.



# PARAMETERS ***
# each probability distribution in R has a set of parameters that are unique to that type distribution. YOU MUST CHECK THESE EACH TIME.

# For example:

dbinom(x, size, prob)
# x = number of successes of interest
# size = number of trials
# prob = probability of success of each trial

dgeom(x, prob)
# x = number of failures in a sequence of Bernoulli trials before success occurs.
# prob = probability of success of each trial

dpois(x, lambda)
# x = number of events of interest
# lambda = mean number of events in set time period

# uniform distribution
# random number generator
dunif(x, min, max)
#x= value of interest
# min = lower bound of the distribution
# max = upper bound of the distribution


# exponential distribution
# random number generator
dexp(x, rate)
# x = value of interest
# rate = 1/(mean time between events)




# PLOT PDFs and CDFs

# BINOMIAL distribution
# set the parameters
n <- 100
x <- seq(0,n, by=1)
p <- 0.3

# calculate the Binomial PDF (d prefix for PDF)
pdf <- dbinom(x,n,p)
# plot the PDF
plot(pdf, type="l", main = "binomial distribution", xlab ="x", ylab ="probability")

# calculate the Binomial CDF (p prefix for CDF)
cdf <- pbinom(x,n,p)
# plot the CDF
plot(cdf, type="l", main = "binomial distribution", xlab ="x", ylab ="cumulative prob.")



# GEOMETRIC distribution
# pick some parameters
n <- seq(0,100, by=1)
p <- 0.5

# calculate the PDF
pdf <- dgeom(n,p)
# plot PDF
plot(pdf, type="l", main = "geometric distribution", xlab ="x", ylab ="probability")

# calculate the CDF
cdf <- pgeom(n,p)
# plot CDF
plot(cdf, type="l", main = "geometric distribution", xlab ="x", ylab ="cumulative prob.")





# POISSSON distribution
# pick some parameters


lambda <- 30 # expected NUMBER of occurrences in the FIXED time interval
# the rate, lambda, is the mean and the variance of the poisson
x <- seq(0,100, by=1) # number of occurrences that might occur in that time interval

# calculate the PDF
pdf <- dpois(x, lambda)

# plot PDF
plot(pdf, type="l", main = "poisson distribution", xlab ="values", ylab ="probability")


# calculate the CDF
cdf <- ppois(x, lambda)

# plot CDF
plot(cdf, type="l", main = "poisson distribution", xlab ="x", ylab ="cumulative prob.")



# UNIFORM distribution
#Pick some parameters
#PDF
x <- seq(0,100, by=.5)

#calculate PDF
pdf <- dunif(x,min=0, max = 100)

#plot PDF
plot(pdf, type="l", main = "uniform distribution", xlab ="values", ylab ="probability")

# Calculate CDF
cdf <- punif(x,min=0, max = 100)

#plot CDF
plot(cdf, type="l", main = "uniform distribution", xlab ="values", ylab ="cumulative prob.")


# EXPONENTIAL Distribution PDF
#pick some parameters
x <- seq(0,50, by=.5)
rate <- 0.3

#calculate PDF
pdf <- dexp(x,rate=rate)

#Plot PDF
plot(pdf, type="l", main = "exponential distribution", xlab ="values", ylab ="probability")

# calculate CDF
cdf <- pexp(x,rate=rate)

plot(cdf, type="l", main = "exponential distribution", xlab ="values", ylab ="cumulative prob.")




# EXAMPLE PROBLEMS

# EXAMPLE problem 1 - Question 2

#The following table gives the possible values of a weighted 4 sided dice, along with the probability of rolling that number:

# x | P(x) |    x*P(x)   | ((x-mu)^2)*P(X)
# 1 | 0.2  | 1*0.2 = 0.2 | ((0.2-2.8)^2)*0.2  = 1.352
# 2 | 0.2  | 2*0.2 = 0.4 | ((0.4-2.8)^2)*0.2  = 1.152
# 3 | 0.2  | 3*0.2 = 0.6 | ((0.6-2.8)^2)*0.2  = 0.968
# 4 | 0.4  | 4*0.4 = 1.6 | ((0.4-2.8)^2)*0.4  = 2.304
 
#What is the standard deviation for the rolls of this die?

# SD is the square root of the sum of the final column
sqrt(1.352+1.152+0.968+2.304)


#Example problem 2 

#UMaine's Admissions program surveyed all freshmen students on whether or not the university should have hybrid learning options. 
# 54% of the students said that the university should offer hybrid in class and online options. Say you sampled 10 of these students.
# If you wanted to survey 10 of these students, what is the probability that at least 3 of them would want hybrid class options?

#As this is the binary, yes or not question, we are dealing with a binomial distribution,and will make use of the binom functions
#since we want to know the probability of at least 3 "yes" votes (3 or fewer, not exactly 3) we want the CDF function, as opposed to the PDF.
#As such, we will use the pbinom() function

q <- 3 #most number of yes votes we want (or "successes")
size <- 10 #sample size (or "number of trials")
p <- 0.54 #proportion of yes votes in the population (population probability of success)
pbinom(q,size,p)


#Example problem 3 - Question 3

# After looking at her logs for the day, the Orono elementary school nurse found that 8% of students who come to their office 
# have a fever.

#If 50 students visit the nurse in a day, how many would you expect to have the flu on average?

#this is a binomial probability problem, and we are looking for the average number of successes (students who DO have a fever).
#the average of a binomial distribution with probability p is N*p

N <- 50 #50 students in the sample
p <- .08 #proportion of students who have a fever (8% equals .08)
expected <- N*p
# you would expect 4 students to have a fever

#Example problem 4

#Part 1 - Question 5
#The UMaine bookstore gets 60 students per day on average.
# What is the probability that 50 students go to the bookstore tomorrow?

#Since this data is a count, we will use the poisson distribution.
#we will use the the PDF (dpois) to answer the question, since we want the probability that EXACTLY 30 students (not 30 or less)

mean <- 60 #poisson distributions use one parameter to represent the mean and the variance
target <- 50# the number we want to know the probability of
dpois(target,mean)


#Part 2 Question 6
#The bookstore manager wants to know what the probability of 40,50,60,70, and 80 students is on a given day

mean <- 60#poisson distributions use one parameter to represent the mean and the variance
targets <- c(40,50,60,70,80) # the numbers we want to know the probability of
dpois(targets,mean)#dpois will read a vector of target counts and return a vector of corresponding probabilitites

#Example problem 5 - Question 8
# Facilities estimates that the square footage of dorms are uniformly distributed between 200 square feet and 300 square feet 
#with an average of 250 and a standard deviation of 28.86751
# what is the probability of you getting a dorm room between 260 and 280 feet?

#we want the cumulative distribution function of the uniform distribution with a twist
#In R, we can't find the exact probability on an interval, so we will need to do some subtraction
#in probability, we can subtract the CDF of A from the CDF of B to get the CDF AB, if A < B:
A <- punif(260,200,300)#Cumulative probability of 260
B <- punif(280,200,300)#cumulative probability of 280
B-A #the P 260<x<280 is equal to CDF(B)-CDF(A)


#Example problem 6 - Question 11

#Dr. Waring spends an average of 2 minutes grading a students homework before moving onto the next 
# and he models this time as x ~ exp(1/2), 
#x is exponentially distributed with a rate parameter of 1 over the average 
#what is the probability that he spends between .5 minutes and and 2 minutes grading a given students assignment?


#This is another case of subtracting cumulative distribution functions, only now we're using the exponential distribution 
#since we're dealing with the time between events (time between switching to a new homework)
rate <- 1/2 #rate parameter is equal to 1/average
A <- pexp(.5,rate)
B <- pexp(2,rate)
B-A #the P .5<x<2 is equal to CDF(B)-CDF(A)


#Example problem 7 - Question 14a
#Dr. Waring and his colleges at SOE play a game by selecting from a deck of 52 cards and rolling a 6 sided dice, and play using vacation days
#The Rules are as follow:
# 1) selecting a face card and rolling an even number gains you 2 vacation day
# 2) selecting a face card and rolling an odd number gains you 1 vacation day
# 3) selecting a numeric card and rolling an odd number gains you nothing
# 4) selecting a numeric card and rolling an even number looses 2.5 vacation days

#Find the expected value for this game.


#list the possible payouts, their probabilities, and the probabilities * payouts, as in example problem 1 (round probabilities to the nearest thousandth place)
#   x  |  P(x)  | x*P(x) |   
#   2  | 0.153  |  0.306 | 
#   1  | 0.153  |  0.153 | 
#   0  | 0.346  |  0.000 | 
# -2.5 | 0.346  | -0.865 | 

#Expected payout is the sum x*P(X)
sum(c(0.306,0.153,0,-0.865))











