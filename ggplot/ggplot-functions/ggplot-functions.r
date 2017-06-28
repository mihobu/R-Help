require(ggplot2)

# Create a "dummy" data frame (not sure why, but ggplot seems to need this)
df <- data.frame(x=0) # We need a "dummy" data frame

# plot a built-in function (sine)
ggplot(df) + stat_function(fun=sin) +
  xlim(-pi, pi) # You need to provide x limits or you'll get an error

# plot a custom function
fn <- function(x) { x^3 + x^2 - 8*x - 8 }
ggplot(df) + stat_function(fun=fn) + xlim(-5, 5)

