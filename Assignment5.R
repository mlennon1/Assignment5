# Mike Lennon   Assignment 5


#install.packages("tidyr")
library(tidyr)
library(dplyr)
library(stringr)
##### Question 1 #####
#1. Write down 3 questions that you might want to answer based on this data.
#I Does Edinburgh prefer Cullen skink over Partan bree.
#II Does Cullen skink have more votes than Partan bree.  
#III Do people over age 25 prefer Cullen skink over Partan bree. 




##### Question 2 ######
#2. Create an R data frame with 2 observations to store this data in its current "messy" 
#state. Use whatever method you want to re-create and/or load the data.

surveyData <- data.frame(
  name = c("Cullen","Partan"),
  EdinburghYoung = c(80100,35900),
  EdinburghOld = c(143000,214800),
  GlasgowYoung = c(99400,43000),
  GlasgowOld = c(150400,207000)
)


##### Question 3 #####
#3. Use the functionality in the tidyr package to convert the data frame to be "tidy data."

(surveyData)
colnames(surveyData)
surveyData1 <- surveyData  %>%
gather(  key ,value, EdinburghYoung:GlasgowOld)

(surveyData1)




##### Question 4 #####
q1  <- subset(surveyData1,key=="EdinburghYoung" | key == "EdinburghOld" )
(q1)
#I. Partan has more Edinburgh votes
ans1 <- ddply(q1, .(name), summarise, sum(value))
(ans1)



#II. Partan has more total votes
ans2 <- ddply(surveyData1, .(name), summarise, sum(value))
(ans2)


#III Partan has more votes with voters over age 24
q3 <- subset(surveyData1,key=="EdinburghOld" | key == "GlasgowOld" )
(q3)

ans3 <- ddply(q3, .(name), summarise, sum(value))
(ans3)


##### Question 5 #####
#Having gone through the process, would you ask different questions and/or change the way that 
#you structured your data frame?
'At first I tried to transpose the data frame but I ran into all kinds of problems with column 
names etc..  I think it was easier to just use tidyr on the data frame from the start.
I would ask questions about younger voter preference and Glasgow preference in addition to the 3
answered if I did it again.'



#Example code used
'
messy <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)

messy %>%
  gather(drug, heartrate, a:b)
'


# Failed code using transpose
#surveyData<- read.table("C:\\Users\\mike\\Desktop\\Data Aquisition\\week 5\\assign5Data.csv", header = TRUE, sep=",")
#str(surveyData)
#(t(surveyData))
####surveyData <- t(surveyData)
#surveyData = setNames(data.frame(t(surveyData[,-1])), surveyData[,1])
#vignette("tidy-data",package = "tidyr")

#####surveyData <- surveyData[c(2:5), ]
#print("Answer")
#(surveyData)
#####colnames(surveyData) <- c( "Yes", "No")
##### Question 3 #####
#3. Use the functionality in the tidyr package to convert the data frame to be "tidy data."

#(surveyData)
#colnames(surveyData) # has no col names
#surveyData  %>%
#gather(  key ,value, Yes:No)

