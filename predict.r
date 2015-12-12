#EDIT THIS PATH TO POINT TO THE R PACKAGE INSTALLATION DIRECTORY FOR YOUR MACHINE
.libPaths("C:/Users/eklein09/Documents/R/win-library/3.2")

suppressMessages(library(h2o))
suppressMessages(library(data.table))

suppressMessages(h2o <- h2o.init(nthreads = -1))


#GLM Model Name
#EDIT PATH SO THAT IT POINTS TO THE CORRECT DIRECTORY OF THE MODEL ON YOUR SYSTEM
h2o_glm <- h2o.loadModel(path = "C:\\GLM_model_R_1449540108308_5")

args <- commandArgs(trailingOnly = TRUE)

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
#invisible(h2o.shutdown(prompt  =FALSE))
