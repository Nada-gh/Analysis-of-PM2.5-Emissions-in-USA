## In this code, I am trying to answer the given scintific question "Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system,
## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008 ? " 

## check if the data file already exist or not!

zipfile.data = "exdata-data-NEI_data.zip"

if(!file.exists("zipfile.data")) {        
  
  unzip(zipfile="./dataStore/exdata-data-NEI_data.zip",exdir="./dataStore")
} 

## read the RDS file 
myData<-readRDS("summarySCC_PM25.rds")


## Transform the varible "year" to be catogerical!

myData<- transform(myData, year=factor(year))

## Calculate the mean value for all the emissions at each year
avg.emissions <- summarise(group_by(myData, year), Emissions=mean(Emissions))


##
dev.copy(png, file="plot1.png", width=480, height=480)

## Use the function "barplot" to visualize the averaged emissions at each of the four years 1999,2002,2005,2008
barplot(height=avg.emissions$Emissions,names.arg=total.emissions$year,xlab = "Years", ylab=expression('Average PM'[2.5]*' emissions'),main=expression('Average PM'[2.5]*' emissions through several years in tons'),col= avg.emissions$year)


dev.off()

## from the bar plot, I can say that there was a big improvment in the emissions of the PM2.5 during the period from 
## 1999 to 2002. However, it seems that the change was pretty small in the period from 2002 to 2005. Later on, we had 
## a positive falling of the emission readings again during the period 2005-2008.
