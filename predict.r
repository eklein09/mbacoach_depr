.libPaths("C:/Users/eklein09/Documents/R/win-library/3.2")

# store a copy of system2
# assign("system2.default", base::system2, baseenv())

# create a quiet version of system2
# assign("system2.quiet", function(...)system2.default(..., stdout = FALSE,
                                                     # stderr = FALSE), baseenv())

# overwrite system2 with the quiet version
# assignInNamespace("system2", system2.quiet, "base")

suppressMessages(library(h2o))
# 
suppressMessages(h2o <- h2o.init(nthreads = -1))

# reset system2 to its original version
# assignInNamespace("system2", system2.default, "base")

h2o_gbm <- h2o.loadModel(path = "C:\\GBM_model_R_1447339520801_5")


#args <- commandArgs(trailingOnly = TRUE)
 args <- c("730","3.94","Military","No","No","Bachelors",
     "2009","2014","3","15","Engineering","No","4","1","booth","5")
newdata <- data.frame(t(as.matrix(args)))
colnames(newdata) <-  
  c("gmat","gpa","industry","prohelp",
 "infhelp","degree","gradyear","appyear",
  "collegerank","essayhours","major","sponsored",
 "timeinservice","ID","school","workexp")

newdata[,"gmat"] <- as.integer(newdata[,"gmat"])
newdata[,"gpa"] <- as.numeric(newdata[,"gpa"])
newdata[,"gradyear"] <- as.integer(newdata[,"gradyear"])
newdata[,"appyear"] <- as.integer(newdata[,"appyear"])
newdata[,"collegerank"] <- as.integer(newdata[,"collegerank"])
newdata[,"essayhours"] <- as.integer(newdata[,"essayhours"])
newdata[,"timeinservice"] <- as.integer(newdata[,"timeinservice"])
newdata[,"workexp"] <- as.integer(newdata[,"workexp"])

newdata_hex <- as.h2o(newdata)

as.vector(predict(object = h2o_gbm, newdata = newdata_hex)[,3])

#Shutdown
invisible(h2o.shutdown(prompt  =FALSE))