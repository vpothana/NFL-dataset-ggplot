#The Program plots the distribution of NFL players weight vs height based on position  
# Data is stored in MySQL database.
# Steps : 1. Connect to MySQL database. Package RMySQL is required
#         2. Select the data from database table. SQL statements are the same as MySQL steps.
#         3. First a Scatterplot is used to understand the data.
#         4. To have better options to visualization the data we are using ggplot
#         5. Using various arguments of ggplot funtion, data is visualization a lot better

#Uncomment below lines based on missing packages
#install.packages("RMySQL")
#install.packages("car")
#install.packages("ggplot2")

#load package
library("car", lib.loc="~/R/win-library/3.1")
library("RMySQL", lib.loc="~/R/win-library/3.1")
library("ggplot2", lib.loc="~/R/win-library/3.1")

#connect to MySQL to get the player data
con <- dbConnect(MySQL(),
user = ******,
password = ******,
host = 'localhost',
dbname='public')

#get based on position
full = dbSendQuery(con, "select * from player where position in ('QB', 'RB', 'WR', 'P','K')")

#
data = fetch(full, n=1000)
ggplot (data, aes (x = height, y = weight, colour = position))  + geom_point(shape=1, position=position_jitter(width=1,height=.5)) + scale_colour_hue(l=50) + 
  geom_smooth(method=lm,   # Add linear regression lines
   se=FALSE,    # Don't add shaded confidence region
   fullrange=F)  + scale_shape_manual(values=c(1,2,3,4,5))

