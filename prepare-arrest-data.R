# Cleaning up on campus crime data
# Jeff Oliver
# jcoliver@email.arizona.edu
# 2018-06-08

rm(list = ls())

################################################################################
# SUMMARY
# Data from https://www.datalumos.org/datalumos/project/101746/view

# Set file names
input.file <- "data/oncampusarrest131415.csv"
output.file <- "data/oncampusarrest131415-clean.csv"

# Read original data from file
campus.data <- read.csv(file = input.file)

# International schools have empty string in the State column (and we don't want them)
campus.data <- campus.data[campus.data$State != "", ]

# Base drop decision on identical rows in these three columns
cols.to.compare <- c("men_total", "women_total", "Total")

# Do initial removal of those rows missing student population sizes
drop.rows <- apply(X = campus.data[, cols.to.compare], 
                     MARGIN = 1, 
                     FUN = function(x) { any(is.na(x)) })
campus.data <- campus.data[!drop.rows, ]

# Reset the drop.rows vector
drop.rows <- rep(FALSE, times = nrow(campus.data))

# Compare all rows with immediately preceding row (from row 2 on)
for (i in 2:nrow(campus.data)) {
  if (all(campus.data[i - 1, cols.to.compare] == campus.data[i, cols.to.compare])) {
    drop.rows[i] <- TRUE
  }
}
clean.campus.data <- campus.data[!drop.rows, ]

# Drop two more troublesome institutions, University of Phoenix-Arizona and Michigan 
# State University-College of Law; the latter has crime stats for the main campus
drop.INSTNM <- c("University of Phoenix-Arizona", "Michigan State University-College of Law")
clean.campus.data <- clean.campus.data[!(clean.campus.data$INSTNM %in% drop.INSTNM), ]

# Make final data set and save to file
write.csv(x = clean.campus.data, file = output.file, quote = TRUE, row.names = FALSE)
