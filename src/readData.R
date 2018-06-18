#library(tidyverse)
library(magrittr)
#devtools::load_all("worldcup")

#Get Complete dataset 
CompleteDataset <- read.csv("C:\\Users\\v-inathi.mbomvu\\Desktop\\FIFA WorldCup\\FIFA\\data\\CompleteDataset.csv")

#Player Attributes
playerAttributes <- read.csv("C:\\Users\\v-inathi.mbomvu\\Desktop\\FIFA WorldCup\\FIFA\\data\\PlayerAttributeData.csv")

#PlayerPersonalData 
playerPersonlaData <- read.csv("C:\\Users\\v-inathi.mbomvu\\Desktop\\FIFA WorldCup\\FIFA\\data\\PlayerPersonalData.csv")

#POsition Data
playerPositionData <- read.csv("C:\\Users\\v-inathi.mbomvu\\Desktop\\FIFA WorldCup\\FIFA\\data\\PlayerPlayingPositionData.csv")

#FIFA Results

results <- read.csv("C:\\Users\\v-inathi.mbomvu\\Desktop\\FIFA WorldCup\\FIFA\\data\\results.csv")

#Creat New Folder
sqlShareDir <- paste("c:\\R Programming\\",gsub("-","",Sys.Date()))
dir.create(sqlShareDir,recursive = TRUE)

ccColInfo <- list(
    WorldCupWinner = list(
      type ="factor",
      levels = as.character(0:8)),
    WorldCupWinner_DW = list(
      type = "factor",
      levels = as.character(1:9),
      newLevels = c("date","home_team","away_team","home_score","away_score","tournament","city","country","neutral")
    )
)

samp <- sample(1:nrow(results),.6*nrow(results)) ##60 and 40 bifurcation

train60 <- iris[samp,] ## This is the 60% chunk
remain40 <- iris[-samp,]  ## This is used for further bifurcation

samp2 <- sample(1:nrow(remain40),.5*nrow(remain40))

first20 <- remain40[samp2,] ## First chunk of 20%
secnd20 <- remain40[-samp2,] ## Second Chunk of 20%

Reduce("intersect",list(train60,first20,secnd20)) ##Check to find if there is any intersect , 0 rows means everything is fine and sample are not repetitive.

rxGetVarInfo(data=train60)