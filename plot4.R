##Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
##Upload a PNG file containing your plot addressing this question.

##Download, unzip and assign dataframes
##URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
##download.file(URL, destfile = "./data.zip",method="curl")
##unzip("./data.zip")

##I have unzipped files in working directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset SCC for SCC IDs that are related to coal
##Subset NEI data for the SCC IDs that are related to coal
Coal<-SCC$SCC[grep("[Cc]oal",SCC$EI.Sector)]
Coal_data<-NEI[NEI$SCC %in% Coal,]

##Sum emissions by year for coal data
Q4<-aggregate(Coal_data$Emissions ~Coal_data$year,data=Coal_data,FUN="sum")

##Relabel dataframe
names(Q4)<-c("Year","Emissions")

##Create plot
png("plot4.png",width=480,height=480)

##Plot points and add trendlines
plot(Q4$Year,Q4$Emissions,pch=20,main="Coal Emissions Over Time",xlab="Year",ylab="Emissions")
fit<-glm(Q4$Emissions~Q4$Year)
co<-coef(fit)
abline(fit,col="blue",lwd=2)
dev.off()