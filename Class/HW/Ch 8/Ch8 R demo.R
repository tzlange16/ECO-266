# Chapter 8 R demo

## topics
# 1 - dt, pt, qt, rt
# 2 - students t approximation of normal by DF, using plots
# 3 - sample problem

# 1 - t distribution functions in R
# dt, pt, qt, rt
?dt

pnorm(.975)
pt(.975,5)
pt(.975,10)
pt(.975,20)
pt(.975,30)
pt(.975,50)
pt(.975,500)
pt(.975,5000)


# 2 - students t approximation of normal by DF, using plots

x <- seq(-4,4,0.1)
plot(x,dnorm(x), type='l', ylim=c(0,.4))
plot(x,dt(x,df=2), type='l', ylim=c(0,.4))
plot(x,dt(x,df=5), type='l', ylim=c(0,.4))
plot(x,dt(x,df=10), type='l', ylim=c(0,.4))
plot(x,dt(x,df=15), type='l', ylim=c(0,.4))
plot(x,dt(x,df=50), type='l', ylim=c(0,.4))
plot(x,dt(x,df=100), type='l', ylim=c(0,.4))
plot(x,dt(x,df=1000), type='l', ylim=c(0,.4))
plot(x,dnorm(x), type='l', ylim=c(0,.4))






# 3 - sample problems

#Sample 1
#The standard deviation of the weights of baby elephants is known to be approximately 15 pounds. 
#We wish to construct a 95% confidence interval for the mean weight of newborn elephant calves. 
#Fifty newborn elephants are weighed. The sample mean is 244 pounds. The sample standard deviation is 11 pounds.
#Construct a 95% confidence interval for the population mean weight of newborn elephants. State the confidence interval.

#Step 1
#specify parameters
xbar <- 244 #sample mean
sigma <- 15 #population sd
n <- 50 #sample size

#since we know the population standard deviation, we can use the normal distribution functions
#a 95% Confidence interval uses an alpha of 0.5, divided by 2 is .025. using qnorm to find this quantile:
#at the lower boundary (rounded to 2 decimals):
round(qnorm(.025,mean=xbar,sd=sigma/sqrt(n)),2)
#and upper bound:
round(qnorm(.025,mean=xbar,sd=sigma/sqrt(n),lower.tail = FALSE),2)
#When you know the population standard deviation and can use the normal distribution functions, 
#we can find the confidence intervals using just the qnorm function instead of adding or subtracting from the sample mean mean. 
#THIS IS THE ONLY CIRCUMSTANCE THIS APPLIES

#Sample 2
#Professor Waring is interested in the number of students at liberal arts universities who participate in 
#environmental organizations. He looks up these statistics from a sample of 43 universities, and finds a sample mean 
#of 153 students with sample standard deviation of 15, and he assumes that the underlying distribution is normal.
#Help him construct a 99% confidence interval for his presentation to SOE

#specify parameters
xbar <- 153 #sample mean
s <- 15 #sample standard deviation
n <- 43 #sample size

#If the underlying distribution is normal but we don't know the population standard deviation, we use Student's T distribution functions
#the alpha for a 99% confidence interval is .01, divided by 2 is .005. using qt to find this quantile
# at the lower boundary
xbar + qt(.005,n-1)*(s/sqrt(43))#using addition as the qt below a p of .5 and lower.tail = TRUE will be negative
#and at the upper boundary
xbar + qt(.005,n-1,lower.tail = FALSE)*(s/sqrt(43))

#Sample 3
#Suppose that a market research firm is hired to estimate the percent of adults living in a large city who have 
#cell phones. Five hundred randomly selected adult residents in this city are surveyed to determine whether 
#they have cell phones. Of the 500 people surveyed, 421 responded yes - they own cell phones. 
#Using a 95% confidence level, compute a confidence interval estimate for the true proportion of adult residents of this city who have cell phones.


#specify parameters
n <- 500 #sample size
p <- 421/500 #proportion of sample who answered yes

#since this is a proportion, we use the standard normal distribution.
#the alpha for a 99% confidence interval is .01, divided by 2 is .005. using qnorm to find this quantile
# at the lower boundary
p + qnorm(.025,mean=0,sd=1,lower.tail = TRUE)*sqrt((p*(1-p))/n)#using addition, as a standard normal (mean = 0,sd=1) qnorm below a p of .5 and lower.tail = TRUE will be negative
#at the upper boundary
p + qnorm(.025,mean=0,sd=1,lower.tail = FALSE)*sqrt((p*(1-p))/n)



