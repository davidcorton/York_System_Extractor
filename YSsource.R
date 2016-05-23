# Define function to read in mdb and tidy up table names
read.YS <- function(file) {
      require(data.table)
      require(Hmisc)
      db <- mdb.get(file, lowernames = TRUE)
      for(i in 1:length(db)) {
            x <- gsub("*", "", names(db)[i], fixed=TRUE)
            names(db)[i] <- x
            setDT(db[[i]])
      }
      db
}

# Define function to decode using lookups
decode.YS <- function(db, drop=FALSE) {
      require(data.table)
      links <- fread(db)
      for(j in 1:nrow(links)) {
            tab <- links[j, TABLE]
            field <- links[j, FIELD]
            ltable <- db[[links[j, LOOKUP]]]
            existing <- levels(db[[tab]][, get(field)])[!levels(db[[tab]][, get(field)])==""]
            lookup <- ltable[get(links[j, ID]) %in% existing, get(links[j, PAYLOAD])]
            for(k in 1:length(existing)) {
                  db[[tab]][as.character(get(field))==existing[k], assign("a", field) := lookup[k]]
            }
      }
      if(drop==TRUE) {
            db[substr(names(db), 1, 1) == "L"] <- NULL
      }
      db
}

# Export as csv files
export.YS <- function(db, lookup=TRUE, measures=TRUE) {
      for(i in 1:length(db)) {
            write.csv(db[[i]], paste(names(db)[i], ".csv", sep=""), row.names = FALSE)
      }
}


db <- read.YS("test.mdb")
db <- decode.YS(db)

