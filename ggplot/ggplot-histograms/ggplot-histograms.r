# Generate some histograms

# Simplest form, no frills
ggplot(trees, aes(Height)) + geom_histogram()

# Set the number of bins  
ggplot(trees, aes(Height)) + geom_histogram(bins=10)

# Add density curve in black
ggplot(trees, aes(Height)) + 
  geom_histogram(aes(y=..density..), bins=10) +
  geom_line(stat='density', size=1)

# Add normal density curve in red
m <- mean(trees$Height)
s <- sd(trees$Height)
ggplot(trees, aes(Height)) + 
  geom_histogram(aes(y=..density..), bins=10) +
  geom_line(stat='density', size=1) +
  stat_function(fun=dnorm, args=list(mean=m, sd=s), colour='red', size=1)

