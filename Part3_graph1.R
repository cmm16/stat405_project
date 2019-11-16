library(RSQLite)

dcon <- dbConnect(SQLite(), dbname = "group10.db")
dbListTables(dcon)

res <- dbSendQuery(conn = dcon, "
SELECT DAY_OF_WEEK, avg(DEP_DELAY)
FROM flights
WHERE ORIGIN = 'DFW' 
GROUP BY DAY_OF_WEEK;")
avg_delays <- dbFetch(res, -1)
dbClearResult(res)

plot(avg_delays$DAY_OF_WEEK, avg_delays$`avg(DEP_DELAY)`, xlab = "Day of Week",
     ylab = 'Avg. Delays', main = "Average Delay Times for DFW", col = "blue")
