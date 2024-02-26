#Descriptive Analysis

###LECTURE I


#Importing the data and assigning it a name to it 

#read.csv()   #Used for importing the csv data, other are available like for SPSS,SAS,STATA,JSON Excel

dat<-read.csv("TestAuthorData.csv")

getwd()
View(dat)
view(dat)
data <- read.csv("C:/Users/DELL/Downloads/TestAuthorData.csv")

#Tip: Always check the working directory.

#getwd() 
#setwd()

#if your directory is not the actual directory where you have the data you need to give 
#the whole path here, common error occur on this point. 

#After Import, Let's first see the data 

View(data)

#To count the frequency what we do, first we count the unique values, then count its occurence

#Manual 
#For counting the unique values 


unique(dat$Year)

YearUni<-unique(dat$Year)

YearUni
#After counting the unique values, we will count the 
#occurence

table(dat$Year)


#We will make it as a data frame of this frequency analysis

datFq<- table(dat$Year)

datFq

DfdatFq<-data.frame(datFq)

colnames(DfdatFq)


colnames(DfdatFq)<-c("Year", "Frequency")

DfdatFq

View(DfdatFq)

#External Save 

write.csv(DfdatFq, file = "FrequencyAnalysis.csv")



#Cumulative Frequency 

#Manual 

#We dont Know how to calculate cumulative Frequency in R?

#What to do?


#Seek Help 

#Best way..search on fourth quadrant



cumsum(datFq)


datCmFq <- data.frame(cumsum(datFq))


datCmFq


# We will make it as single column in the same dataset
#column name 

colnames(datCmFq)

#Combining the both data frame

datFqCmFq<-data.frame(DfdatFq,datCmFq$cumsum.datFq.)

colnames(datFqCmFq)

#Look and Feel 

colnames(datFqCmFq) <- c("Year", "Frequency", "CumulativeFrequency")

datFqCmFq

#Use of space in column Name, % in URL 


datFqCmFq


#Changing of ColumnName shortcut way 

colnames(datFqCmFq)[colnames(datFqCmFq) == "cumsum.datFq."] <- "CumulativeFrequency"


datFqCmFq


#Relative Frequency

RelativeFrequency <- datFqCmFq$Frequency/sum(datFqCmFq$Frequency)

RelativeFrequency


#Final Frequency Table 


datFinal <- data.frame(datFqCmFq, RelativeFrequency)


datFinal

write.csv(datFinal, file = "FinalAnalysis25.csv")



#In Shorter Way 

dat<-read.csv("TestAuthorData.csv")

data.frame(table(dat$Year), cumsum(table(dat$Year)))


###LECTURE II

###Functions

#Basic Function

Mohit <- function(){
   
  print("Welcome to the Nptel Course")
  
  }

Mohit()



Mohit()
Mohit()
Mohit()


Mukesh <- function(){
  
  print("Hi Everyone ! I am Teaching Assistant for this Course")
  
}

Mukesh()
Mohit()




Mukesh()

#Single function will do all these work, you don't have to 
#type again and again

sum()
mean()

#Arguments in Function 

Priyanka <- function(a){
  
  a*2
}

Priyanka()



Priyanka(3)


Priyanka(2)

b<-345


Priyanka (b)

Priyanka(b)




#Function name should be realistic, task specific 


#Two Arguments

AddNum<-function(a,b){
  
  a+b
  
}


AddNum(2,3,5)

sum(2,3,5)

sum(2,3)

Mukesh()





AddNum(2,3)
AddNum1(2,3)

#Creating own command or function 
#In the lecture i was using command or function interchangeabley


#FUnction Example


TestFunct<-function(a,b){
  
  a*2
  a+b
  b*3
  
}

TestFunct(3+1,4)


TestFunct<-function(a,b){
  
  a<-a*2
  a+b
  
}

TestFunct(2,3)



#its important to not what is in the last. 

###Measures of Central Tendency

##Mean 

View(DfdatFq)

#To calculate Mean, we first calculate 
#Sum of frequency 
sumFq<-sum(DfdatFq$Frequency)

sumFq

#number of observations

nFq<-length(DfdatFq$Year)

nFq


nFq

meanFq<-sumFq/nFq

meanFq


meanFq1<-function(a){
  sumFq<-sum(a)
  nFq <-length(a)
  sumFq/nFq
  
}
  
meanFq1(DfdatFq$Frequency) 


  
#ShortCut by function name 

mean(DfdatFq$Frequency)




##Median 
##middle value of a dataset
##Ordering
##Extreme value/outlier skew the mean 
#median is robust measure of central tendency

## doesnt effect that much because of large or small one value 
##In the dataset


#First we order the data, arrange the data from smallest to largest

DfdatFq$Frequency[order(DfdatFq$Frequency)]

#Counting of the obeservation 

#If odd, median is the middle value

#If even values, median is average of middle two values

orderedDataset<-DfdatFq$Frequency[order(DfdatFq$Frequency)]

orderedDataset


medDf<-(orderedDataset[2] + orderedDataset[3] )/2

medDf




#Alternate way



#Shortcut way
median(DfdatFq$Frequency)




##Mode
##Categorical data 



#count the occurence 

x<-DfdatFq$Frequency

fqTbl <- table(x)
fqTbl 

MaxFq <- max(fqTbl)
MaxFq


#To check which value have frequencies 
#equal to the maximum frequency.

fqTbl  == MaxFq

#Select only those value which have maximum frequency 

fqTbl[fqTbl  == MaxFq]

names(fqTbl[fqTbl  == MaxFq])


modeValue<-as.numeric(names(fqTbl[fqTbl  == MaxFq]))


modeValue
modeValue 
MaxFq

  
#Function 
  
  nMode<- function(x) {
    
    fqTbl <- table(x)
    MaxFq <- max(fqTbl)
    modeValue<-as.numeric(names(fqTbl[fqTbl  == MaxFq]))
   modeValue
   MaxFq
  }



nMode(DfdatFq$Frequency)



#using package

install.packages("DescTools")

library(DescTools)


Mode(DfdatFq$Frequency)



###LECTURE III




#Measure of Dispersion

##Maximum Value

maximum(DfdatFq$Frequency)

maxi(DfdatFq$Frequency)

m(DfdatFq$Frequency)

maxi<-max(DfdatFq$Frequency)

##Minimum Value

minimum(DfdatFq$Frequency)

MINIMUM(DfdatFq$Frequency)

MIN(DfdatFq$Frequency)


mini<-min(DfdatFq$Frequency)


##Range Value 

max(DfdatFq$Frequency)-min(DfdatFq$Frequency)

maxi-mini

##Variance #Sample Variance 

#Measure the spread in the data

meanFq 

smFq<- DfdatFq$Frequency - meanFq

sqFq<-(smFq)^2

varnceFq<- sum(sqFq)/(length(DfdatFq$Frequency)-1)

varnceFq 

var(DfdatFq$Frequency)

#Placement of parentheses

varnceFq<- sum(sqFq)/(length(DfdatFq$Frequency)-1)

varnceFq




##Standard Deviation 


sdFq<- sqrt(varnceFq)

?sqrt


sdFq 

sd(DfdatFq$Frequency)


sdFq == sd(DfdatFq$Frequency)




#Quartile, Decile, percentile 


#Q1, Q2, Q3


quantile(DfdatFq$Frequency, probs = c(0.25, 0.5, 0.75))

Q1<- quantile(DfdatFq$Frequency, probs = 0.25)

Q3<- quartile(DfdatFq$Frequency, probs = 0.75)


?quantile

#Decile  , 10% of the dataset, 10 equal parts 

quantile(DfdatFq$Frequency, probs = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8, 0.9))

quantile(DfdatFq$Frequency, probs = seq(0.1, 0.9, by = 0.2))

#Percentile 100 equal parts

quantile(DfdatFq$Frequency, probs = seq(0.01, 0.99, by = 0.01))

## Interquartile Range (IQR)

#Q3 - Q1


Q1

Q3

Q3-Q1
iqr

IQR(DfdatFq$Frequency)


#Skewness kurtosis



library(moments)


install.packages("moments")


skewness(DfdatFq$Frequency)

kurtosis(DfdatFq$Frequency)



#Plotting of two variable, bivariate

#First we need to count the total citation 
#in each year, we have counted only publications

colnames(dat)


datCit<-aggregate(Cited.by ~ Year, data = dat, FUN = sum)

datCit$PubFreq <- DfdatFq$Frequency

datCit


##Mean of Cited By and Mean of Publications

mp<-mean(datCit$PubFreq)

mc<- mean(datCit$Cited.by)



mp1<-datCit$PubFreq-mp      #x-X

mc1 <-datCit$Cited.by-mc   #y-Y


mn<- length(datCit$Year)


sum(mp1*mc1)/(mn-1)




sdpc<-cov( datCit$PubFreq, datCit$Cited.by)

sdpc


cov(datCit$Cited.by, datCit$PubFreq)



#Correlation Standardized Measure 

sdFq # Computed above, publications 

#Standard Deviation of Citation 

sdc<- sd(datCit$Cited.by)


sdpc/(sdFq*sdc)


cor(datCit$Cited.by, datCit$PubFreq)




###Practice Assignment###### 

#File Name : PracDataSet.csv

#Calculate the frequency of publication in each year.
# Which Year has the maximum number of publications?

#Which year have the highest number of citations.

#Calculate mean, median, variance of publications and citations.

#Calculate the correlation between publications and citation. 

