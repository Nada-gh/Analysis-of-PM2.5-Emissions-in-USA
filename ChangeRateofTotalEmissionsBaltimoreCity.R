##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## check if the data file already exist or not!

zipfile.data = "exdata-data-NEI_data.zip"

if(!file.exists("zipfile.data")) {        
  
  unzip(zipfile="./dataStore/exdata-data-NEI_data.zip",exdir="./dataStore")
} 

## read the RDS file 
myData<-readRDS("summarySCC_PM25.rds")


## Transform the varible "year" to be catogerical!

myData<- transform(myData, year=factor(year))


## Extract the data entries for only Baltimore City, Maryland

BCdata <- subset(myData, fips == "24510") 

## Caculate the mean value of the PM2.5 emissions in Baltimore City at each year in [1999,2002,2005,2008]
MeanData<-aggregate(Emissions~year,BCdata,mean)

dev.copy(png, file="plot2.png", width=480, height=480)

## Visualize the average data of the PM2.5 emissions in Baltimore City
barplot(MeanData$Emissions,names.arg=MeanData$year,ylab=expression('Average PM'[2.5]*' emission'),main=expression('Average PM'[2.5]*' emissions in Baltimore City at various years'),col= MeanData$year)


dev.off()


