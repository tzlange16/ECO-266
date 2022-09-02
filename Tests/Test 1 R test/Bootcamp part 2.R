# R bootcamp
# part 2


# Warm Up - redo work from last class

# autocomplete parentheses


# TODAY #
# class()
# lists: c(), rep(), seq(), length()
# math: sum(), cumsum(), sqrt(), round()
# stats: mean(), sd(), IQR(), median(), var(), quantile(), summary()
# plotting: plot(), hist(), boxplot(), barplot()

# Concepts: do math WITH commands



# CLASS - a way to determine data type ####

# create and assign a variable
dumbo <- 173
class(dumbo)
str(dumbo)

me <- "coffee"
class(me)



# LIST VARIABLES ####


# use c() to make a list of any data (a vector)
data <- c(2,6,3,7,4,8,6,3,5,1,3,4,9,8,5,7,5,8)
f <- c(6,2,5,9,6,7)


c(4, "blue", 0.91823, 5) # makes them all into CHAR


# make a list of repeating elements with rep()

rep(3,20)


# make a sequence of numbers with seq()

seq(1:6)
seq(1,6)

x <-seq(1:6)


# find the LENGTH of a list

length(x)


# do math on numbers, variables, and lists

x*2.5

mean(x*2.5)

5 * data

sum(data)

sum(data) - 14.3


# DESCRIPTIVE STATS ####
# R has built in commands for common statistics:
mean(data)

median(data)

var(data)

sd(data)

IQR(data)

quantile(data)

summary(data)



# Compute Descriptive Statistics

# sum
sum(3,5,1,7,24) # sum a list of numbers entered manually
sum(data) # sum a variable that is a vector (a list of numbers)
sum(x)/sum(data) # use sum in larger computations

# sqrt - for square root
sqrt(49) # for a value
sqrt(data) # for a vector (a list of numbers)

# cumulative sums
cumsum(data)

# calculate means (on a dataset)
mean(data)

# standard deviation (on a dataset)
sd(data)

# round a number
round(sd(data), 2)


# DO MATH WITH COMMANDS ####

# Can you see what this formula is? (you will)
mean(data) - 2.3*sd(data)


# Example: calculate standard deviation
# with binned frequency data ####

# bins - seven categories
x <-seq(1,7)

# frequency of the THING in each category (data bins)
f <- c(3,13,31,29,11,8,5)

# PROCEDURE
# find mean
# calc deviations for each bin
# calc squared deviations for each bin
# calc freq * sq. dev for each bin
# sum
# normalize (by N (for pop) or n-1 (for sample))
# SQRT

n <- sum(f)
tot <- sum(f*x)
mean <- tot / n
devs <- x - mean
sq_devs <- devs^2
sqf <- sq_devs * f
var <- sum(sqf) / (n-1)
sdev <- sqrt(var)

# NOW - Find the number that is 3.5 standard deviations BELOW the mean.
mean - 3.5 * sdev




# DO MATH ON A VECTOR (a list of numbers) ####
# Let's calculate zscores
data # our base data

data - mean(data)  # deviances!

(data - mean(data))^2  # squared deviances!

(data - mean(data))/sd(data)  # zscores! (# of SDs away from mean)

zscores <- (data - mean(data))/sd(data)

zscores






# PLOT STUFF! ####

# scatter plot
plot(data)

# specify x and y values
plot(x,f)

# histogram
# makes a histogram with a dataset (Ch2 doesn't give you those, much)
hist(data)

# box plot is a visual statistical summary
boxplot(data)

# barplot
# plots values directly (useful for ch2)
barplot(data)


# Make a second dataset to compare
data2 <- rnorm(300, mean = 50, sd = 1)

plot(data)
plot(data2)

hist(data)
hist(data2)

boxplot(data)
boxplot(data2)

hist(data,breaks=c(0,10,20,30,40,50,70,80,90,100))
hist(data,breaks=seq(0,100,by=10))

# Collect values from a histogram object, including the midpoints of each bin

# histogram object
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

h <- hist(data2, plot=FALSE)

mids <- h$mids

counts <- h$counts

# create a frequency polygon
plot(x=mids, y=counts, type="b", main ="frequency polygon")



# create your own commands or functions! ####

freqpoly <- function(freqdata) {
	h <- hist(data2, plot=FALSE)
	mids <- h$mids
	counts <- h$counts
	plot(x=mids, y=counts, type="b", main ="frequency polygon")
}

freqpoly(data)




# NOTE on MODE in R
# calculating the mode
# This does NOT get you the statistical mode:
mode(data)
# it returns: [1] "numeric"
# if you want to calculate mode, create the custom function:

getmode <- function(v) {
	uniqv <- unique(v)
	uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(data)


