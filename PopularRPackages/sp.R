# From https://pakillo.github.io/R-GIS-tutorial/
# Another source of code for spatial analysis: http://www.edii.uclm.es/~useR-2013//Tutorials/Bivand.html

library(dismo)

# Plot default map
mymap <- gmap("USA") 
plot(mymap)

# Plot satellite map
mymap <- gmap("USA", type="satellite")
plot(mymap)

# Zoom out
mymap <- gmap("USA", type = "satellite", exp = -1)
plot(mymap)


library(RgoogleMaps)
newmap <- GetMap(center = c(36.7, -5.9), zoom = 10, destfile = "newmap.png",
    maptype = "satellite")

# Now using bounding box instead of center coordinates:
newmap2 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap2.png",
    maptype = "terrain")

# Try different maptypes
newmap3 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap3.png",
    maptype = "satellite")

PlotOnStaticMap(lat = c(36.3, 35.8, 36.4), lon = c(-5.5, -5.6, -5.8), zoom = 10,
    cex = 4, pch = 19, col = "red", FUN = points, add = F)


library(dismo) # check also the nice 'rgbif' package! 
laurus <- gbif("Laurus", "nobilis")
locs <- subset(laurus, select = c("country", "lat", "lon"))
head(locs) # a simple data frame with coordinates
# Discard data with errors in coordinates:
locs <- subset(locs, locs$lat < 90)

coordinates(locs) <- c("lon", "lat") # set spatial coordinates
plot(locs)

crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84") # geographical, datum WGS84
proj4string(locs) <- crs.geo # define projection system of our data
summary(locs)

plot(locs, pch = 20, col = "steelblue")
library(rworldmap)
# library rworldmap provides different types of global maps, e.g:
data(coastsCoarse)
data(countriesLow)
plot(coastsCoarse, add = T)

table(locs$country) # see localities of Laurus nobilis by country
locs.gb <- subset(locs, locs$country == "United Kingdom") # select only locs in UK
plot(locs.gb, pch = 20, cex = 2, col = "steelblue")
title("Laurus nobilis occurrences in UK")

gbmap <- gmap(locs.gb, type = "satellite")
locs.gb.merc <- Mercator(locs.gb) # Google Maps are in Mercator projection. 
# This function projects the points to that projection to enable mapping
plot(gbmap)
points(locs.gb.merc, pch = 20, col="red")

