#Set repo to 0cloud
options('repos' = 'https://cloud.r-project.org/')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
print(path)

.libPaths(new = path)
.Library <- ''

#List of R packages to be installed
libs <- c('BayesFactor','lme4','afex','base64','car','effects','qgraph','hypergeo','lavaan',
	  'logspline','lsmeans','plotrix','rjson','semTools','vcd','vcdExtra','gnm')

#They modified gnm

install.packages(libs,path,'http://cran.us.r-project.org')
