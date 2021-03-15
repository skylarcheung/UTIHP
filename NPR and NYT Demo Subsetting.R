#run the following two lines to install the packages needed
  #run only once, ever—no need to run again at every re-start
install.packages("plotly")
install.packages("tidyverse")
  #by the way, tidyverse includes the dplyr package, which we will use to subset


library(plotly)
library(tidyverse)

#import csv file, and assign the file to object name 'nprdf'
#df stands for dataframe
df <- read.csv('/Users/skylar/new_npr_page_posts.csv')

#subset the dataset for the desired columns
#select the desired columns, assign them to 'myvars'
#by the way, $text is $post_text combined with $shared_text
myvars <- c("text", "post_text", "shared_text", "time", "video_id", "likes", "comments", "shares")
#here, we are saying that we want to collect the columns defined in myvars from the nprdf
#the subsetted product is now named 'npr'
newdf <- df[myvars]


#subsetting from npr for posts with videos only
#this way, we can see only the posts with a video
#you should see in the environment '972 obs of 8 varibles'
#this means of the 7991 posts, there re 972 with videos
videodf <- newdf[ which(newdf$video!=''), ]

#let's save our dataframes as comma separated values (.csv) so we can use them later
#replace the path name with your desired path
#so below, for me, I want it saved to my desktop with the name nprPosts.csv
write.csv(newdf,"/Users/skylar/Desktop/Posts.csv", row.names = FALSE)
#to do the same with the dataframe that includes posts w/ videos only
write.csv(videodf,"/Users/skylar/Desktop/VideoPosts.csv", row.names = FALSE)

###for the NYTimes CSV

nytdf <- read.csv('/Users/skylar/nyt_page_posts.csv')

myvars <- c("text", "post_text", "shared_text", "time", "video_id", "likes", "comments", "shares")
nyt <- nytdf[myvars]

videonyt <- nyt[ which(nyt$video!=''), ]

write.csv(nyt,"/Users/skylar/Desktop/nytPosts.csv", row.names = FALSE)
write.csv(videonyt,"/Users/skylar/Desktop/nytVideoPosts.csv", row.names = FALSE)
