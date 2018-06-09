# Plotting campus data
# Jeff Oliver
# jcoliver@email.arizona.edu
# 2018-06-08

rm(list = ls())

################################################################################
# input.file <- "data/oncampusdiscipline131415-clean.csv"
input.file <- "data/oncampusarrest131415-clean.csv"

# Arrest data better than discipline data
# 2013 pretty good, use drug to predict liquor

# Read original data from file
campus.data <- read.csv(file = input.file)

plot(x = campus.data$DRUG13, y = campus.data$WEAPON13)
plot(x = campus.data$LIQUOR13, y = campus.data$WEAPON13)
plot(x = campus.data$LIQUOR13, y = campus.data$DRUG13)
plot(x = campus.data$LIQUOR14, y = campus.data$DRUG14)
plot(x = campus.data$LIQUOR15, y = campus.data$DRUG15)
plot(x = campus.data$Total, y = campus.data$DRUG13)
plot(x = campus.data$Total, y = campus.data$DRUG14)
plot(x = campus.data$Total, y = campus.data$DRUG15)
plot(x = campus.data$Total, y = campus.data$LIQUOR13)
plot(x = campus.data$Total, y = campus.data$LIQUOR14)
plot(x = campus.data$Total, y = campus.data$LIQUOR15)

campus.data$INSTNM[campus.data$Total > 100000] # University of Phoenix
no.phoenix <- campus.data[campus.data$Total < 100000, ]
plot(x = no.phoenix$Total, y = no.phoenix$DRUG13)
plot(x = no.phoenix$Total, y = no.phoenix$DRUG14)
plot(x = no.phoenix$Total, y = no.phoenix$DRUG15)

# Tough to really see relationships without a line
plot(x = no.phoenix$LIQUOR13, y = no.phoenix$DRUG13, cex = no.phoenix$Total * 0.00005)
abline(lm(DRUG13 ~ LIQUOR13, data = no.phoenix))
summary(lm(DRUG13 ~ LIQUOR13, data = no.phoenix))

plot(x = campus.data$LIQUOR14, y = campus.data$DRUG14)
abline(lm(DRUG14 ~ LIQUOR14, data = no.phoenix))
summary(lm(DRUG14 ~ LIQUOR14, data = no.phoenix))

plot(x = campus.data$LIQUOR15, y = campus.data$DRUG15)
abline(lm(DRUG15 ~ LIQUOR15, data = no.phoenix))
summary(lm(DRUG15 ~ LIQUOR15, data = no.phoenix))

plot(x = campus.data$LIQUOR13, y = campus.data$WEAPON13)
abline(lm(WEAPON13 ~ LIQUOR13, data = no.phoenix))
summary(lm(WEAPON13 ~ LIQUOR13, data = no.phoenix))

plot(x = campus.data$LIQUOR14, y = campus.data$WEAPON14)
abline(lm(WEAPON14 ~ LIQUOR14, data = no.phoenix))
summary(lm(WEAPON14 ~ LIQUOR14, data = no.phoenix))

plot(x = campus.data$LIQUOR15, y = campus.data$WEAPON15)
abline(lm(WEAPON15 ~ LIQUOR15, data = no.phoenix))
summary(lm(WEAPON15 ~ LIQUOR15, data = no.phoenix))

