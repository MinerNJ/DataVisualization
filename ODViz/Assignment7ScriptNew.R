#Nick Miner
#Miner.51
#3:00PM Section

setwd("~/School/POL 3780")
drugs <- read.csv("drugs.csv",stringsAsFactors = FALSE)
View(drugs)
drugs$estimated <- drugs$Estimated.Age.adjusted.Death.Rate..11.Categories..in.ranges.
drugs$estimated <- ifelse(drugs$estimated=="0-2",1,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="2.1-4",2,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="4.1-6",3,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="6.1-8",4,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="8.1-10",5,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="10.1-12",6,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="12.1-14",7,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="14.1-16",8,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="16.1-18",9,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated=="18.1-20",10,drugs$estimated)
drugs$estimated <- ifelse(drugs$estimated==">20",11,drugs$estimated)
drugs$estimated <- as.numeric(drugs$estimated)
library(maps)
data("county.fips")
drugs2 <-merge(drugs,county.fips,by.x = "FIPS",by.y = "fips")
drugs2004 <- subset(drugs2, drugs2$Year==2004)
drugs2014 <- subset(drugs2, drugs2$Year==2014)
my.colors <- colorRampPalette(c("Green","Red"))(11)
my.colors2004 <- my.colors[drugs2004$estimated]
my.colors2014 <- my.colors[drugs2014$estimated]
#2004 Map
map("county",regions = drugs2004$polyname,col=my.colors2004,exact = TRUE,fill = TRUE,resolution = 0,lty=0, projection = "mercator")
map("state",col="White",fill=FALSE,resolution=0,add = TRUE, projection = "mercator")
title("2004 Drug Poisoning Mortalities Per 100,000 Population")
legend("left", legend = c("0-2","2.1-4","4.1-6", "6.1-8", "8.1-10", "10.1-12","12.1-14", "14.1-16", "16.1-18", "18.1-20",">20"), fill = my.colors, col = my.colors2004, title = "Estimated Drug Mortalities Per Color",cex = .75,ncol = 2)
#2014 Map
map("county",regions = drugs2014$polyname,col=my.colors2014,exact = TRUE,fill = TRUE,resolution = 0,lty=0, projection = "mercator")
map("state",col="White",fill=FALSE,resolution=0,add = TRUE, projection = "mercator")
title("2014 Drug Poisoning Mortalities Per 100,000 Population")
legend("left", legend = c("0-2","2.1-4","4.1-6", "6.1-8", "8.1-10", "10.1-12","12.1-14", "14.1-16", "16.1-18", "18.1-20",">20"), fill = my.colors, col = my.colors2014, title = "Estimated Drug Mortalities Per Color",cex = .75,ncol = 2)