# read table
data<-read.table("batmallorca.txt",dec=",")
names(data)<-c("lon","lat","bat")

# convert to class spatial
require(sp)
coordinates(data)=~lon+lat

# define coordinate system
proj4string(data) <- CRS("+init=epsg:4326")

# transform to utm
require(rgdal)
data.utm<- spTransform(data, CRS=CRS("+init=epsg:25831"))
data.utm<-data.frame(data.utm)

# export data
data<- data.frame(x=round(data.utm$lon),y=round(data.utm$lat),z=data.utm$bat)
write.table(data,"batmallorca_utm.txt",row.names=F,dec=",",sep="\t")
