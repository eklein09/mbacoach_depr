.libPaths("C:/Users/eklein09/Documents/R/win-library/3.2")

# store a copy of system2
# assign("system2.default", base::system2, baseenv())

# create a quiet version of system2
# assign("system2.quiet", function(...)system2.default(..., stdout = FALSE,
                                                     # stderr = FALSE), baseenv())

# overwrite system2 with the quiet version
# assignInNamespace("system2", system2.quiet, "base")

suppressMessages(library(h2o))
suppressMessages(library(data.table))
#
suppressMessages(h2o <- h2o.init(nthreads = -1))

# reset system2 to its original version
# assignInNamespace("system2", system2.default, "base")

#GBM Model Name
#h2o_gbm <- h2o.loadModel(path = "C:\\GBM_model_R_1447339520801_5")

#GLM Model Name
h2o_glm <- h2o.loadModel(path = "C:\\GLM_model_R_1449194948596_10")

args <- commandArgs(trailingOnly = TRUE)
#args <- c("730","3.94","Military","No","No","Bachelors",
#     "2009","2014","3","15","Engineering","No","4","1","booth","5")

newdata <- data.table(t(as.matrix(args)))

colnames(newdata) <- c("gmat","gpa","industry","prohelp",
 "infhelp","degree","gradyear","appyear",
  "collegerank","essayhours","major","sponsored",
 "timeinservice","ID","school","workexp")

newdata[, gmat := as.integer(gmat) ]
newdata[, gpa := as.numeric(gpa) ]
newdata[, gradyear := as.integer(gradyear) ]
newdata[, appyear := as.integer(appyear) ]
newdata[, collegerank := as.integer(collegerank) ]
newdata[, essayhours := as.integer(essayhours) ]
newdata[, timeinservice := as.integer(timeinservice) ]
newdata[, workexp := as.integer(workexp) ]
newdata[, industry := as.factor(industry)]

allschools <- newdata[rep(seq_len(nrow(newdata)), each=15),]
allschools[, school := c("hbs","stanford","wharton","booth","sloan",
                                       "kellogg","haas","tuck",
                                       "darden", "fuqua","columbia",
                                       "anderson","stern","yalesom","ross") ]

allschools[, school := as.factor(school)]
allschools[, major := as.factor(major)]
allschools[, prohelp := as.factor(prohelp) ]
allschools[, infhelp := as.factor(infhelp) ]
allschools[, degree := as.factor(degree) ]
allschools[, sponsored := as.factor(sponsored) ]


newdata_hex <- as.h2o(allschools)

as.vector(predict(object = h2o_glm, newdata = newdata_hex)[,3])

#Shutdown
invisible(h2o.shutdown(prompt  =FALSE))
