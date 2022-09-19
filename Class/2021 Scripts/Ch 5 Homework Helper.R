# Chapter 5 Homework Helper

# new R commands
log() # natural log
exp() # e^
punif() # uniform PDF
pexp() # exponential PDF
ppois() # poisson (discrete) PDF, again


# Q1
#  According to a study by Dr. John McDougall of his live-in weight loss program at St. Helena Hospital, the people who follow his program lose between six and 15 pounds a month until they approach trim body weight. Let's suppose that the weight loss is uniformly distributed. We are interested in the weight loss of a randomly selected individual following the program for one month.

# (a) In words, define the random variable X.
# the weight loss, in pounds, for an individual

# (b)
1 / (15-6) # uniform probability

# (c)
# 1/9 where 6≤x≤15

# (d) find, mu, the mean
a <- 15
b <- 6
(a+b)/2
10.5

# (e) find sigma (st deviation)
# use sd formula for uniform dist
a <- 6
b <- 15
sqrt((b-a)^2/12)

# (f) Find the probability that the individual lost more than 8 pounds in a month. (Enter your answer as a fraction.)

# use area between formula for uniform dist
a <- 6
b <- 15
c <- 8
d <- 15
(d-c)/(b-a)
7/9

# (g) Suppose it is known that the individual lost more than 8 pounds in a month. Find the probability that he lost less than 12 pounds in the month. (Enter your answer as a fraction.)

# So that's:
# P(12 < x | x > 8)

# conditional - so this is a change of sample space!
# the event "x > 8" = 7 is the denominator
# the event "12 < x" = 4 of those seven
4/7

# (h) State "P(6 < x < 14 | x > 11) = ___" in a probability question.

# "What is the probability that the weight loss is between 6 and 14 pounds given that it is greater than 11 pounds?"
# calculate P(6 < x < 14 | x > 11)

# conditional - so this is a change of sample space!
# use the figure
# the event "x > 11" = 4 is the denominator
# the event "6 < x < 14" = 3 of those seven
3/4





# Q3
# Suppose that the useful life of a particular car battery, measured in months, decays with parameter 0.025. We are interested in the life of the battery.

# (a) In words, define the Random Variable X.
# the life, in months, of a car battery

# (b) Is X continuous or discrete?
# continuous

# (c) On average, how long (in months) would you expect one car battery to last?
m <- 0.025 #
mu <- 1/m
mu # 40 months on average

# (d) On average, how long (in months) would you expect 7 car batteries to last, if they are used one after another?

mu*7
# 280 months

# (e)  Find the probability that a car battery lasts more than 32 months.

pexp(rate=0.025, q=32, lower.tail = F)


# (f) 80% of the batteries last at least how long (in months)?

# AT LEAST!
# so, lower.tail = F
# use the quantile function
qexp(p=0.8, rate=0.025, lower.tail = F)

# check CDF
plot(dexp(rate=0.025, x=seq(0,100,1)), xlab = "months", ylab = "probability", type = 'l')
abline(v=40) # mean
abline(v=8.92) # 80% tile


# 13th %ile BELOW (a random check)
# set lower tail TRUE
p13 <- qexp(p=0.13, rate=0.025, lower.tail = T)

# check CDF
plot(pexp(rate=0.025, q=seq(0,100,1)), xlab = "months", ylab = "probability", type = 'l')
abline(v=40) # mean
abline(v=p13) # 13% tile




# Q4
#  The time (in years) after reaching age 60 that it takes an individual to retire is approximately exponentially distributed with a mean of about 7 years. Suppose we randomly pick one retired individual. We are interested in the time after age 60 to retirement.

# (a)  In words, define the Random Variable X.
# time, in years, after age 60, that it takes an individual to retire

#(b) Is X continuous or discrete?
#continuous

# (c) find mu
mu = 1/m
mu = 7


# (d) find sigma (sd)

sigma = mu
7

# (e)  Draw a graph of the probability distribution.

# find answer at x = 0

dexp(rate = mu, x=0)

mu = 1/7
yrs_60_plus = seq(0,30)
prob <- dexp(rate = mu, x=yrs_60_plus)

plot(x = yrs_60_plus, y=prob, type='l', main="years over 60 to retirement")



# (g) Find the probability that the person retired after age 71.

# after 71...
71-60
pexp(rate = 1/7, q=11, lower.tail = F)


# (h)  Do more people retire before age 67 or after age 67?
# before

# (i)  In a room of 1,000 people over age 79, how many do you expect will NOT have retired yet?

# so find prob of retiring over 79
# multiply by 1000

79-60
prob <- pexp(rate = 1/7, q=19, lower.tail = F)

prob * 1000




# Q6
#  During the years 1998–2012, a total of 29 earthquakes of magnitude greater than 6.5 have occurred in Papua New Guinea. Assume that the time spent waiting between earthquakes is exponential.

y = 2012 - 1998
m = y * 12
n = 29
rate = n/m

# (a) What is the probability that the next earthquake occurs within the next two months?

pexp(rate=rate, q = 2)


# (b) Given that six months has passed without an earthquake in Papua New Guinea, what is the probability that the next three months will be free of earthquakes?



# (c) What is the probability that zero earthquakes occurred in 2014?


# (d) What is the probability that at least four earthquakes occurred in 2014?















