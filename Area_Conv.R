{memory.limit(size = 2*memory.limit())
require(raster)
require(rgdal)
library(doParallel) #Package for loop functions in parallel computing
numCores <- detectCores() #Detect the number of CPU cores on the current host. It is important for parallel computing
registerDoParallel(numCores)} #Register the parallel backend with the foreach package

list = list.files("./Area", full.names = T, pattern = ".tif$")
SDM <- stack(list)
#hist = hist(SDM, maxpixels = 735000, breaks = 10)
#text(hist$mids,hist$counts,labels=hist$counts, adj=c(0.5, -0.5))
#hist
#plot(SDM, zlim = c(0.5, 1))
#image(SDM, zlim = c(0.5, 1))

perc_aa = foreach(i = seq_along(list), .packages = "raster", .combine = rbind) %dopar% {
cell_area = area(SDM[[i]]) #Calculate cell area in Km2
Ncells = as.data.frame(freq(SDM[[i]]))
total_area = (Ncells[1,2]+Ncells[2,2])*cell_area@data@max
threshold_area = Ncells[2,2]*cell_area@data@max #Threshold of 0.5
(threshold_area*100)/total_area} #Suitable area percentage according to threshold

{row.names(perc_aa) = unique(names(SDM))
perc_aa}

