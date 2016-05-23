
source("YSsource.R")
db <- read.YS("Data/test.mdb")
db <- decode.YS(db, drop=FALSE)
export.YS(db)
