
#Set repo to 0cloud
options('repos' = 'https://cloud.r-project.org/')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
.libPaths(new = path)
print(path)

libs <- c('jmv')

install.packages(libs,lib=path)
