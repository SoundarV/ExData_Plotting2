##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##Upload a PNG file containing your plot addressing this question.


##Steps to Download, unzip and assign dataframes

##URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
##download.file(URL, destfile = "./data.zip",method="curl")
##unzip("./data.zip")

##I have unzipped files in working directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset for Baltimore data
Balt<-NEI[which(NEI$fips=="24510"),]

##Sum emissions by year for Baltimore data
result<-rowsum(Balt$Emissions, Balt$year)

##Structure and relabel dataframe
year<-c(1999,2002,2005,2008)
Q2<-cbind(year,result)
Q2<-data.frame(Q2)
names(Q2)<-c("Year","Emissions")

##Create plot
png("plot2.png",width=480,height=480)

##Plot points and add trendline to show decrease
plot(Q2$Year,Q2$Emissions,pch=20, main="Baltimore Emissions Over Time", xlab="Year", ylab="Emissions")
fit<-glm(Q2$Emissions~Q2$Year)
co<-coef(fit)
abline(fit,col="blue",lwd=2)
dev.off()
