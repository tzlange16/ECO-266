# Chapter 4 homework
# R code



# N choose K
# N choose K gives you the number of ways you can get a given subset of items, k, from a larger set, n.
# the R command is
choose(n,k)

# test the function
# the number of possible 5-card hands from a deck of 52 cards is...
choose(52,5)
2598960 # wow. That's a lot.

# n choose k is a fundamental building block of lots of statistical operations.

# example 4.1
choose(30,5)*choose(20,5)/choose(50,10) # 0.215085


# Q 1
# Suppose that a technology task force is being formed to study technology awareness among instructors. Assume that 12 people will be randomly chosen to be on the committee from a group of 28 volunteers, 19 who are technically proficient and 9 who are not. We are interested in the number on the committee who are not technically proficient.

# (a)
# the number of people on the committee who are not technically proficient

#  (b) List the values that X may take on.
#  X = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

# (c)  How many instructors do you expect on the committee who are not technically proficient? (Round your answer to the nearest whole number.)

x = 12 # num samples taken
k = 9 # num of 'successes' in pop
N = 28 # population size
n = ? # number of successes that result

# mean of hypergeometric distribution: xk/N
x # num samples taken
k # num of 'successes' in pop
N # population size

12 * 9 /28

4 # instructors



# (d) Find the probability that at least 5 on the committee are not technically proficient. (Round your answer to four decimal places.)

x = 12 # num samples taken
k = 9 # num of 'successes' in pop
N = 28 # population size
n = 5 # number of successes that result

# here we want to set q = 4, not 5. Why?
# because the hypergeometric is a discrete distrubtion, and when doing lower.tail = TRUE, it COUNTS the bin you give it. (n= 5 in this case)
# BUT when doing lower.tail = FALSE, the probabilty does not count the given "bin"
# so set q (what we were callin n above) to 5 - 1
# if my explanation doesn't make sense, type ?phyper() in the console and read the explanation for lower.tail, which says "probabilities are P[X ≤ x], otherwise, P[X > x]".
phyper(q=4, m=9, n=19, k=12, lower.tail = FALSE)

0.2986



# (e) Find the probability that at most 4 on the committee are not technically proficient. (Round your answer to four decimal places.)

# here we can use q as expected, because we are using lower.tail = TRUE
phyper(q=4, m=9, n=19, k=12)

0.7014





# Q 2




# Q 3
# A school newspaper reporter decides to randomly survey 15 students to see if they will attend Tet (Vietnamese New Year) festivities this year. Based on past years, she knows that 19% of students attend Tet festivities. We are interested in the number of students who will attend the festivities.

# (a)
# X = number of students who will attend

# (b)
# X = 0, 1, 2, ..., 15

# (c)
# This is a binomial, because we are looking for number of successes so:
# X ~ B(15,0.19)

# (d)
#  How many of the 15 students do we expect to attend the festivities? (Round your answer to the nearest whole number.)

15 # number of students sampled
0.19 # attendance rate

# mean of binomial (mu) = num trials (n) * prob of success (p)
# mu=np

15*0.19


# (e)
# Find the probability that at most 3 students will attend. (Round your answer to four decimal places.)

# AT MOST ... CDF!
pbinom(q=4, size=15, prob=0.19)



# (f)
# Find the probability that more than 2 students will attend. (Round your answer to four decimal places.)

# More than! CDF, with lower.tail = FALSE
pbinom(q=2, size=15, prob=0.19, lower.tail = FALSE)



# Q 5
#  At The Fencing Center, 60% of the fencers use the foil as their main weapon. We randomly survey 18 fencers at The Fencing Center. We are interested in the numbers that do not use the foil as their main weapon.

# (a)
# In words, define the Random Variable X.
# the number of fencers that do not use the foil as their main weapon


# (b)
# List the values that X may take on.
# X = 0, 1, 2, . . ., 18


# (c)
# Give the distribution of X.
1 - 0.60 = 0.40
# X ~ B(18, 0.40)


# (d)
# How many fencers are expected to not use the foil as their main weapon? (Round your answer to the nearest whole number.)

# mean of binomial, mu = n*p
18*0.4


# (e)
# Find the probability that eight do not use the foil as their main weapon. (Round your answer to four decimal places.)

dbinom(x=8, size=18, prob=0.4)

# (f)
# Based on numerical values, would you be surprised if all 18 did not use foil as their main weapon?

# well, lets calculate that probability!

dbinom(x=18, size=18, prob=0.4)
# oh! That's a very very very rare event.




# Q 6
# In one of its Spring catalogs, L.L. Bean® advertised footwear on 26 of its 192 catalog pages. Suppose we randomly survey 20 pages. We are interested in the number of pages that advertise footwear. Each page may be picked more than once.

# (a)
#  In words, define the random variable X.
#  the number of pages that advertise footwear

# (b)
#  List the values that X may take on.
#  X = 0, 1, 2, ..., 20

# (c)
#  Give the distribution of X. (Enter exact numbers as integers, fractions, or decimals.)

# so we are looking at a simple number of binary successes, so it's  a binomial
# the probability of success is the ratio of advert page to total pages
# X ~ B (20, 25/192)


# (d)
# How many pages do you expect to advertise footwear on them?

# binomial mean
# mu = np
20 * 25/192


# (e)
# Is it probable that all twenty will advertise footwear on them? Why or why not?

# lets calculate the probability

dbinom(x=20, size=20, prob=25/192)
# Oh, no. That's not probable!


# (f)
# What is the probability that fewer than eight will advertise footwear on them?

# okay. FEWER THAN 8.
# remember discrete lower-tail calculations INCLUDE the cut off bin.
# so, set to q = q - 1
pbinom(q=7, size=20, prob=25/192)


# (g)
# Reminder: A page may be picked more than once. We are interested in the number of pages that we must randomly survey until we find one that has footwear advertised on it. Define the random variable X.

# aha! repeated sampling until success!
# sounds like a geometric

# X ~ G(25/192)

# (h)
# What is the probability that you only need to survey at most five pages in order to find one that advertises footwear on it?

# this is lower tail
# but it's a geometric, so be careful.
# the last one is a success, so don't count it.
# set q = q - 1
pgeom(q=4, prob=25/192)


# (i)
# How many pages do you expect to need to survey in order to find one that advertises footwear?

# hmmm, what's the mean of the geometric?
# mu = (1-p)/p
# according to the textbook, this is now many **failures** to expect before we have a success.
# so we need add one, in order to actually GET the success

prob <- 25/192

(1 - prob) / prob
# that rounds to 7

7 + 1

