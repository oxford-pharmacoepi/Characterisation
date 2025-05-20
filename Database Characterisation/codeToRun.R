renv::activate()
renv::restore()

dbName <- "..."

con <- DBI::dbConnect("...")

cdmSchema <- "..."
writeSchema <- "..."

prefix <- "..."


cdm <- CDMConnector::cdmFromCon(con = con,
                                cdmSchema = cdmSchema,
                                writeSchema = c(schema = writeSchema,
                                                prefix = prefix),
                                cdmName = dbName)

minCellCount = 5

sex <- TRUE

ageGroup <- list(c(0,19), c(20, 39),c(40, 59), c(60, 79), c(80, Inf) )

dateRange <- as.Date(c(NA, NA))

interval <- "years"

conceptCounts <- TRUE

source("RunCharacterisation.R")
