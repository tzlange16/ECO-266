# Chapter 7 R demo

# topics
# 1 - CLT and LLN demo
# 3 - Examples




# 2 - Central Limit Theorem and Law of Large Numbers demo

# CLT for means using exponential distribution
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



# CLT with uniform
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



# CLT for sums
#Using a normal distribution: Assume population variable x ~ N(10,5), and we take a sample of n=50
#population mean & SD
mean_x <- 10
sd_x <- 5
#sample size
n<-50

#new variable xsum, i.e., the sum of a sample of x. 
#mean & SD of xsum
mean_xsum <- mean_x*n
sd_xsum <- sqrt(n)*sd_x

#sample sums
sample_xsum <- vector()
for(i in 1:10000){
  sample_xsum[i] <- sum(rnorm(n,mean_x,sd_x))#take sum of sample 
}
mean_xsum#theoretical mean of xsum
mean(sample_xsum)#mean of sample

sd_xsum#theoretical sd of xsum
sd(sample_xsum)#sd of sample
#Pretty close!!

# 3 - Example


# In a recent study reported Oct. 29, 2012 on the Flurry Blog, the mean age of tablet users is 34 years. Suppose the standard deviation is 15 years. 
# suppose many random samples of 100 tablet users

# A. what is the average sample mean (xbar)?
mean_xbar <- 34
# B. what is the standard deviation of the sample means
sd_xbar <- 15/sqrt(100)

# C. What is the probability of obtaining a sample mean of 33.5?
dnorm(x=33.5,mean=mean_xbar,sd=sd_xbar)

# D.  Find the probability that the sample mean age is more than 30 years (the reported mean age of tablet users in this particular study).
pnorm(q=30,mean=34,sd=15/sqrt(100), lower.tail = FALSE)

# E. Find the 95th percentile for the sample mean age (to one decimal place).
qnorm(p=0.95,mean=34,sd=15/sqrt(100))

# Find the boundaries of the IQR of the distribution of sample means, I.E., what are the 25 percentile and the 75th percentile
qnorm(p=c(.25,.75),mean=mean_xbar,sd=sd_xbar)










