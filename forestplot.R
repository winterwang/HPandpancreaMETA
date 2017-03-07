library(forestplot)

tabletext<-cbind(
  c("", "Study: authors, year", "Raderer et al. 1998",
    "Stolzenberg-Solomon et al. 2001", "Wadstrom et al. 2004",
    "Lindkvist et al. 2008", "De Martel et al. 2008",
    "Risch et al. 2010", "Risch et al. 2013",
    "Shimoyama et al. 2010", "Schulte et al. 2015",
    "Gawin et al. 2012", "Hsu et al. 2014",
    "Qiao et al. 2012", "Dou et al. 2008",
    "Current study", NA, "Overall (Random Effect Model)"),
  c("Cases", NA, "92", "121",
    "45", "87", "104", "373",
    "761",  "19", "580", "139",
    "11",  "63",  "85", "360",  NA, NA),
  c("Control", NA, "62", "226",  "45",
    "263", "262", "690", "794",  "34",
    "626", "177",  "11", "100", "136", "377",  NA, NA),
  c("", "Odds Ratios (95% CI)", "2.10 (1.10-4.10)",
    "1.87 (1.05-3.34)", "1.55 (0.62-3.88)", "1.25(0.75-2.09)", 
    "0.85(0.49-1.48)",  "1.34 (0.94-1.92)", "0.62 (0.50-0.77)",
    "0.92 (0.19-4.36)", "1.00 (0.74-1.35)", "1.27 (0.64-2.61)",
    "2.77 (0.76-7.39)", "2.37 (1.24-4.55)", "1.96 (1.12-3.42)",
    "1.39 (1.00-1.91)", NA, "1.34 (1.03-1.75)"))

pylorimeta <- 
  structure(list(
    mean  = c(NA, NA, 2.10, 1.87, 1.55,
              1.25, 0.85, 1.34, 0.62, 0.92, 
              1.00, 1.27, 2.77, 2.37, 1.96,
              1.39, NA, 1.34), 
    lower = c(NA, NA, 1.10, 1.05, 0.62,
              0.75, 0.49, 0.94, 0.50, 0.19,
              0.74, 0.64, 0.76, 1.24, 1.12,
              1.00, NA, 1.03),
    upper = c(NA, NA, 4.10, 3.34, 3.88, 2.09,
              1.48, 1.92, 0.77, 4.36, 1.35, 
              2.61, 7.39, 4.55, 3.42, 1.91, NA, 1.75)),
    .Names = c("mean", "lower", "upper"), 
    row.names = c(NA, -11L), 
    class = "data.frame")

par(lwd=1, las=1, family="sans", cex=1, mgp=c(3.0,1,0))

forestplot(tabletext, 
           pylorimeta,# new_page = TRUE,
           zero=1, 
           cex=2, 
           mar = unit(rep(5, times = 4), "mm"),
           lineheight = "auto", 
           is.summary=c(rep(FALSE, 17), TRUE),
           graphwidth = unit(8, "cm"))
