require(jpeg)
library(RSQLite)

dcon <- dbConnect(SQLite(), dbname = "/Users/work/Classes/Fall19/STAT405/stat405_project/group10.db")

# Count number of flights, passengers, and seats per airline out of IAH 
res <- dbSendQuery(conn = dcon, "
                   SELECT UNIQUE_CARRIER_NAME, count(*) as count, sum(PASSENGERS) as passenger_count, sum(SEATS) as capacity
                   FROM passengers
                   WHERE ORIGIN = 'IAH'
                   GROUP BY UNIQUE_CARRIER_NAME
                   ORDER BY passenger_count;")
airlines <- dbFetch(res, -1)
dbClearResult(res)
total_passengers_carried <- sum(airlines$passenger_count)
total_passengers_carried
airlines$percent = airlines$passenger_count / total_passengers_carried
dim(airlines)
airlines[43:48, ]

plane<-readJPEG("/Users/work/Classes/Fall19/STAT405/stat405_project/logos/airplane_seat_layout.jpeg")
airline<-readJPEG("/Users/work/Classes/Fall19/STAT405/stat405_project/logos/United_Air_Lines_Inc..jpeg")
#now open a plot window with coordinates
plot(1:10,ty="n")

#specify the position of the image through bottom-left and top-right coords
rasterImage(plane,-5,1,10.5,10)
rasterImage(airline,.9,3.4,1.2,4)


normalizePath('/Users/work/Classes/Fall19/STAT405/stat405_project/logos/airplane_seat_layout.jpeg')


