#Question 2
#this is a randomized question so the numbers will be different
#solved by taking the sum of the (x-u)^2*P(X) column, and it should be a sum of 4 numbers


#Question 3
p <- 0.713# This is randomized; proportion of UCLA students who believe in same-sex marriage
N <- 8 #randomized; random sample of students
s <- 1 # number of successes in question minus 1
1-pbinom(s,N,p)#1-pbinom to find probability of at least number of successes in question


#Question 4
p <- .04 #proportion of people who really have the flu
N <- 25 #sample of patients
N*p #expected number of patients who really have the flu

#Question 5
lambda <- 120 #count of expected number of customers
x <- 150 #count being investigated
dpois(x = x, lambda = lambda)#pdf probability of x given expected value of E



#Question 6
lambda <- 8 #expected number of deaths from motor vehicle injuries
x <- c(0,4,8,10,11,15)#target probabilities
dpois(x=x,lambda=lambda)#poisson probabilities because this is a count


#Question 8
A <- punif(2,1.5,4.5)#randomized; cumulative probability of minimum of the interval 
B <- punif(4,1.5,4.5)#not randomized; cumulative probability of maximum of the interval
B-A #probability of the interval is equal to the cumulative probability of the maximum minus the cumulative probability of the minimum

#Question 11
A <- pexp(2,0.4)#randomized; cumulative probability of minimum of the interval 
B <- pexp(17,0.4)#randomized; cumulative probability of maximum of the interval 
B-A #probability of the interval is equal to the cumulative probability of the maximum minus the cumulative probability of the minimum


#Question 14a
face <- 12/52#probability of a face card
coin <- .5#probability of a heads or tails
pay1 <- 7 #randomized; payout from a face card and a heads
pay2 <- 2 #randomized; payout from a face card and a tails
pay3 <- -2 #Randomized; payout of a non-face card

x1<-round(pay1*face*coin,2)#p(pay1)*pay1
x2<-round(pay2*face*coin,2)#p(pay2)*pay2
x3<-round(pay3*(1-face),2)#p(pay3)*pay3
sum(x1,x2,x3)#expected value equals sum of p(x)*x
    