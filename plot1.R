##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
##Upload a PNG file containing your plot addressing this question.


##Steps to Download, unzip and assign dataframes

##URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
##download.file(URL, destfile = "./data.zip",method="curl")
##unzip("./data.zip")

##I have unzipped files in working directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Sum emissions by year
result<-rowsum(NEI$Emissions, NEI$year)

##Properly structure and label dataframe
year<-c(1999,2002,2005,2008)
Q1<-cbind(year,result)
Q1<-data.frame(Q1)
names(Q1)<-c("Year","Emissions")

##Create plot
png("plot1.png",width=480,height=480)

##Plot points and add trendline to show decrease
plot(Q1$Year,Q1$Emissions,pch=20, main="Overall Emissions Over Time", xlab="Year", ylab="Emissions")
fit<-glm(Q1$Emissions~Q1$Year)
co<-coef(fit)
abline(fit,col="blue",lwd=2)
dev.off()
