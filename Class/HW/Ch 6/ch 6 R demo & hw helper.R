# Chapter 6 R demo


# normal distribution

# random number generator
rnorm(n=10, mean = 3, sd = 1)

d <- rnorm(n=1000, mean = 3, sd = 1)

plot(d)

hist(d)


#new quantile function
?qnorm
#Indicates the value that corresponds to a given percentile of a variable's distribution
p<-.1# the percentile in question. must be a value between 0 and 1, e.g. .1 equals the 10th percent quantile, where 10% of values are at or below it and 90% of values are above it
mean<-0# average of the variable
sd <- 1#standard deviation of the variable
qnorm(p=p,mean=mean,sd=sd)#the value that represents the 10th percentile boundary

# plots

# normal PDF
x <- seq(-5,15, by=1) # make x values
dnorm(x,mean = 4, sd = 2) # generate data
plot(dnorm(x,mean = 4, sd = 2), type="b", main = "normal PDF", xlab ="values", ylab ="probability")



# normal CDF - for comparison
x <- seq(-5,15, by=1) # make x values
pnorm(x,mean = 4, sd = 2) # generate data
plot(pnorm(x,mean = 4, sd = 2), type="b", main = "normal CDF", xlab ="values", ylab ="probability")


# Examples 6.8
# The final exam scores in a statistics class were normally distributed with a mean of 63 and a standard deviation of five.
mean <- 63
sd <- 5

# a. Find the probability that a randomly selected student scored more than 65 on the exam.
pnorm(q=65, mean, sd, lower.tail = FALSE)#we use the pnorm function because we want at least 65, and we use lower tail = FALSE because we are concerned with values of 65 or more
# 0.3446


# b. Find the probability that a randomly selected student scored an 75.
dnorm(x=75, mean, )#we use the dnorm function because we want exactly 85
# 0.0044789


# c. Find the 40th percentile (that is, find the score k that has 90% of the scores below k and 10% of the scores above k).
qnorm(p=.40, mean, sd)
# 61.73326

# d. Produce shaded region graph of the 40th percentile
x=seq(50,75,length=200)#create a wide sequence that covers most of the distribution
y=dnorm(x,mean,sd)#calculate the individual probabilities of that sequence
plot(x,y,type = "l",lwd=2,col="red")#create a line graph of the distribution
bound <- qnorm(p=.40,mean,sd)#create the quantile boundary by finding the value of the 40th percentile
x_shade <- seq(50,bound,length=200)#create a sequence from the lower boundary of the distribution to the 40th percentile
y_shade <- dnorm (x_shade,mean,sd)#calculate the probabilities of each value in the shaded region
polygon(c(50,x_shade,bound),c(0,y_shade,0),col="grey")#create a polygon from the sequence and probabilities


# e. Produce shaded region graph between the 40th and 70th percentile
x=seq(50,75,length=200)#create a wide sequence that covers most of the distribution
y=dnorm(x,mean,sd)#calculate the individual probabilities of that sequence
plot(x,y,type = "l",lwd=2,col="red")#create a line graph of the distribution
l_bound <- qnorm(p=.40,mean,sd)#create the lower quantile boundary for the 40th percentile
u_bound <- qnorm(p=.70,mean,sd)#create the upper quantile boundary for the 70th percentile
x_shade <- seq(l_bound,u_bound,length=200)#create a sequence of values from the 40th to the 70th percentiles
y_shade <- dnorm(x_shade,mean,sd)#calculate the probabilities of that sequence
polygon(c(l_bound,x_shade,u_bound),c(0,y_shade,0),col="grey")#create a polygon from the sequence and probabilities


# Example 6.9
# A personal computer is used for office work at home, research, communication, personal finances, education, entertainment, social networking, and a myriad of other things. 
# Suppose that the average number of hours a household personal computer is used for entertainment is two hours per day. 
# Assume the times for entertainment are normally distributed and the standard deviation for the times is half an hour.

# a. Find the probability that a household personal computer is used for entertainment between 1.8 and 2.75 hours per day.
A <- pnorm(q=1.8, mean=2, sd=0.5) # lower portion
B <- pnorm(q=2.75, mean=2, sd=0.5) # upper portion

# subtract lower from upper to get middle portion
B - A

