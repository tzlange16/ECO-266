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
plot(x=x,dnorm(x), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=2), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=5), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=10), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=15), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=50), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=100), type='l', ylim=c(0,.4))
plot(x=x,dt(x,df=1000), type='l', ylim=c(0,.4))
plot(x=x,dnorm(x), type='l', ylim=c(0,.4))






# 3 - sample problems
# problem 8.2
# given mean, CL, pop sigma, etc.
x = 68
sig = 3
n = 36
cl =.9

# find the Z-score (using normal dist)
1-cl
.1/2
qnorm(0.05)
qnorm(0.05,lower.tail = FALSE)
z <- qnorm(0.05,lower.tail = FALSE)
qnorm(p=0.95) # default mean = 0, default sd = 1

# calculate our EBM and CIs
EBM <- z*sig/sqrt(n) # 1.645 * 3 / sqrt(36)
0.8224268

68 + EBM
68 - EBM

# We estimate with 90% confidence that the true population mean exam score for all statistics students is between 67.18 and 68.82.




# problem 8.8
# given, x_bar, s, n, df, CL (so therefore alpha)
n = 15
CL = .95
data <- c(8.6, 9.4, 7.9, 6.8, 8.3, 7.3, 9.2, 9.6, 8.7, 11.4, 10.3, 5.4, 8.1, 5.5, 6.9)
length(data)
mean(data)
x <- mean(data)
s <- sd(data)
df <- n -1

# find the t-score (using t dist)
1-CL
(1-CL)/2
qt(p=0.025, df=14)
qt(p=0.025, df=14, lower.tail = FALSE)
t <- qt(p=0.975, df=14)
# 2.144787

EBM <- t * s/sqrt(n)
2.14 * 1.6722 / sqrt(15)

8.2267 + EBM
8.2267 - EBM



