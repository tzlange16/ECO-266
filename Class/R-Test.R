# ------------------
#
# ECO 266 R Test
# Covers: R Bootcamp, Ch 1 & 2
# Week 3, 2020
# ------------------


# INSTRUCTIONS ----
# Use R Studio
# enter your name on line 2
# Save the file as "Rtest-LASTNAME.R"
# Do not write the ANSWER to the questions.
# Write the CODE that provides the answer when it is RUN.
# Like this: add 2 and 23

2 + 23

# There might be more than 1 answer to some questions
# For some questions I give you some tips and R code
# For some questions I give you ALL the code you need, because it's NEW!
# Yes, you can use the internet.
# No, you cannot communicate with any other humans (DM, text, social media etc.)



#==Basic Syntax======

# ---- Question 1 ----
#A) Create a vector of the integers -3 to 10; assign it to a variable called "my.integers" (there are two ways to do this)



#B) what is the data class of "my.integers"?


#C) transform my.integers into a character class; and reassign it to "my.integers"


#D) Check the class to make sure it worked.



#E) re-transform my.integers into a numeric vector (there are two ways to do this)



# what is the length, or number of elements, in my.integers?





# ---- Question 2 ----
#A) Create another vector of numbers the same length as "my.integers"
# assign it to a variable called "my.numbers"
# Use runif()



#B) Verify the length of "my.numbers"



#C) create a new vector that adds "my.integers" and "my.numbers"; assign it to "my.sums"






#===Arithmetic===

# ---- Question 3 ----
# A) What is the sum of "my.integers"?



# B) What is the cumulative sum of "my.numbers"


# C) what is the sum of "my.sums" divided by the sum of "my.integers"?



# D) what is the square route of 342?


# E) what is the square root of 456 rounded to 3 decimal places?
# use round()



# F) what is 1576 divided by 321, rounded to 4 decimal places



# G) what is the natural logarithm of the product of 462 and 54, rounded to 2 decimal places


# H) The following arithmetic R syntax is incorrect and gives an error: 9*8+9(8+9)
#    correct the syntax so that it gives the correct answer of 225. Indicate what was missing as a comment

9*8+9(8+9)





#==== Sampling, Data, and Descriptive Statistics ======

# the following data represents the average miles per gallon and horse power of 32 1947 model cars
# this data comes built in to R
# Run these 2 lines of code to assign them as your data:

mpg <- mtcars$mpg
hp <- mtcars$hp




# ---- Question 4 ----
# A) calculate the mean mpg, assign it to "mpg.mean"; round to 2 decimal places



# A) take a sample of mpg with 20 observations, assign it to "mpg.sample"



# B) calculate the average of "mpg.sample" and assign to as "sample.mean"; round to 2 decimal points



# C) calculate the standard deviation of "mpg.sample" and assign it as "sample.sd"; round to 2 decimal points




# D) assume that the observations in "mpg" represent the entire population.
# Calculate how many sample standard deviations away from the population mean is your sample mean?
# HINT: the standard deviation value of an observation is equivalent to its Z-score, which is: (value 1 - value 2)/sample standard deviation





# ---- Question 5 ----
# A) calculate the mean hp, assign it as "hp.mean"; round to 2 decimal places



# B) take a sample of hp with 20 observations, assign it as "hp.sample"



# C) calculate the average of "hp.sample" and assign it as "hp.sample.mean"; round to 2 decimal points



# D) calculate the variance of "hp.sample" and assign it as "sample.var"



# E) sample variance is defined as the sum of the squared deviations of a sample divided by (n-1).
# to verify that R calculated it correctly, we will calculate it by hand.
# use "hp.sample.mean" to transform "hp.sample" into a vector of deviations and assign it as "hp.devs",
# DO NOT ROUND




# F) square the "hp.devs" vector and take the sum. assign the result as "devs.squared"



# G) calculate the variance as "devs.squared" divided by n-1
# assign the result as "sample.var.test", round to 2 decimal places



# H) Compute whether "sample.var.test" is equal to "sample.var" by setting them equal to eachother with two equal signs, like this "XXX == YYY". This is a logical test in R, and it means "is XXX equal to YYY."





# ---- Question 6 ----
# A) create a box and whisker plot of your horsepower sample



# B) what is the interquartile range of your horsepower sample?



# C) Outliers are usually defined as observations that exceed the first or third quantile by 1.5 or 3 times the interquartile range
# Using R code, get help from rstudio to find out which argument helps you define outliers on a box plot
# AND make a # COMMENT on what that argument for outliers is.




# D) We will define outliers using 1.5 times the interquartile range.
# Calculate the lower and upper boundaries of the horsepower population, "hp"
# HINT: use a single R function to collect the first and third quartiles



# E) Now use the first and third quartiles you just computed to find the cutoff used to find outliers at 1.5*IQR above and below.





# F) create a boxplot of the horsepower population, and define outliers as 1.5 times the IQR.
# AND #comment the number of outliers produced.






# ---- Question 7 ----
# A) Create a histogram of hp.
# And #comment how many cars have engines with 150 to 250 horsepower




# B) Create a histogram of mpg.
# And #comment the range used by the highest bin




# c) type the number of cars in the lowest and highest bins



# D) A car enthusiast is interested in the relationship between an engine's horsepower and the miles per gallon a car gets
# Create a scatter plot of this relationship.
# use plot()




# E) Comment if there appears to be a relationship between horsepower and miles per gallon and the nature of it if there is one




# F) run the two lines of code to help you find out how many cars have a horsepower above 150 but get more than 15 miles per gallon
abline(v = 150)
abline(h = 15)

# type your answer





# That's it folks! Well done!
