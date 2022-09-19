# MAKE SOME DATA!

data <- runif(100,0,100)

mean(data)

median(data)

mode(data)
# [1] "numeric"
# OHO!! Not what we thought!
# More on that later

var(data)

sd(data)

IQR(data)

quantile(data)

summary(data)


# Demo some basic R math ON A VECTOR (list of numbers)

data

data - mean(data)  # deviances!

(data - mean(data))^2  # squared deviances!

(data - mean(data))/sd(data)  # zscores! (# of SDs away from mean)


zscores <- (data - mean(data))/sd(data)


zscores



# basic plots
plot(data)

hist(data)

boxplot(data)


# Make different data
data2 <- rnorm(100, mean = 50, sd = 1)

plot(data)
plot(data2)

hist(data)
hist(data2)

boxplot(data)
boxplot(data2)

hist(data,breaks=c(0,10,20,30,40,50,60,70,80,90,100))
hist(data,breaks=c(0,10,20,30,40,60,70,80,100))


hist(data, plot=FALSE)
# $breaks
#  [1]   0  10  20  30  40  50  60  70  80  90 100
#
# $counts
#  [1] 14  3  9  9 10 12  9 14  6 14
#
# $density
#  [1] 0.014 0.003 0.009 0.009 0.010 0.012 0.009 0.014 0.006 0.014
#
# $mids
#  [1]  5 15 25 35 45 55 65 75 85 95
#
# $xname
# [1] "data"
#
# $equidist
# [1] TRUE
#
# attr(,"class")
# [1] "histogram"


hist(data2, plot=FALSE) -> h

h$mids -> x

h$counts -> y

plot(x=x, y=y, type="b", main ="frequency polygon")






getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(data)

