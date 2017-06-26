
# find the minimum and maximum depth values for each different cut:
agg <- aggregate(depth ~ cut, diamonds, range)

# put these figures into a data frame
df <- data.frame(cut=agg$cut, min=agg$depth[,1], max=agg$depth[,2])

# add category number (we'll use this for drawing our floating bar chart)
df$id <- seq(1,5)

# bare bones floating bar chart:
ggplot(df, aes(fill=cut)) +
  geom_rect(aes(xmin=min, xmax=max, ymin=id, ymax=id+1))

# add some space between the bars
ggplot(df, aes(fill=cut)) +
  geom_rect(aes(xmin=min, xmax=max, ymin=id+0.05, ymax=id+0.95))

# Label the bars on the plot, rather than using a legend:
ggplot(df, aes(fill=cut)) +
  geom_rect(aes(xmin=min, xmax=max, ymin=id+0.05, ymax=id+0.95)) +
  geom_text(aes(x=41, y=id+0.5, label=cut), hjust=1, vjust=0.5) + # labels
  guides(fill=FALSE) # turn off the legend

# Add some visual goodness
ggplot(df, aes(fill=cut)) +
  geom_rect(aes(xmin=min, xmax=max, ymin=id+0.05, ymax=id+0.95)) +
  geom_text(aes(x=41, y=id+0.5, label=cut), hjust=1, vjust=0.5) + # labels
  guides(fill=FALSE) + # turn off the legend
  scale_x_continuous(name='Range of depth values', limits=c(35, 80), breaks=c(43,seq(50,70,10),79), minor_breaks=seq(43,80,1), labels=c(43, seq(50,70,10), 79), expand=c(0,0)) +
  scale_y_continuous(name='Cut', breaks=NULL, limits=c(1,6)) +
  theme(
    axis.ticks=element_blank(), # no tick marks
    plot.margin = unit(c(0.125,0.125,0.25,0.125), "in") # margins
  )


