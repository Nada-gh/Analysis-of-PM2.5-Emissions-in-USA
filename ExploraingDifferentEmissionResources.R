## In this code, I am trying to answer the given scintific question "Of the four types of sources indicated by the 
##type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
##from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?  
##

install.packages("RColorBrewer")
install.packages("ggplot2")


## check if the data file already exist or not!


## read the RDS file 
myData<-readRDS("summarySCC_PM25.rds")


## Transform the varibles "year" & "type" to be catogerical!

myData<- transform(myData, year=factor(year))
myData<- transform(myData, type=factor(type))

## subset only the data of the Baltimore City, Maryland
BCdata<- subset(myData, fips=="24510")

## Saving the plot in PNG file
dev.copy(png,file="plot3.png", width=480, height=480)

## use some sensible colour schemes from RColorBrewer package for the plot

library(RColorBrewer)
colo<-c("#ffffb2","#fecc5c","#fd8d3c","#e31a1c")

main<- ggplot(BCdata,aes(year,log(Emissions), fill=type))+geom_boxplot()
main+scale_fill_manual(name="Type",labels=c("POINT","NONPOINT","ON-ROAD","NON-ROAD"),values = colo)+theme_bw() +xlab("YEAR")+ylab("Log(PM2.5)")


dev.off()

## from the plot we can see the situation differs from on type of emission to another. for example, we see that emissions of the
## "Point" type has its maximum in 2005 to return to decrease again in 2008. On the other hand, it is very clear that the change
## of the emission values from 1999 to 2008 is very promising for the "Non-point" type.