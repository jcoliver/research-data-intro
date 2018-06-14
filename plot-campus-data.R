# Plotting campus data
# Jeff Oliver
# jcoliver@email.arizona.edu
# 2018-06-08

rm(list = ls())

################################################################################
input.file <- "data/oncampusarrest131415-clean.csv"

# Read original data from file
campus.data <- read.csv(file = input.file)

# Liquor vs. drug arrests
plot(x = campus.data$LIQUOR13, y = campus.data$DRUG13)
abline(lm(DRUG13 ~ LIQUOR13, data = campus.data))
summary(lm(campus.data$DRUG13 ~ campus.data$LIQUOR13))

# Campus size vs. drug arrests
plot(x = campus.data$Total, y = campus.data$DRUG13)
abline(lm(DRUG13 ~ Total, data = campus.data))
summary(lm(campus.data$DRUG13 ~ campus.data$Total))
