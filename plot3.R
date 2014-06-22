##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
##Upload a PNG file containing your plot addressing this question.

##Install necessary ggplot library
##Download, unzip and assign dataframes

install.packages("ggplot2")

library(ggplot2)
##URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
##download.file(URL, destfile = "./data.zip",method="curl")
##unzip("./data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset for Baltimore data
Balt<-NEI[which(NEI$fips=="24510"),]

##Sum emissions by type and year for Baltimore data
Q3<-aggregate(Balt$Emissions ~Balt$year+Balt$type,data=Balt,FUN="sum")

##Restructure and label data
names(Q3)<-c("Year","Type","Emissions")
Q3_t<-transform(Q3,Type == factor(Type))

##Create plot
png("plot3.png",width=480,height=480)

##Use ggplot2 to plot points and add trendline
qplot(Year,Emissions, data=Q3,geom=c("point","smooth"),method="lm",facets=.~Type)
dev.off()