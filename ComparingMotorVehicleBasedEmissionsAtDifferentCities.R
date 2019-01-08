## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
##Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle 
##emissions?

## read the RDS file 
myData<-readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code file
cdData <- readRDS("Source_Classification_Code.rds")

# Transform the varibles "year" to be catogerical!
myData<- transform(myData, year=factor(year))

## subset only the data of Los Angeles County, California
LAdata<- subset(myData, fips=="06037")


## subset only the data of the Baltimore City, Maryland
BCdata<- subset(myData, fips=="24510")

## subset only the data from motor vehicle sources in the SCC file
MV<- cdData[grep("Motor vehicle",cdData$Short.Name,ignore.case = TRUE),]



# subset only the data from motor vehicle sources of the Baltimore City, Maryland
BC_mv<- BCdata[MV$SCC %in% BCdata$SCC,]

# subset only the data from motor vehicle sources of Los Angeles County, California
LA_mv<- LAdata[MV$SCC %in% LAdata$SCC,]
 
## Combine both files
Tot<- rbind(BCdata,LAdata)
require(ggplot2)
graphics.off()

## Saving the plot in PNG file
png(file="plot6.png", width=480, height=480)

L<- ggplot(Tot,aes(year,Emissions, fill=factor(fips)))+geom_bar(stat="identity")
L+scale_fill_manual(name="County",labels=c("Los Angeles City","Baltimore City"),values = c("red","green"))+xlab("YEAR")+ylab("PM2.5 Emissions") +ggtitle("The change of Emissions from motor vehicle sources from 1999–2008 in Baltimore City VS. Los Angles")


dev.off()




