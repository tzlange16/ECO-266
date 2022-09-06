# ECO 266 R Test
# Covers Bootcamp, Chapters 1 & 2
# September 13th 2020

#Name: 


# class()
# lists: c(), rep(), seq(), length()
# math: sum(), cumsum(), sqrt(), round()
# stats: mean(), sd(), IQR(), median(), var(), quantile(), summary()
# plotting: plot(), hist(), boxplot(), barplot()



#==Basic Syntax======

# Question 1)
#A) Create a vector of the integers -3 to 10; assign it as my.integers
my.integers <- seq(-3,10)
my.integers <- c(-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10)

#B) what is the class of this my.integers?
class(my.integers)

#C) transform my.integers into a character class; be sure to reassign it as my.integers
my.integers <- as.character(my.integers)


#D) double check the class to make sure it worked.
class(my.integers)

#E) re-transform my.integers into a numeric vector
my.integers <- as.integer(my.integers)
my.integers <- as.numeric(my.integers)

# what is the length, or number of elements, in my.integers?
length(my.integers)

# Question 2)
#A) Create another vector of numbers the same length as my.integers; assign it as my.numbers
my.numbers <- rnorm(14)
my.numbers <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)

#B) Verify the length of my.numbers
length(my.numbers)

#C create a 2 column matrix using my.integers and my.numbers; assign it as my.matrix
my.matrix <- matrix(c(my.integers,my.numbers),ncol=2)

#D create a character vector of length 2 with the names of your two vectors of numbers; assign it as my.names
my.names <- c("my.integers","my.numbers")

#E) assign my.names as the column names of my.matrix
colnames(my.matrix) <- my.names

#F) what is the value in the 3rd row of the 1st column of my.matrix?
my.matrix[3,1]

#G) create a new vector that adds my.integers and my.numbers; assign it as my.sums
my.sums <- my.integers + my.numbers

#H) add my sums as a new column of my.matrix; be sure to assign it as my.matrix
my.matrix <- cbind(my.matrix,my.sums)


#===Arithmetic=== 

#Question 3) 
# A) What is the sum of my.integers?
sum(my.integers)
-3+-2+-1+0+1+2+3+4+5+6+7+8+9+10

# B) What is the cumulative sum of my.numbers
cumsum(my.numbers)

# C) what is the sum of my.sums divided by the sum of my.integers?
sum(my.sums)/sum(my.integers)


# D) what is the square route of 342?
sqrt(342)

# E) what is the square root of 456 rounded to 3 decimal places?
round(sqrt(456),digits = 3)


# F) what is 1576 divided by 321, rounded to 4 decimal places
round(1576/321,digits = 4)


# G) what is the natural logarithm of the product of 462 and 54, rounded to 2 decimal places 
round(log(462*54),digits = 2)

# H) The following arithmetic R syntax is incorrect and gives an error: 9*8+9(8+9)
#    correct the syntax so that it gives the correct answer of 225. Indicate what was missing as a comment
 9*8+9*(8+9) #missing a multiplication sign between the 9 and the (8+9)

#==== Sampling, Data, and Descriptive Statistics ======

#the following data represents the average miles per gallon and horse power of 32 1947 model cars
#Run these 2 lines of code to assign them as your data:

mpg <- mtcars$mpg
hp <- mtcars$hp

# Question 4
# A) calculate the mean mpg, assign it as mpg.mean; round to 2 decimal places
mpg.mean <- round(mean(mpg),2)

# A) take a sample of mpg with 20 observations, assign it as mpg.sample
mpg.sample <- sample(mpg, 20)

# B) calculate the average of mpg.sample and assign it as sample.mean; round to 2 decimal points
sample.mean <- round(mean(mpg.sample),2)


# C) calculate the standard deviation of mpg.sample and assign it as sample.sd; round to 2 decimal points
sample.sd <- round(sd(mpg.sample),2)

# D) assume that the observations in the mpg vector represent those of the entire population.
#    Calculate how many sample standard deviations away from the population mean is your sample mean?
#    HINT: the standard deviation value of an observation is equivalent to its Z-score, which is: 
#          (value 1 - value 2)/Standard deviation
(mpg.mean-sample.mean)/sample.sd


# Question 5)
# A) calculate the mean hp, assign it as hp.mean; round to 2 decimal places
hp.mean <- round(mean(hp),2)

# B) take a sample of mpg with 20 observations, assign it as mpg.sample
hp.sample <- sample(hp, 20)

# C) calculate the average of hp.sample and assign it as hp.sample.mean; round to 2 decimal points
hp.sample.mean <- round(mean(hp.sample),2)

# D) calculate the variance of hp.sample and assign it as sample.var
sample.var <- round(var(hp.sample),2)

# E) sample variance is defined as the sum of the squared deviations of a sample divided by (n-1), or the number of observations minus 1.
#    to verify if R calculated it correctly, we will calculate it by hand.
#    use hp.sample.mean to transform hp.sample into a vector of deviations and assign it as hp.devs, 
#    DO NOT ROUND
hp.devs <- hp.sample-hp.sample.mean

# F) square the hp.devs vector and take the sum. assign the result as devs.squared
devs.squared <- sum(hp.devs*hp.devs)
devs.squared <- sum(hp.devs^2)

# G) calculate the variance as devs.squared divided by n-1 
#    assign the result as sample.var.test, round to 2 decimal places
sample.var.test <- round(devs.squared/19,2)

# H) comment whether sample.var.test is equal to sample.var

# Question 6
# A) create a box and whisker plot of your horsepower sample
boxplot(hp.sample)

# B) what is the interquartile range of your horsepower sample?
IQR(hp.sample)

# C) Outliers are usually defined as observations that exceed the first or third quartile by 1.5 or 3 times the interquartile range
#    Using R code, get help from r studio to find out which argument helps you define outliers on a box plot, 
#    and comment what the argument is.
?boxplot #range


# D) Assume we define outliers using 1.5 times the interquartile range. calculate the lower and upper boundaries of the horsepower population
quantile(hp)
96.5-1.5*IQR(hp)
180+1.5*IQR(hp)

# D) create a boxplot of the horsepower population, and define outliers as 1.5 times the IQR. Comment the number of outliers produced.
boxplot(hp, range = 1.5) #one


#Question 6
# A) Create a histogram of hp. comment how many cars have engines with 150 to 250 horsepower
hist(hp) # 11


# B) Create a histogram of mpg. comment the range used by the highest bin
hist(mpg) #30 to 35

# c) comment the number of cars in the lowest and highest bins

#10

# D) A car enthusiast is interested in the relationship between an engine's horsepower and the miles per gallon a car gets
#    Create a scatterplot of this relationship
plot(hp,mpg)

# E) Comment if there appears to be a relationship between horsepower and miles per gallon and the nature of it if there is one

# there is a relationship and it appears to be inverse; higher mpg cars have lower horsepower engines

# F) run the two lines of code to help you find out how many cars have a horsepower above 150 but get more than 15 miles per gallon; comment your answer
abline(v = 150)
abline(h = 15)
#7 cars
