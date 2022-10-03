#======================================
# Name:
# Chapter 7 - The Central Limit Theorem
# Homework R Script
#======================================

#Question 1 



#Part D - part of this question is randomized
mean <- 174 #population mean of farm acres
sd_x <- 52 #standard deviation of farm acres; randomized
n <- 45 #sample size of farms; randomized
sd_xbar <- sd_x/sqrt(n)# standard deviation of xbar - both numbers are randomized

qnorm(.25,mean,sd_xbar)#smaller value
qnorm(.75,mean,sd_xbar)#upper value

#Question 4 
mean <- 4.59 #population mean of gas prices
sd_x <- 0.1 #standard deviation of gas prices in population; 
n <- 16 #sample size;
sd_xbar <- sd_x/sqrt(n)# standard deviation of xbar - both numbers are randomized

pnorm(4.69,mean,sd_xbar,lower.tail = FALSE)#probability of the average being 4.69


#Question 5# Randomized parts
mean <- 50 #mean of x; randomized
sd <- 13 #sd of x #randomized
n <- 25 #sample size
sd_xbar <- sd/sqrt(n)# sd of means

#Part c Randomized
pnorm(50,mean,sd_xbar)#cumulative probability of 50

#Part D Randomized
qnorm(.1,mean,sd_xbar)

#part e Randomized
A <- pnorm(48,mean,sd_xbar)#lower boudary
B <- pnorm(54,mean,sd_xbar)# upper boundary
B-A

#Part F Randomized
A <- pnorm(11,mean,sd_xbar)#lower boudary
B <- pnorm(46,mean,sd_xbar)#upper boundary
B-A

#Part H
mean_sumx <- 1250
sd_sumx <- 65

qnorm(.75,mean_sumx,sd_sumx)

#Part I Randomized
A <- pnorm(1200,mean_sumx,sd_sumx)#lower boudary
B <- pnorm(1350,mean_sumx,sd_sumx)#upper boundary
B-A

#question 6 randomized
mean <- (24+26)/2 #mean of uniform
sd <- sqrt(((26-24)^2)/12)#sd of uniform
sd_xbar <- sd/sqrt(100)#sd of xbar

pnorm(24.8,mean,sd_xbar,lower.tail = FALSE)#randomized target value


#Question 7 #randomized
mean <- 7 #mean attention span
sd <- 7 #sd attention span
sample <- 60 #sample size
sd_xbar <- 7/sqrt(60) #sd of xbar

#Part F
pexp(9,rate = 1/mean)#random target value
pnorm(9,mean,sd_xbar)#random target value