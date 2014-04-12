add.alpha <- function(COLORS, ALPHA){
  # Description:
  # Add transparency to a color
  #
  # Arguments:
  # COLORS: eg "red"
  # ALPHA: transparency (between 0 and 1)
  #
  # Source: http://menugget.blogspot.com.es/2012/04/adding-transparent-image-layer-to-plot.html
  if(missing(ALPHA)) stop("provide a value for alpha between 0 and 1")
  RGB <- col2rgb(COLORS, alpha=TRUE)
  RGB[4,] <- round(RGB[4,]*ALPHA)
  NEW.COLORS <- rgb(RGB[1,], RGB[2,], RGB[3,], RGB[4,], maxColorValue = 255)
  return(NEW.COLORS)
}