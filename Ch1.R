#prepare packages
library(ggplo2)
library(gcookbook)
library(MASS)
#before import package xlsx
library(rJava)
library(xlsxjars)
library(xlsx)
library(gdata)
library(foreign)


plot(mtcars$wt,mtcars$mpg)
#plot(log(mtcars$wt),log(mtcars$mpg))
qplot(mtcars$wt,mtcars$mpg)

#Another way is:
qplot(wt, mpg, data=mtcars)
# This is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

plot(pressure$temperature,pressure$pressure, type="l")
#plot(log(pressure$temperature),log(pressure$pressure), type="l")
#plot(sqrt(pressure$temperature),sqrt(pressure$pressure), type="l")
#adding points
points(pressure$temperature, pressure$pressure)
#adding another line
lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")
#in ggplot2:
qplot(pressure$temperature, pressure$pressure, geom="line")
#or :
qplot(temperature, pressure, data=pressure, geom="line")
# This is equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()


# Lines and points together
qplot(temperature, pressure, data=pressure, geom=c("line", "point"))
# Equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()



table(mtcars$cyl)
# Generate a table of counts
barplot(table(mtcars$cyl))

#qplot(BOD$Time, BOD$demand, geom="bar")
# Convert the x variable to a factor, so that it is treated as discrete
#qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")

ggplot(data=BOD,aes(x=Time,y=demand))+ geom_bar(stat="identity",position="stack")

ggplot(data=BOD,aes(x=reorder(factor(Time),demand),y=demand))+
	geom_bar(stat="identity",position="stack")

ggplot(data=BOD,aes(x=reorder(Time,demand, order =T),y=demand))+
	geom_bar(stat="identity",position="stack")



hist(mtcars$mpg)
# Specify approximate number of bins with breaks
hist(mtcars$mpg, breaks=10)

qplot(mpg, data=mtcars, binwidth=4)
# This is equivalent to:
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)



plot(ToothGrowth$supp, ToothGrowth$len)

# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)
# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")


# Using three separate vectors
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len,
geom="boxplot")
# Alternatively, get the columns from the data frame
qplot(interaction(supp, dose), len, data=ToothGrowth, geom="boxplot")
# This is equivalent to:
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()

curve(x^3 - 5*x, from=-4, to=4)

# Plot a user-defined function
myfun <- function(xvar) {
1/(1 + exp(-xvar + 10))
}
curve(myfun(x), from=0, to=20)
# Add a line:
curve(1-myfun(x), add = TRUE, col = "red")


# This sets the x range from 0 to 20
#qplot(c(0,20), fun=myfun, stat="function", geom="line")
# This is equivalent to:
ggplot(data.frame(x=c(0, 20)), aes(x=x)) + stat_function(fun=myfun, geom="line")









