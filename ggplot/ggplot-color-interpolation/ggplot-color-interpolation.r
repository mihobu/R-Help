require(ggplot2)

# scatter plot from Wickham's book (2e, p. 15):
ggplot(mpg, aes(displ, cty, colour=class)) + geom_point()

# Same plot with a different color palette
ggplot(mpg, aes(displ, cty, color=class)) +
  geom_point() +
  scale_color_brewer(palette="Spectral")

# Let's plot the number of cars from each manuracturer
df.mfg <- data.frame(sort(table(mpg$manufacturer)))

# Default plot
ggplot(df.mfg, aes(Var1, Freq, fill=Var1)) +
  geom_bar(stat="identity")

# Same thing, but I want to use the "Spectral" color palette
ggplot(df.mfg, aes(Var1, Freq, fill=Var1)) +
  geom_bar(stat="identity") +
  scale_fill_brewer(palette="Spectral")

# Note that this gives a warning because the spectral palette
# has only 11 colors, and we've got 15 different categories.

# We can interpolate any number of colors using the colorRampPalette function.
getPalette <- colorRampPalette(brewer.pal(11, "Spectral"))
numColors <- length(unique(mpg$manufacturer))
myPalette <- getPalette(numColors)

ggplot(df.mfg, aes(Var1, Freq, fill=Var1)) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=myPalette, name='Manufacturer', labels=unique(mpg$manufacturer))

# Same thing, with some added beautification
ggplot(df.mfg, aes(Var1, Freq, fill=Var1)) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=myPalette, name='Manufacturer', labels=unique(mpg$manufacturer)) +
  scale_y_continuous(name='', breaks=seq(0,50,5), minor_breaks=FALSE) +
  scale_x_discrete(name='', breaks=FALSE) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks  = element_blank()
  )

