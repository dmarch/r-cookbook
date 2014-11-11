# Convert coordinate system from shapefile

# import shapefile
library (maptools)
data<-readShapePoints("data/databysite.shp")

# define coordinate system
library (rgdal)
proj4string(data) <- CRS("+init=epsg:32631") #WGS84 UTM 31

# transform projection
data.latlon<- spTransform(data, CRS=CRS("+init=epsg:4326"))

# export into txt formats
data.df<-as.data.frame(data.latlon)
write.table(data.df,"data/data_latlon.csv",sep=";",dec=",",row.names=F)