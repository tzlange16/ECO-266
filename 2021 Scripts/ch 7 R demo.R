# Chapter 7 R demo

# topics
# 1 - Not stderr()
# 2 - CLT and LLN demo
# 3 - Examples


# 1 - Not stderr()



# 2 - Central Limit Theorem and Law of Large Numbers demo

x <- rexp(100,.27)
hist(x)

pop <- rexp(10000,.27)
hist(pop)
sample(pop,100, replace = TRUE)
x <- sample(pop,100, replace = TRUE)
hist(x)
hist(sample(pop,100, replace = TRUE))
mean(sample(pop,100, replace = TRUE))


means <- rep(77777,1000)

for (i in 1:1000) {
	means[i] <- mean(sample(pop,100, replace = TRUE))
	}

hist(means)



# Again with uniform
x <- runif(100,13,42)
hist(x)
hist(runif(100,13,42))
pop <- runif(10000,13,42)
hist(pop)
sample(pop,100, replace = TRUE)
x <- sample(pop,100, replace = TRUE)
hist(x)
hist(sample(pop,100, replace = TRUE))
mean(sample(pop,100, replace = TRUE))


means <- rep(51,1000)

for (i in 1:1000) {
	means[i] <- mean(sample(pop,100, replace = TRUE))
	}

hist(means)





# 3 - Examples

# 7.1
# An unknown distribution has a mean of 90 and a standard deviation of 15. Samples of size n = 25 are drawn randomly from the population.
# a. Find the probability that the sample mean is between 85 and 92.
pnorm(q=85,mean=90, sd=15/sqrt(25))
# [1] 0.04779035
pnorm(q=92,mean=90, sd=15/sqrt(25)) - 0.04779035
# 0.6997171

#b. Find the value that is two standard deviations above the expected value, 90, of the sample mean.
# use zscore formula:
# value = mean + (# of sds) (sd_x/sqrt(n))





#7.2
#The length of time, in hours, it takes an "over 40" group of people to play one soccer match is normally distributed with a mean of two hours and a standard deviation of 0.5 hours. A sample of size n = 50 is drawn randomly from the population. Find the probability that the sample mean is between 1.8 hours and 2.3 hours.
pnorm(q=2.3,mean=2,sd=0.5/sqrt(50)) - pnorm(q=1.8,mean=2,sd=0.5/sqrt(50))
# 0.9976501


# 7.3
# In a recent study reported Oct. 29, 2012 on the Flurry Blog, the mean age of tablet users is 34 years. Suppose the standard deviation is 15 years. Take a sample of size n = 100.
# sample mean tends toward the population mean
34
# sample SD (aka SEM) tends toward sd/sqrt(n)
15/sqrt(100)

# b
# for large sample sizes, should be NORMAL

# c Find the probability that the sample mean age is more than 30 years (the reported mean age of tablet users in this particular study).
pnorm(q=30,mean=34,sd=15/sqrt(100), lower.tail = FALSE)

# d Find the 95th percentile for the sample mean age (to one decimal place).
qnorm(p=0.95,mean=34,sd=15/sqrt(100))



# Q5
#  The cost of unleaded gasoline in the Bay Area once followed an unknown distribution with a mean of $4.14 and a standard deviation of $0.10. Twenty-five gas stations from the Bay Area are randomly chosen. We are interested in the average cost of gasoline for the 25 gas stations. What is the distribution to use for the average cost of gasoline for the 25 gas stations?





# Q6
#  A pollster asks a single question with only yes and no as answer possibilities. The poll is conducted nationwide, so samples of 100 responses are taken. There are three yes answers for every two no answers overall. For the mean of the sampling distribution of sample proportions, find the following for yes answers.

# (a) The expected value.

# population mean = mean of the sampling distribution
0.6

# (b) The standard deviation. (Round your answer to four decimal places.)

# sampling distribution
sqrt((.6*.4)/100)

0.0490


# (c) The variance. (Round your answer to four decimal places.)

# sd = sigma, var = sigma^2.
# var = sd^2

0.0490^2

0.0024




# Q7
#  A school has 500 students. Usually, there are an average of 27 students who are absent. If a sample of 36 students is taken on a certain day, what is the probability that at least 2 students in the sample will be absent?

N <- 500 # population size
n <- 36 # sample size
p <- 27/N # mean (a proportion)

q <- 2/n # quantile of interest (also a proportion, 2 out of 36)
sd <- sqrt( (p*(1-p)/n) * ((N-n)/(N-1)) ) # small sample size correction

pnorm(q=q, mean=p, sd=sd, lower.tail = FALSE)






