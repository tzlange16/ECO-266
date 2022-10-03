#====================================
# Name:
# Chapter 6 - The Normal Distribution
# Homework R Script
#====================================


#Question 1 randomized question
3.7 -> mean #randomized mean
1.8 -> sd #randomized sd
7 -> recovery #randomized recovery time
(recovery - mean) / sd #z score answer

#question 2 randomized question
7 -> mean #randomized mean
2 -> sd #randomized sd
1 -> time #randomized time to parking spot time
pnorm(time,mean,sd)#pnorm because we want one minute or less
#very low cumulative probability so yes it would be surprising 

#Question 3
#Part B Randomized
pnorm(180,210,48)

x=seq(100,400,length=200)#create a wide sequence that covers most of the distribution
y=dnorm(x,210,48)#calculate the individual probabilities of that sequence
plot(x,y,type = "l",lwd=2,col="red")#create a line graph of the distribution
x_shade <- seq(100,180,length=200)#create a sequence from the lower boundary of the distribution to the 40th percentile
y_shade <- dnorm (x_shade,210,48)#calculate the probabilities of each value in the shaded region
polygon(c(100,x_shade,180),c(0,y_shade,0),col="grey")#create a polygon from the sequence and probabilities


#Part C Randomized
qnorm(.8,210,48)

x=seq(100,400,length=200)#create a wide sequence that covers most of the distribution
y=dnorm(x,210,48)#calculate the individual probabilities of that sequence
plot(x,y,type = "l",lwd=2,col="red")#create a line graph of the distribution
bound <-qnorm(.8,210,48)
x_shade <- seq(100,bound,length=200)#create a sequence from the lower boundary of the distribution to the 40th percentile
y_shade <- dnorm (x_shade,210,48)#calculate the probabilities of each value in the shaded region
polygon(c(100,x_shade,bound),c(0,y_shade,0),col="grey")#create a polygon from the sequence and probabilities


#Question 4 Randomized
#Part C Randomized
mean <- 3
sd <- 1.8

pnorm(1,mean,sd)

x=seq(-4,10,length=200)#create a wide sequence that covers most of the distribution
y=dnorm(x,mean,sd)#calculate the individual probabilities of that sequence
plot(x,y,type = "l",lwd=2,col="red")#create a line graph of the distribution
x_shade <- seq(-4,1,length=200)#create a sequence from the lower boundary of the distribution to the 40th percentile
y_shade <- dnorm (x_shade,mean,sd)#calculate the probabilities of each value in the shaded region
polygon(c(-4,x_shade,1),c(0,y_shade,0),col="grey")#create a polygon from the sequence and probabilities


#Part D Randomized
pnorm(10,mean,sd,lower.tail = FALSE)


#Part E Randomized
qnorm(.6,mean,sd)


#Question 5 Randomized
mean <- 4 #randomized
sd <- 3 #randomized

qnorm(.6,mean,sd,lower.tail = FALSE) #qnorm because we're looking for a quantile value, lower.tail = FALSE because we want 60% of values above
#Question 6
pnorm(57,54,8,lower.tail = FALSE)#pnorm because we want cumulative probabilities, and lower.tail = FALSE because we want value or more



#Question 7 Randomized
mean <- 5 #randomized
sd <- 3 #randomized
lower <- 4 #randomized
upper <- 9 #randomized

A <- pnorm(lower,mean,sd) #lower cumulative probability
B <- pnorm(upper,mean,sd) #upper cumulative probability
B-A #cumulative between lower and upper


