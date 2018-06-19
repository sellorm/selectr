#!/usr/bin/env Rscript
cat(R.version.string, "\n")
num_pkgs <- length(installed.packages()[,1])
cat("Number of installed Packages:", num_pkgs, "\n")
cat("Default CRAN:", options()$repos, "\n")
cat("Default library paths:", .libPaths(), "\n")
capabilities()
