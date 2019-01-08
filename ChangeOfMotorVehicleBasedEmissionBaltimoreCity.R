
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## read the RDS file 
myData<-readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code file
cdData <- readRDS("Source_Classification_Code.rds")

# Transform the varibles "year" to be catogerical!
myData<- transform(myData, year=factor(year))

## subset only the data of the Baltimore City, Maryland
BCdata<- subset(myData, fips=="24510")


## subset only the data from motor vehicle sources of the Baltimore City, Maryland
MV<- cdData[grep("Motor vehicle",cdData$Short.Name,ignore.case = TRUE),]
           
           
finl<- BCdata[MV$SCC %in% BCdata$SCC,]


## Saving the plot in PNG file
dev.copy(png,file="plot5.png", width=480, height=480)

plt<- ggplot(finl,aes(year,Emissions, fill=year))+geom_bar(stat="identity")
plt+theme_bw() +xlab("YEAR")+ylab("PM2.5 Emissions")+ggtitle("The change of Emissions from motor vehicle sources from 1999–2008 in Baltimore City")

dev.off()

