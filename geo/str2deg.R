########################################################################################
# Convert data formated in degrees, minutes and seconds to decimal degrees
# Author: David March
# Contact: dmarch@socib.es
#
# Rationale:
# Most libraries convert DMS to degrees when DMS are found in different columns.
# However, DMS format is often found in a single attribute column and multiple formats.
# This scripts converts text strings into numeric decimal degrees
########################################################################################


rm(list=ls(all=TRUE)) #reset data

#--------------------------------------------------------------------------------
# str2deg   String of DegreesMinutesSeconds to decimal degrees
#--------------------------------------------------------------------------------
str2deg <- function(x,format=c(deg="º", min="'", sec="''", dir="[NSWE]")){
  # Arguments:
  # x         vector of coordinates
  # format    string specifying format for each element
  #
  # Value:
  # vector of decimal degrees
  #
  # Dependencies:
  # stringr and gmt packages
  
  require(stringr)
  require(gmt)
  
  # Identify location of markers
  d.pos <- str_locate(x, format[["deg"]])[,1]
  m.pos <- str_locate(x, format[["min"]])[,1]
  s.pos <- str_locate(x, format[["sec"]])[,1]
  c.pos <- str_locate(x, format[["dir"]])[,1]
  
  # Extract DMS data
  dd<-as.numeric(str_sub(x,start=1,end=d.pos-1))
  mm<-as.numeric(str_sub(x,start=d.pos+1,end=m.pos-1))
  ss<-as.numeric(str_sub(x,start=m.pos+1,end=s.pos-1))
  C<-str_sub(x,c.pos)

  # Convert to DMS standard form from GMT library
  dms <- paste(paste(dd,mm,ss,sep=":"),C,sep="")
  
  # Convert DMS to decimal degrees
  output<- deg2num(dms)
  #attr(output,"names")<-NULL
  output
}
#--------------------------------------------------------------------------------

##### Example

# import data
data <- read.csv("sample_coords.csv", sep=";", header=TRUE)

# convert formats
data$lat.dd<-str2deg(data$latitude,format=c(deg="º", min="'", sec="[NSWE]", dir="[NSWE]")) #Note that no sign for seconds, and cardinal directions is used instead
data$lon.dd<-str2deg(data$longitude,format=c(deg="º", min="'", sec="[NSWE]", dir="[NSWE]"))

data

