#-------------------------------------------------------------------------------
#                           Loading data
#-------------------------------------------------------------------------------

# Observed data
data <- read.csv('data.txt',header=T)

# Take a look of the data
View(data)

# Total minutes ~ 60 minutes (~ 1 hour of observations)
total_minutes <- sum(data$min)+sum(data$sec)/60+sum(data$cent)/100/60
print(total_minutes)

# Compute the inter-arrival times in minutes
interarrivals <- data$min + data$sec/60 + data$cent/100/60

# Range of the bins for the histogram
bins.range <- 0.3

# Intervals of the histograms
breaks.points1 <- seq(0,max(interarrivals)+1,bins.range)

# Histogram of observed data
x.lab <- 'Minutes'
y.lab <- 'Frequencies'
main.lab <- 'Interarrival times'

hist(interarrivals,breaks=breaks.points1,xlab=x.lab,ylab=y.lab,main=main.lab,
     col='cyan',border='blue',density=30)

# Boxplot of observed data
boxplot(interarrivals,col='cyan',border='blue',horizontal=T,xlab='Minutes',
        main='Interarrival times')

# Customers arrive alone or in groups according to the observed probabilities
# Probability list -> probability vector
break.points2 <- seq(0,max(data$pers),1)

hist(data$pers,xlab='No. of people',breaks=break.points2,
     main='Number of people per arrival',col='red',border='red4',density=30)

# Calculating relative frequencies
p <- table(data$pers)/sum(data$pers)
p.vec <- c(p[[1]],p[[2]],p[[3]],p[[4]])

names(p.vec) <- c('p(1)','p(2)','p(3)','p(4)')

# Vector of observed number of people per arrival
n.of.people <- min(data$pers):max(data$pers)
print(p.vec)

#-------------------------------------------------------------------------------
#                           Simulation
#-------------------------------------------------------------------------------

# Estimated parameters of the exponential distribution
x.rate <- length(data$num)

# Remember that mean = 1/x.rate
# meaning that, on average, we expect a new arrival every 1/74 of an hour.
# (1/74 =~ 0.01355)
# The random number generated using rexp() will be fractions of an hour.
lambda <- x.rate

# Number of simulated samples
n <- 74

# Set.seed()
set.seed(300)

# Let's generate random samples
# The random number generated using rexp() will be fractions of an hour.
simulated <- rexp(n,rate=lambda)

# We expect mean(simulated) =~ 0.01355* of an hour
avg <- mean(simulated)
print(paste('Average inter-arrival time (fraction of an hour)',avg)) # *
print(paste('Average inter-arrival time (minutes)',avg*60))
print(paste('Average inter-arrival time (seconds)',avg*60*60))

# Let's convert the simulated interarrival times into minutes
simulated.min <- simulated * 60

# Let's plot the histogram
breaks.points <- seq(0,max(simulated.min)+1,bins.range)
hist(simulated.min,col='chartreuse',breaks=breaks.points,border='seagreen',density=30)

boxplot(simulated.min,col='chartreuse',border='seagreen',horizontal=T,xlab='Minutes',
        main='Simulated interarrival times')

# Let's simulate the number of people per arrival
people.per.arr <- sample(x=n.of.people,size=n,replace=TRUE,prob=p.vec)

hist(people.per.arr,xlab='No. of people',breaks=break.points2,
     main='Simulated number of people per arrival',col='chartreuse',
     border='seagreen',density=30,angle=30)


