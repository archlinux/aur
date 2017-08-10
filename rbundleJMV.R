
#Set repo to 0cloud
options('repos' = 'https://cloud.r-project.org/')

#Grab library dir
path <- commandArgs(trailingOnly = TRUE)
.libPaths(new = path)
print(path)

libs <- c('jmv','devtools') #For some reason, this will not work;
# It pulls in jmvcore, which you then have to overwrite using the github jmvcore, and no output will appear.
#libs <- c('R6','car','multcomp','ggplot2','PMCMR','lsmeans','vcd','vcdExtra','GGally','BayesFactor','psych','GPArotation','afex','mvnormtest','lavaan','ggjoy','purr','semPlot','exact2x2','testthat')
install.packages(libs,lib=path)
library(devtools)
install_github('jamovi/jmvcore',lib=path)
