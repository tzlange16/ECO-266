# HW 2 notes

# problem 1

# problem 2
# use freq (f) times median (m)
# page 75
# ex 2.28

# 2c
# Kth percentile
# formula on pg 89


# problem 3
# A culture contains 1,400 bacteria. The bacteria grow to 2,100 in 10 hours. What is the rate at which the bacteria grow per hour to the nearest tenth of a percent?

# geometric growth!
a_naught = 1400
a_n = 2100
((a_n/a_naught) ^ (1/10) - 1) * 100

# 4
# z score
# example 2.35


# Problem 5
# use x*f/n

x <-seq(1:6)
f <- c(3,3,8,12,12,2)

x*f

sum(x*f)

mean <- sum(x*f)/sum(f)


sqrt(sum((x-mean)^2)/(sum(f)-1))
# not working because frequency data

sqrt(sum(f*(x-mean)^2)/(sum(f)-1))
# aha!

plot(x,f)

# part d

f <- c(3,3,8,12,12,2)
relfreq <- f/sum(f)

cum_freqs <- cumsum(relfreq)

barplot(cum_freqs)


# e
sum(f)
sum(f)/4
# in the table, 10 values form bottom is 3

# f
sum(f)/2
# count up sum(f)/2, so it's 4

# h -  What percent of the students owned at least five pairs? (Round your answer to one decimal place.)
# total of category 5 and 6 = 14
14 / sum(f)

# i-  Find the 40th percentile
.4 * 40
# 16, so 16th number from bottom, so: 4

# j - Find the 40th percentile
.9 * 40
#36, so 36th from bottom, so 5

# k
x <- seq(1:6)
plot (x,f, type='b')




# Problem 6
#  One hundred teachers attended a seminar on mathematical problem solving. The attitudes of representative sample of 12 of the teachers were measured before and after the seminar. A positive number for change in attitude indicates that a teacher's attitude toward math became more positive. The twelve change scores are as follows.

scores <- c(4, 8, -1, 1, 0, 4, -3, 2, -1, 5, 4, -2)

# part A -What is the mean change score?
mean(scores)
1.75


# part B - What is the standard deviation for this sample?

sd(scores)
3.30633
round(sd(scores),2)
3.31


# part C - What is the median change score?
median(scores)
1.5

# part D - Find the change score that is 2.2 standard deviations below the mean.

mean(scores) - 2.2*sd(scores)
-5.5


# Problem 7
#  In a recent issue of the IEEE Spectrum, 84 engineering conferences were announced. Four conferences lasted two days. Thirty-six lasted three days. Eighteen lasted four days. Nineteen lasted five days. Four lasted six days. One lasted seven days. One lasted eight days. One lasted nine days. Let X = the length (in days) of an engineering conference.

# part A
# fill in the raw frequencies
# Four conferences lasted two days. Thirty-six lasted three days. Eighteen lasted four days. Nineteen lasted five days. Four lasted six days. One lasted seven days. One lasted eight days. One lasted nine days

f <- c(4,36,18,19,4,1,1,1)
days <- seq(2,9)

sum(f) # total obs

f/sum(f)

round(f/sum(f),4) # rel freqs

rel_freq <- round(f/sum(f),4)

cumsum(rel_freq) # cum freqs

# Part B

# Find the median (in days).
# find index of median

sum(f) # total obs
sum(f)/2 # median index

# Count up from bottom
# ----> 4 days

# Find the first quartile (in days).
sum(f)/4 # total obs

# Count up from bottom
# ----> 3 days


# Find the third quartile (in days).
sum(f)/4 * 3 # total obs

# Count up from bottom
4 + 36 + 18 + 19
# ----> 5 days


# Part C
# Find the 55th percentile (in days).
sum(f)/100 # one percentile

sum(f)/100 * 55 # 55th %ile
sum(f) * .55 # 55th %ile
46.2 # count up...

# 4 days

# Part D
# Find the 40th percentile (in days).

sum(f) * .4

33.6 # count up
f
cumsum(f)
# 3 days



# Part E
# Find the 40th percentile (in days).
# The middle 50% of the conferences

# IQR
# Can't just use IQR, because we don't have a dataset..
# count up and down 1Q from Median
# ALREADY DID THAT:

# Q1 (in days).
sum(f)/4 # Count up --> 3 days

# Q3 (in days).
sum(f)/4 * 3 # Count up --> 5 days

# so IQR is between 3 and 5
# test that

36 + 18 + 19 # 73 in IQR
sum(f) # 84 total

# yup!


# Part F
# Calculate the sample mean (in days).

# Oooh! What's the "sample mean"?
days <- seq(2,9)

f * days
sum(f * days) # the TOTAL
total <- sum(f * days)
n <- sum(f)

total / n
round(total / n, 2)
3.94

# Part G
# Calculate the sample standard deviation

# How to calculate sd with binned Freq data
# data in bins
# frequency of bins
# find mean
# calc deviations for each bin
# calc squared deviations for each bin
# calc freq * sq. dev for each bin
# sum
# normalize (by N (for pop) or n-1 (for sample))
# SQRT

# deviations
days - mean

# squared deviations
(days - mean)^2

# freq TIMES squared deviations
f * (days - mean)^2

# sum that
sum (f * (days - mean)^2)

# variance
var <- sum (f * (days - mean)^2) / ( n - 1 )

# standard deviation
sqrt(var)

# Part H
# Find the mode
# most common
3 #days





# Problem 8
# given data
x <-seq(0,6)
f <- c(3,13,31,29,11,8,5)

# first, find standard deviation
n <- sum(f)
tot <- sum(f*x)
mean <- tot / n
devs <- x - mean
sq_devs <- devs^2
sqf <- sq_devs * f
var <- sum(sqf) / (n-1)
sdev <- sqrt(var)

# NOW - Find the number that is 1.5 standard deviations BELOW the mean.
mean - 1.5 * sdev






# Problem 9

# given data
# watch out for zeros!
x <-seq(0,9)
f <- c(19,24,23,22,15,10,0,5,0,1)

# Part A - find IQR
sum(f)/2 # index of median
59.2

cumsum(f) # find median: 3rd bin...
x[3]
# median = 2 books


# find Q1 index
sum(f)/4
cumsum(f) # find Q1: 2nd bin...
x[2]
# Q1 = 1 book

# find Q3 index
sum(f)/4 * 3
cumsum(f) # find Q3: 5th bin...
x[5]
# Q3 = 4 books

# find IQR: Q3 - Q1
x[5] - x[2]
4 - 1

# Part A

# IQR method for finding outliers
# 1.5 * IQR
# see Example 2.14

# below Q1 - 1.5*IQR
1 - 1.5* 3
# nope

# above Q3 + 1.5*IQR
4 + 1.5*3
# 8.5, so yes, 9 is an outlier


# Part C
# Are any data values further than two standard deviations away from the mean?
# given data
x <-seq(0,9)
f <- c(19,24,23,22,15,10,0,5,0,1)

# first, find standard deviation
n <- sum(f)
tot <- sum(f*x)
mean <- tot / n
devs <- x - mean
sq_devs <- devs^2
sqf <- sq_devs * f
var <- sum(sqf) / (n-1)
sdev <- sqrt(var)

# any below?
mean - 2 * sdev
# nope

# any above?
mean + 2 * sdev
# yes, everything above 6.22

# shape of data
plot(x,f, type='b')


# best measure of center?
mean
# med = 2
