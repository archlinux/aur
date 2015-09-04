#Set repo to 0cloud
options('repos' = 'http://cran.revolutionanalytics.com')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
print(path)

.libPaths(new = path)

#List of R packages to be installed
libs <- c('BayesFactor','lme4','Rcpp','RInside','afex','base64','car','effects','qgraph','hypergeo','lavaan',
	  'logspline','lsmeans','plotrix','RJSONIO','semTools','vcd','vcdExtra','gnm')

#They modified gnm

install.packages(libs,path,'http://cran.us.r-project.org')
