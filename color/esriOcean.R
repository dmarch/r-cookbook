esri.ocean <- function(scale="small", breaks=FALSE, alpha=1){
  #
  # Description
  #
  # This function provides color palette or breakpoints used in the ESRI Ocean Basemap
  # Source: http://blogs.esri.com/esri/arcgis/2012/08/02/esri-ocean-basemap-color-style-available-for-download/
  #
  #
  # Arguments
  #
  # scale: Scale of the map to use more or less colors. Accepts "small" or "medium"
  # breaks: If FALSE function returns the colors, if TRUE function returns the bathymetric breaks.
  # alpha: transparency, between 0 and 1
  #
  #
  # TODO:
  # validate arguments
  #
  #  
  # Example
  #
  # library(raster)
  # library(marmap)
  # data(hawaii)
  #  
  # # transform DEM to raster
  # rmap <- marmap::as.raster(hawaii)             
  #
  # # create hillshae
  # slope <- terrain(rmap, opt='slope')
  # aspect <- terrain(rmap, opt='aspect')
  # hill <- hillShade(slope, aspect, 45, 270)
  #  
  # # plot
  # png(filename="bati.png",width=1900, height=1450, res= 150)
  # plot(hill, col=grey(0:100/100), legend=FALSE, asp=1)
  # plot(rmap, breaks=esri.ocean(scale="medium",breaks=TRUE),
  #     col=esri.ocean(scale="medium", alpha=0.5),
  #     legend=FALSE, add=TRUE)
  # dev.off()
   
  if(alpha<0 | alpha>1) stop("alpha is defined between 0 and 1")
  
  if (scale=="medium"){
    
    # Define ESRI Ocean palette (Medium scale)
    red <- c(56,43,66,82,98,134,149,170,181,191,209)
    green <- c(91,102,124,143,159,179,188,207,215,224,233)
    blue <- c(140,166,179,204,217,235,230,242,247,255,255)
    breakpoints <- c(-9500,-8500,-7000,-6000,-4500,-3000,-1000.-400.-150,-35,0)
  }
  if (scale=="small"){
    # Define ESRI Ocean palette (Small scale)
    red <- c(41,89,115,133,148,166,186)
    green <- c(97,148,166,179,194,206,222)
    blue <- c(156,204,224,235,247,245,255)
    breakpoints <- c(-7999,-6011,-5015,-4071,-1349,-121,0)
  }
  cols<- adjustcolor(rgb(red,green,blue, max = 255),alpha.f=alpha)
  out<- if (breaks==FALSE) cols else breakpoints
  return(out)
}




