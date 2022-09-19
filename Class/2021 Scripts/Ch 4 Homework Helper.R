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

# Distributions in this chapter
dhyper()
dbinom()
dgeom()
dpois()
# These are all DISCRETE




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

# but setting "lower.tail = FALSE" gives you the probability of 18 MORE MORE SUCCESSES:
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
# lambda = mean rate of even in set time period



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


lambda <- 30 # expected RATE of occurrences in the FIXED time interval
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










# EXAMPLE problem 1

# It has been stated that about 41% of adult workers have a high school diploma but do not pursue any further education. If 20 adult workers are randomly selected, find the probability that at most 12 of them have a high school diploma but do not pursue any further education. How many adult workers do you expect to have a high school diploma but do not pursue any further education?

# STEP 1
# describe the random variable
# Let X = the number of workers who have a high school diploma but do not pursue any further education.
# X takes on the values 0, 1, 2, ..., 20

# STEP 2
# pick the distribution
# binomial, because of independent probabilities

# STEP 3
# gather data and parameters
n = 20
p = 0.41
x = 12
# also: q = 1 – 0.41 = 0.59

# STEP 4
# assemble distribution with parameters:
# X ~ B(20, 0.41)


# Part A
# find probability of x = 12
# PDF, so use dbinom()
dbinom(x=12, size=20, prob = 0.41)


# Part B
# Find P(x ≤ 12)
# CDF, so use pbinom()
# pbinom(q=x, size=n, prob=p)
pbinom(q=12, size=20, prob = 0.41)
# or
pbinom(q=12, size=20, prob = 0.41, lower.tail = TRUE)





# EXAMPLE problem 2

# The lifetime risk of developing pancreatic cancer is about one in 78 (1.28%). Let X = the number of people you ask before one says he or she has pancreatic cancer. The random variable X in this case includes only the number of trials that were failures and does not count the trial that was a success in finding a person who had the disease. The appropriate formula for this random variable is the second one presented above. Then X is a discrete random variable with a geometric distribution: X ~ G(1/78) or X ~ G(0.0128).

# STEP 1
# Why is this a geometric dist?
# - because of counting the number of trails that were failures until you reach a success.

# Part A
# What is the probability of that you ask 9 people before one says he or she has pancreatic cancer? This is asking, what is the probability that you ask 9 people unsuccessfully and the tenth person is a success?

# STEP 2
p = 1/78
x = 9

# STEP 3
# how to use geometric distribution?
# it's a PDF, because we are interested in a SINGLE, SPECIFIC OUTCOME:

# STEP 4
# plug in your data, carefully. Do it in a clear and safe way:

# All of these produce the same results:
dgeom(x=9, prob=1/78) # most clear way
# or
dgeom(x=x, prob=p) # less clear
# or
dgeom(9, 1/78) # unclear
# or
dgeom(x, p) # unclear, dangerous



# Part B
# What is the probability that you must ask 20 people?
p = 1/78
x = 20
dgeom(prob=p,x=x)


# Part C
# Find the (i) mean and (ii) standard deviation of X

# mean
p = 1/78
mu <- (1-p)/p

# sd
p = 1/78
sqrt((1-p)/p^2)
77.49839





# POISSON example
# Example 4.16
# Text message users receive or send an average of 41.5 text messages per day.

# SO, this is a poisson!! WHY?

# A - How many text messages does a text message user receive or send per hour?
41.5/24


# B - What is the probability that a text message user receives or sends two messages per hour?
dpois(x=2, lambda = 41.5/24)
0.2652627

# C - What is the probability that a text message user receives or sends more than two messages per hour?

# poisson
# ppois() - because we want CUMULATIVE PROB, CDF
# CDF is everything UP TO THAT POINT but we want everything after that point

ppois(q=2, lambda = 41.5/24)

1 - ppois(q=2, lambda = 41.5/24)

ppois(q=2, lambda = 41.5/24, lower.tail = FALSE)






# Finally, I want to show N choose K, or the combinatorial formula

# N choose K gives you the number of ways you can get a given subset of items, k, from a larger set, n.
# the R command is
choose(n,k)

# test the function
# the number of possible 5-card hands from a deck of 52 cards is...
choose(52,5)
2598960 # wow. That's a lot.

# n choose k is a fundamental building block of lots of statistical operations.

# example 4.1
choose(30,5)*choose(20,5)/choose(50,10)
# 0.215085

