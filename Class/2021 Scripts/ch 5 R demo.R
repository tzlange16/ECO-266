# Chapter 5 R demo

# new R commands
log() # natural log
exp() # e^

# new distributions
punif() # uniform PDF
pexp() # exponential PDF
ppois() # poisson (discrete) PDF, again






# uniform distribution
# random number generator
runif(n=10, min=0, max=1)

d <- runif(n=100, min=0, max=1)

hist(d, breaks = 25)


# exponential distribution
# random number generator
rexp(n=10, rate = .5)

d <- rexp(n=1000, rate = .5)

plot(d)

hist(d)


# Plots
# do each with PDF and CDF

# uniform PDF
x <- seq(0,100, by=.5)
pdf <- dunif(x,min=0, max = 100)
plot(pdf, type="l", main = "uniform distribution", xlab ="values", ylab ="probability")
# uniform CDF
cdf <- punif(x,min=0, max = 100)
plot(cdf, type="l", main = "uniform distribution", xlab ="values", ylab ="cumulative prob.")


# exponential PDF
x <- seq(0,100, by=.5)
r <- 0.3
pdf <- dexp(x,rate=r)
plot(pdf, type="l", main = "exponential distribution", xlab ="values", ylab ="probability")
# exponential CDF
cdf <- pexp(x,rate=r)
plot(cdf, type="l", main = "exponential distribution", xlab ="values", ylab ="cumulative prob.")

# geometric PDF - for comparison
x <- seq(0, 100, by=1)
pdf <- dgeom(x,prob=.5)
plot(pdf,type="l", main = "geometric distribution", xlab ="values", ylab ="probability")
# geometric CDF
cdf <- pgeom(x,prob=.5)
plot(cdf, type="l", main = "geometric distribution", xlab ="values", ylab ="cumulative prob.")


# poisson PDF
x <- seq(0, 100, by=1)
lambda <- 15
pdf <- dpois(x,lambda)
plot(pdf, type="l", main = "poisson distribution", xlab ="values", ylab ="probability")
# poisson CDF
cdf <- ppois(x,lambda)
plot(cdf, type="l", main = "poisson distribution", xlab ="values", ylab ="cumulative prob.")

# Finding a particular probabilities
# using exponential PDF



# Example 5.11
# 30 customers arrive per hour and the TIME BETWEEN ARRIVALS is exponentially distributed.
# a - 30 / hour = rate of 1/2 per min. so, 1 customer every 2 min
# b - 2 min, 2 min, 2 min = 6 min
# c - after 1st customer, what's the probability that it takes less than a minute for the next one to arrive?

# X ~ Exp(0.5)

# we need the CDF
pexp(q=1, rate=0.5)
# 0.3934693
# see figure 5.28


# Example 5.11
# d - after 1st customer, probability  it takes MORE than 5 min for the next one to arrive?

# X ~ Exp(0.5)
plot(dexp(x, rate=0.5), type='b')

pexp(q=5, rate=0.5, lower.tail = FALSE)
# 0.082085
# see figure 5.29

# Also, you can do this by HAND
# P(X>5) =  1 - P(X<5) = 1 - (1 - e^(-.5*5))
 1 - (1 - exp(-.5*5))



# Example 5.11
# e - 70% of customers arrive within how many minutes of the last customer?

# P(X<x) = 0.70, what x?
# percentile!

qexp(rate=0.5,p=.7)
# 2.407946

# by hand
# 0.7 = 1 - exp(-.5x)
# 0.3 = exp(-.5x)
# ln(0.3) = -.5x
# x = log(0.3)/-.5
log(0.3)/-.5
# 2.407946


#f - actually an exponential distribution is NOT a reasonable fit to this situation. Why not?

