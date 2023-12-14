#Peguins Statistical Analysis and Visualization

# Penguins Data
#install.packages("palmerpenguins")
citation("palmerpenguins")    ##Credits

library(palmerpenguins)
data(package = 'palmerpenguins')
?penguins                     ##Data Info


# Load visualization packages
library(RColorBrewer)
library(vioplot)

## Remove missing data
dt<- na.omit(penguins)
str(dt)

# Add colors
colr<- c( '#a8e6cf', '#dcedc1', '#ffd3b6', '#ffaaa5', '#ff8b94')


# Plots

# Histogram 

hist(dt$body_mass_g, breaks = 8, ylim = c(0,100), col = '#ffaaa5', main = 'Histogram of Penguin Body Mass in g', xlab = 'Body Mass (g)')


# Scatterplot
# Comparing bill length and bill depth

plot(dt[, 3:4], col = colr[dt$species], pch = 19, main="Bill Length vs Bill Depth in mm", xlab='Bill Length (mm)', ylab='Bill Depth (mm)')

legend(legend=c("Adelie", "Gentoo", "Chinstrap"), "bottomleft", fill=c("#a8e6cf", "#dcedc1", "#ffd3b6"), title="Species" )

# Comparing bill length and flipper length

plot(dt[, 3, 5], col = colr[dt$species], pch = 19, main="Bill Length vs Flipper Length in mm", xlab='Bill Length (mm)', ylab='Flipper Length (mm)')

legend(legend=c("Adelie", "Gentoo", "Chinstrap"), "bottomleft", fill=c("#a8e6cf", "#dcedc1", "#ffd3b6"), title="Species" )


# Boxplot

boxplot(dt$species)

boxplot(dt$bill_length_mm, dt$bill_depth_mm, main="Bill Length and Bill Depth in mm", names=c("Bill Length (mm)", "Bill Depth (mm)"), col=c("#a8e6cf", "#dcedc1"))


# Violin Plot 
with (dt, vioplot(dt$flipper_length_mm, names=c('Flipper Length'), ylab = "mm", main = "Flipper Length in mm", col = c("#dcedc1") ))


# Stacked Bar plot
table(dt$island, dt$sex)
barplot(table(dt$island, dt$sex), ylim = c(0,225), main = "Penguin Population by Gender Across Three Islands", xlab='Gender', col = colr, legend = rownames(table(dt$island, dt$sex)))



# Create Multiple plots

par(mfrow = c(3,2))


