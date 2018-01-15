#Set repo to 0cloud
options('repos' = 'https://cloud.r-project.org/')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
print(path)

.libPaths(new = path)
.Library <- ''

#List of R packages to be installed

# For < .8.4
#libs <- c('BayesFactor','lme4','afex','base64','car','effects','qgraph','hypergeo','lavaan',
#	  'logspline','lsmeans','plotrix','rjson','semTools','vcd','vcdExtra','gnm')

# For > .8.4
libs <- c('BAS', 'BayesFactor', 'GPArotation', 'IsingSampler', 'SuppDists', 'afex', 'car', 'conting', 'corpcor', 'doSNOW', 'dplyr', 'foreach', 'ggplot2', 'gtools', 'hmeasure', 'hypergeo', 'lavaan', 'logspline', 'lsmeans', 'metafor', 'multcomp', 'mvtnorm', 'plotrix', 'plyr', 'psych', 'qgraph', 'reshape2', 'rjson', 'semTools', 'snow', 'stringr', 'vcd', 'vcdExtra','devtools')

install.packages(libs,path,'http://cran.us.r-project.org')

# bootnet
devtools::install_github("SachaEpskamp/bootnet",lib=path)
