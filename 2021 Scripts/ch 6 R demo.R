# Chapter 6 R demo


# normal distribution

# random number generator
rnorm(n=10, mean = 3, sd = 1)

d <- rnorm(n=1000, mean = 3, sd = 1)

plot(d)

hist(d)




# plots

# normal PDF
x <- seq(-5,15, by=1) # make x values
dnorm(x,mean = 4, sd = 2) # generate data
plot(dnorm(x,mean = 4, sd = 2), type="b", main = "normal PDF", xlab ="values", ylab ="probability")



# normal CDF - for comparison
x <- seq(-5,15, by=1) # make x values
pnorm(x,mean = 4, sd = 2) # generate data
plot(pnorm(x,mean = 4, sd = 2), type="b", main = "normal CDF", xlab ="values", ylab ="probability")


# Example 6.8
# The final exam scores in a statistics class were normally distributed with a mean of 63 and a standard deviation of five.

# a. Find the probability that a randomly selected student scored more than 65 on the exam.
pnorm(q=65, mean=63, sd=5, lower.tail = FALSE)
# 0.3446



# b. Find the probability that a randomly selected student scored less than 85.
pnorm(q=85, mean=63, sd=5)
# 0.9999946
# rounds to 1


# c. Find the 90th percentile (that is, find the score k that has 90% of the scores below k and 10% of the scores above k).
qnorm(p=.90, mean=63, sd=5)
# 69.40776






# Example 6.9
# A personal computer is used for office work at home, research, communication, personal finances, education, entertainment, social networking, and a myriad of other things. Suppose that the average number of hours a household personal computer is used for entertainment is two hours per day. Assume the times for entertainment are normally distributed and the standard deviation for the times is half an hour.

# a. Find the probability that a household personal computer is used for entertainment between 1.8 and 2.75 hours per day.

#
pnorm(q=1.8, mean=2, sd=0.5) # lower portion
pnorm(q=2.75, mean=2, sd=0.5) # upper portion

# subtract lower from upper to get middle portion
pnorm(q=2.75, mean=2, sd=0.5) - pnorm(q=1.8, mean=2, sd=0.5)

# 0.5886145





# Let's make some sweet plots!
# We will use the ggplot2 libary
# If you can master this, it's useful because you can check your intuitions graphically.

# First, install the ggplot2 library
install.packages("ggplot2")

# First, load the ggplot2 library
library(ggplot2)

# plot a function. How about the normal?
ggplot( data.frame(x=c(-3, 3)), aes(x=x) ) +
	stat_function(fun = dnorm, geom = "line")
# each of these pieces has special meaning in ggplot2 land.
# "fun" means function, "geom" = geometry
# and YOU ALREADY KNOW what "dnorm" means.
# If you want to get sick plotting skills, that R course "Data visualization with ggplot2" it will explain everything.



# plot the area under the normal
ggplot( data.frame(x=c(-3, 3)), aes(x=x) ) +
	stat_function(fun = dnorm, geom = "area")
# Only difference is "area" instead of "line"


# Put them together:
# set the parameters of the normal with "args"
# and add a filled area between 0 and 5
ggplot( data.frame(x=c(-3,3)), aes(x) ) +
	stat_function(
		fun = dnorm,
		args = list(mean = 4, sd = 2.5),
		xlim = c(0, 5),
		geom = "area",
		fill = "orange") +
	stat_function(
		fun = dnorm,
		args = list(mean = 4, sd = 2.5),
		geom = "line" ) +
	xlim(-5,15)

# TRY IT!
# - see if you can modify the code to fill in different areas
# - see if you can change the parameters of the normal function





