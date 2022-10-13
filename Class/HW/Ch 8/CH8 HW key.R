#======================
#  Ch 8 HW Key
#  ECO 266 
#=====================

#2a randomized
#finding sample size of a proportion requires the z score, the EBM, and p & q
alpha <- .05 #confidence interval of 95% has an alpha of .05
z <- qnorm(alpha/2)#z score of this alpha
ebm <- 0.01# RANDOMIZED given EBM
p <- q <- 0.5 #setting p and q equal to  0.5 will give us the highest possible sample size. see example 8.14 from the book

#formula for n is given in the book prior to example 8.14
n <- round(((z^2)*(p*q))/ebm^2,digits = 0)#round n to the nearest whole number



#4d randomized
#parameters
xbar <- 23.5 #RANDOMIZED sample mean
sigma <- 6.0 #RANDOMIZED population sd
n <- 100 #RANDOMIZED sample size
alpha <- .1 #alpha for 90% confidence interval 

#confidence interval boundaries rounded to 2 decimal points
lb <- round(qnorm(alpha/2,xbar,sigma/sqrt(n)),2)#calculate lower boundary of confidence interval using qnorm with the sample mean and population sd 
ub <- round(qnorm(alpha/2,xbar,sigma/sqrt(n),lower.tail = FALSE),2)#calculate upper boundary of confidence interval using qnorm with the sample mean and population sd 
eb <- round(ub-xbar,2) #error bound




#5e randomized
#parameters
xbar <- 3 #RANDOMIZED sample mean
s <- 0.12 #RANDOMIZED sample sd
sigma <- .1 #population sd
n <- 12 #RANDOMIZED sample size
alpha = 0.1#alpha for 90% confidence interval

#confidence interval boundaries rounded to 3 decimal points
lb <- round(qnorm(alpha/2,xbar,sigma/sqrt(n)),3)#calculate lower boundary of confidence interval using qnorm with the sample mean and population sd 
ub <- round(qnorm(alpha/2,xbar,sigma/sqrt(n),lower.tail = FALSE),3)#calculate upper boundary of confidence interval using qnorm with the sample mean and population sd 
eb <- round(ub-xbar,3) #error bound



#5f randomized as part of question 5, though only the confidence interval is different
#parameters
alpha = 0.02#alpha for 98% confidence interval

#confidence interval boundaries rounded to 3 decimal points
lb <- round(qnorm(alpha/2,xbar,sigma/sqrt(n)),3)#calculate lower boundary of confidence interval using qnorm with the sample mean and population sd 
ub <- round(qnorm(alpha/2,xbar,sigma/sqrt(n),lower.tail = FALSE),3)#calculate upper boundary of confidence interval using qnorm with the sample mean and population sd 
eb <- round(ub-xbar,3) #error bound



#6a randomized
data <- c(2.5,2.9, 3.0, 2.3, 2.3, 2.2, 2.8, 2.1,2.4)#RANDOMIZED data values

xbar <- round(mean(data),2)#calculate sample mean
s <- round(sd(data),2)#calculate sample sd
n <- length(data)#calculate sample size
df <- n-1#calculate degrees of freedom

#6e randomized because of the data randomization in part 6a
alpha <- .05#alpha of a 95% confidence interval
#Calculate confidence interval
lb <- xbar + round(qt(alpha/2,df)*(s/sqrt(n)),2)# lower boundary
ub <- xbar + round(qt(alpha/2,df,lower.tail = FALSE)*(s/sqrt(n)),2)#upper boundary
eb <- ub-xbar#error bound



#7a randomized
x <- 340 #RANDOMIZED number of folks who claim to always buckle
n <- 410 #RANDOMIZED sample size
p <- round(x/n,4) #estimated proportion



#7d randomized as it is connected to 7a
alpha <- .05# alpha for 95% confidence interval 
#calculating confidence interval round to 4 decimal places
lb <- round(p + qnorm(alpha/2)*sqrt((p*(1-p))/n),4)#lower boundary
ub <- p + round(qnorm(alpha/2,lower.tail = FALSE)*sqrt((p*(1-p))/n),4)#upper boundary
eb <- p-lb#error bound



#8a randomized
n <- 255 #RANDOMIZED sample size of asian folks
pw <- .79 #proportion that would welcome a white person
pl <- .71 #proportion that would welcome a latino person
pb <- .66 #proportion that would welcome a black person
alpha <- .05 #alpha for 95% confidence interval

#CI for white folks
lbw <- round(pw + qnorm(alpha/2)*sqrt((pw*(1-pw))/n),4)
ubw <- pw + round(qnorm(alpha/2,lower.tail = FALSE)*sqrt((pw*(1-pw))/n),4)

#CI for latino folks
lbl <- round(pl + qnorm(alpha/2)*sqrt((pl*(1-pl))/n),4)
ubl <- pl + round(qnorm(alpha/2,lower.tail = FALSE)*sqrt((pl*(1-pl))/n),4)

#CI for black folks
lbb <- round(pb + qnorm(alpha/2)*sqrt((pb*(1-pb))/n),4)
ubb <- pb + round(qnorm(alpha/2,lower.tail = FALSE)*sqrt((pb*(1-pb))/n),4)





