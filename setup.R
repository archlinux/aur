#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

if (!require("remotes",quietly=TRUE))
  install.packages("remotes",
                   lib=args[1],
                   repo="https://cloud.r-project.org/")

remotes::install_local("ledgerplots",lib=args[1])
