require(rgdal)
require(raster)

#importando vari?veis preditoras ####
#Present
Lista <- list.files("./bio", full.names = T, pattern = ".tif$")
Env <- stack(Lista)
#plot(Env)

Base <- readOGR("./SP.shp")
#Base

Knife <- mask(crop(Env, Base), Base)
#plot(Knife)

for (i in c(1:19)) {
  writeRaster(Knife[[i]], paste0("./Crop/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}

#Future rcp26
ListaF26 = list.files("./rcp26", full.names = T, pattern = ".tif$")
EnvF26 = stack(ListaF26)
plot(EnvF26)

KnifeF26 <- mask(crop(EnvF26, Base), Base)
plot(KnifeF26)

for (i in c(1:19)) {
  writeRaster(KnifeF26[[i]], paste0("./F26/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}

#Future rcp45
ListaF45 = list.files("./rcp45", full.names = T, pattern = ".tif$")
EnvF45 = stack(ListaF45)
plot(EnvF45)

KnifeF45 <- mask(crop(EnvF45, Base), Base)
plot(KnifeF45)

for (i in c(1:19)) {
  writeRaster(KnifeF45[[i]], paste0("./F45/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}

#Future rcp60
ListaF60 = list.files("./rcp60", full.names = T, pattern = ".tif$")
EnvF60 = stack(ListaF60)
plot(EnvF60)

KnifeF60 <- mask(crop(EnvF60, Base), Base)
plot(KnifeF60)

for (i in c(1:19)) {
  writeRaster(KnifeF60[[i]], paste0("./F60_MR/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}

#Future rcp85
ListaF85 = list.files("./rcp85", full.names = T, pattern = ".tif$")
EnvF85 = stack(ListaF85)
plot(EnvF85)

KnifeF85 <- mask(crop(EnvF85, Base), Base)
plot(KnifeF85)

for (i in c(1:19)) {
  writeRaster(KnifeF85[[i]], paste0("./F85/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}


#Past
Lista_past = list.files("./Past", full.names = T, pattern = ".tif$")
Env_past = stack(Lista_past)
plot(Env_past)

Knife_past <- mask(crop(Env_past, Base), Base)
plot(Knife_past)

for (i in c(1:19)) {
  writeRaster(Knife_past[[i]], paste0("./Past/", "bio_", sprintf("%02d", 1:19)[i]), format = "GTiff")
}


Crop = list.files("./Crop", full.names = T, pattern = ".tif$")
EnvC = stack(Crop)
plot(EnvC)

#writeRaster(env2, "./WC_SA/", format = "GTiff", bylayer = T, suffix = "names")