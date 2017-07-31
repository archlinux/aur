#Set repo to 0cloud
options('repos' = 'https://cloud.r-project.org/')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
.libPaths(new = path)
print(path)

libs <- c('jmvcore','ggplot2','R6','RProtoBuf','devtools')

install.packages(libs,lib=path)
library(devtools)
install_github('jamovi/jmvcore',lib=path)
