##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


##install.packages("ggplot2")
library(ggplot2)


## Read our data
myData<-readRDS("summarySCC_PM25.rds")


## Read the Source Classification Code file
cdData <- readRDS("Source_Classification_Code.rds")


## Transform the varibles "year" & "type" to be catogerical!
myData<- transform(myData, year=factor(year))


## Subset only the data with only the coal combustion-related sources in the Source Classification Code file
CoalDta<- cdData[grep("Coal",cdData$EI.Sector),]


## Subset only the "CoalDta" observations from myData file
mrg <- myData[CoalDta$SCC %in% myData$SCC,]
 
###
##dev.copy(png,file="plot3.png", width=480, height=480)

dev.copy(png, file="plot4.png", width=480,height=480)
##png("plot4.png")

n <- ggplot(mrg,aes(year,Emissions,fill=year))+ geom_bar(stat="identity")

n +xlab("Year")+ ylab("Emissions")+ggtitle("PM2.5 Emissions from coal combustion-related sources variation from 1999–2008")

dev.off()


