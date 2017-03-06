#####Metaanalysis and metaregression for hazard ratios#####
library(meta)
H_pylori_meta <- H_pylori_meta[-15,]
TempDF <- H_pylori_meta[complete.cases(H_pylori_meta$HR_1, H_pylori_meta$high),]
logHR <- log(TempDF$HR_1)
logSE <- (log(TempDF$high)-log(TempDF$HR_1)) / qnorm(0.975)
res <- NULL
res <- metagen(logHR, logSE, data=TempDF, sm="HR", studlab=`Study: authors, year`, comb.fixed=FALSE,
               comb.random=TRUE, prediction=FALSE)
res
par(lwd=1, las=1, family="sans", cex=1, mgp=c(3.0,1,0))
hp_meta.cuml <- metacum(res)
hp_meta.cuml
forest.meta(res,sortvar=TE)

forest(hp_meta.cuml)

x11(width=7, height=7); par(lwd=1, las=1, family="sans", cex=1, mgp=c(3.0,1,0))
funnel(res)
metabias(res)