# ECO 266 Test # 2
# Covers Bootcamp, Chapters 1 - 7
# October 13th 2020

#Name:


#Directions:
# Read Each question carefully. All questions are to be answered with the R code required to solve the question, or as a #comment.
# You may use the internet, your books, example R scripts, and past homeworks, but You may not work with your classmates.


#Question 1
#The following data describe the duration, in minutes, of eruptions from the Yellowstone Guiser "Old Failful"
#Run the following line of code to assign it as your data
eruptions <- faithful$eruptions

#Part A) What is the average erruption time of Old Faithful?
mean(eruptions)

#Part B) What is the standard deviation of the erruption time of Old Faithful
sd(eruptions)

#Part C) What is the total amount of time that Old Faithful spent erupting?
sum(eruptions)

#Part D) what is the median erruption time of Old Faithful?
median(eruptions)

#Part E) The yellowstone website lists the shortest erruption time as one and a half minutes. 
#using the sample mean and sample standard deviation, calculate the z-score of this eruption
(1.5-mean(eruptions))/sd(eruptions)

#Part F) Lets say that an eruption sets a new record and lasts for 54 seconds, or 0.9 minutes. calculate the z-score
#        of this new record.
record.z <- (0.9 - mean(eruptions)) / sd(eruptions)

#Part G) Assume that the population mean and standard deviation of erruptions equals that of our sample, 
#        and that eruptions follow a normal distribution. what was probabiliity of an eruption lasting our record time or less?
pnorm(0.9,mean(eruptions),sd(eruptions))

#Part H) based on the probability you calculated, #comment how likely you think it is that our hypothetical record erruption will occur

#I think it is very unlikely because the probability is so low.


#Question 2
#The Maine Campus school newspaper reporter decides to randomly survey 14 students to see if they will 
#attend Maine Day events this year. Based on past years, they know 
#that 32% of students attend.

#Part A) Comment what type of distribution she should use to analyze her data and why
#binomial because there are only 2 choices: they will go or they will not go

#Part B) based on you answer to part B and their sample size, how many students does the reporter expect to attend rounded to 2 decimals?
#HINT: You are finding the average of the distribution here
14*.32

#Part C) what is the probability that 7 or more students report they will attend Maine day?
pbinom(7,14,.32,lower.tail = FALSE)

#Part D) what is the probability that exactly 3 students will attend Maine day?
dbinom(3,14,.32)


#Question 3
#The Blackbear Express is expected to depart from the Union every 30 minutes, but seasoned riders know that the real
#departure time varies evenly between 26 and 34 minutes

#Part A) Comment what type of distribution this description of bus departures follows and why
#Uniform because there is an upper and lower boundary

#Part B) What is the probability that a bus departs exactly 30 minuts after the last?
dunif(30,26,34)

#Part C) What is the probability that a bus departs between 28 and 31 minutes after the last?
A <- punif(28,26,34)
B <- punif(31,26,34)
B-A

#Question 4
#Edgar Anderson was an American botanist who studied the anatomy of iris flowers
#Run the following line of code to assign the sepal widths of some of his Irises as your data
width <- iris$Sepal.Width

#Part A) According to the shapiro-wilks statistical test, the Anderson's sepal widths are normally distributed.
#        For now, we will assume that the sample mean and standard deviation of Anderson's sepal widths are equal to 
#        the population mean and standard deviation. 
#       calculate the mean and standard deviations of the sepal widths and assign them as mean.iris and sd.iris
mean.iris <- mean(width)
sd.iris <- sd(width)

#Part B) Using the two parameters from Part A and qnorm(), calculate the theoretical IQR boundaries of the 
#        population distribution
#HINT: the IQR boundaries are equal to the first and third quartiles 
qnorm(c(.25,.75),mean.iris,sd.iris)

#Part C) Calculate the IQR boundaries of the Anderson's sample
quantile(width)

#Part D) Write a #comment about how close the sample and theoretical boundaries are

#The first theoretical quantile is smaller than the sample, and the third theoretical quantile is higher than the sample

#Part E) recalling the Central Limit Theorum, #comment the value do you expect the mean a sample of 30 to be.

#it would be equal to the population mean, or mean.iris

#Part F) recalling the Central Limit Theorum, calculate the theoretical standard deviation of the means 
#        of many samples of 30 and assign it as sd.means
sd.means <- sd.iris/sqrt(30)

#Part G) Take a sample 30 from Anderson's sepal widths and set replace = TRUE, assign it as width.sample
width.sample <- sample(width,30,replace=TRUE)

#Part H) Find the mean of width sample, assign it as sample.mean
sample.mean <- mean(width.sample)


#Part I) calculate the z-score of sample.mean, with respect to the distribution of sample means. 
(sample.mean - mean.iris) / sd.means





