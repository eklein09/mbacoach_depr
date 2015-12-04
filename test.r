.libPaths("C:/Users/eklein09/Documents/R/win-library/3.2")

# store a copy of system2
# assign("system2.default", base::system2, baseenv())

# create a quiet version of system2
# assign("system2.quiet", function(...)system2.default(..., stdout = FALSE,
# stderr = FALSE), baseenv())

# overwrite system2 with the quiet version
# assignInNamespace("system2", system2.quiet, "base")

library(data.table)

args <- commandArgs(trailingOnly = TRUE)
data.table(t(as.matrix(args)))