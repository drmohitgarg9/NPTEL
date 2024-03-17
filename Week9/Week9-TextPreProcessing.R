#Text Mining Week 9 Pre-Processing

#RegEx


#The very first step is pre-processing 



#Importing the data 

#Data Reading

#Working Directory 

getwd()

#Changing the directory 

setwd()


dfJCP<-read.csv("week9Data.csv")

#Data Title and Abstract 

#View the dataset

View(dfJCP)

ncol(dfJCP)

#50 publications of Journal of cleaner production

#downloaded from scopus

#Lot many columns 
#our focus is on Title and Abstract


#JCP Publication Titles 

dfJCP$Title

#First Title

dfJCP$Title[1]

#JCP Publication Abstract 

dfJCP$Abstract

#First Abstract

dfJCP$Abstract[1]


#Combining Title and Abstract
#make it as single column

#Paste


paste()

?paste


###Example of concatenation

txt1<-"Mukesh Behera"

txt2 <- "Mohit Garg"

paste(txt1, txt2, sep = ",")

paste(txt1, txt2, sep = ",   ")


#Concatenation of Title and Abstract

paste(dfJCP$Title, dfJCP$Abstract, sep = ". ")

#Data Frame of combining title and abstract 

dfJCPTiAb <- data.frame(paste(dfJCP$Title[1], dfJCP$Abstract[1], sep = ". "))

#See the column name of data frame

colnames(dfJCPTiAb)

#Big column name,data frame taken name of all the operations
#paste, dfJCP$Title, dfJCP$Abstract, sep........

dfJCPTiAb$paste.dfJCP.Title..dfJCP.Abstract..sep........[1]


#too big coloumn name


#Changing the column name 
colnames(dfJCPTiAb) <-"text"

#See the first element

dfJCPTiAb$text[1]


#####Text Pre-processing 


#Removal of unwanted text 

#First see the some text, if anything to removed, end of abstract 


dfJCPTiAb$text[1]

dfJCPTiAb$text[2]

dfJCPTiAb$text[3]

dfJCPTiAb$text[4]


#We need to make regex to match these pattern,[SLIDE]

#removal of  © 2014 Published by Elsevier Ltd.\2015 Elsevier Ltd. All rights reserved.
#2015 Elsevier Ltd\

grep()  #Pattern matching

gsub()  #matching and replacement

?gsub


#Let's see how these pattern can be converted to regex

#First let us see where all these patterns are in
#all 50 title and abstract 

#Pattern 1

grep("© \\d{4} Published\\s+by\\s+Elsevier\\s+Ltd\\.", dfJCPTiAb$text)


#Pattern 2

grep("© \\d{4} Elsevier\\s+Ltd\\.\\s+All\\s+rights\\s+reserved\\.", dfJCPTiAb$text)

#Pattern 3

grep("© \\d{4} Elsevier\\s+Ltd\\.?", dfJCPTiAb$text)


dfJCPTiAb$text[1]

dfJCPTiAb$text[27]

dfJCPTiAb$text[28]


#Final Pattern

myPat<-"© \\d{4} Published\\s+by\\s+Elsevier\\s+Ltd\\.| © \\d{4} Elsevier\\s+Ltd\\.\\s+All\\s+rights\\s+reserved\\.?|© \\d{4} Elsevier\\s+Ltd\\.?"


#Removal of elsevier string

remPat<-gsub(myPat, "", dfJCPTiAb$text)

#First element after removal of elsevier

remPat[1]

#Original element without removal

dfJCPTiAb$text[1]

#Second element after removal of elsevier
remPat[2]

#Third element after removal of elsevier
remPat[3]


#dfJCPTiAb$text vs remPat

## dfJCPTiAb$text is raw dataset

## remPat is after the removal of elsevier


#removal of URL(if any) sometime we have URL in the abstract

#URL for our purpose does not contribute to a topic
#Pattern of URL http\https\ftp\abc.ac.in\www.abc.ac.in

#let us check do we have url in our data
#what we will use 

#URL searching 

grep("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)", dfJCPTiAb$text)

#URL removal 
gsub("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)","",dfJCPTiAb$text)


#Email searching 

grep("\\S*@\\S*", dfJCPTiAb$text)

#Removal of email
gsub("\\S*@\\S*","",x)


#Lowering the case 


a<-c("mohit","MOHIT","Mohit","moHIT", "mOHIT","MOhiT")

table(a)


#Function to used for lower casing

tolo      #function of a base package

#See about tolower function 

?tolower

#lower casing "a" dataset

b<-tolower(a)

table(b)

#Upper casing "a" dataset


b<-toupper(a)

table(b)


##Lowercasing of JCP dataset where elesevier is removed


dfLower<-tolower(remPat)

#First element after removal of elsevier

remPat[1] 

#First element after lowering case 

dfLower[1]

###Punctuation Removal 

a<-c("mohit,","MOHIT,","Mohit;","moHIT:", "mOHIT?","MOhiT()")


#We need a package

library(tm)

#function of tm package

removeP

#See the function 
?removePunctuation

#Removing punctuation from "a" dataset

removePunctuation(a)

#Removing punctuation from JCP Dataset

dfPun1<-removePunctuation(dfLower)

dfPun1[1]

#But dashes have removed and no space between words

#[[:punct:]] punctuation regex

dfPun<-gsub("[[:punct:]]", " ", dfLower)

dfPun[1]

#Using removePunctuation

removePunctuation(dfLower[1], preserve_intra_word_dashes = TRUE)

#Default is FALSE 



###Stopwords

#What stopword is 


?stopwords

stopwords(kind = "en")

#English stopwords from the SMART information retrieval system
#Cornell University

#Listing all stopwords as per SMART

stopwords('SMART')


#Removal of stopwords from the dataset

dfStop<-removeWords(dfPun,stopwords('SMART'))

#First element after lowercasing

dfLower[1]

#First element after removal of punctuation

dfPun[1]

#First element after removal of stopwords

dfStop[1]

# own stop words related to study
#like Topic modelling of ecology, environment and poverty nexus: An integrated framework

#Extra White Space 

?stripWhitespace()

dfStop<-stripWhitespace(dfStop)

dfStop[1]

###Removal of numbers 

removeNumbers(dfStop[1])

dfRemNum<-removeNumbers(dfStop)

#Extra unneccessary space is removed

#Lemmatization/Stemming 

a<-c("I cooking biryani which  cook cooked but i
     ran away from home when  running run better")

#package

library(textstem)

#Lemmatization Package

lemmatize_strings()

?lemmatize_strings


##Lemmatize  "a" dataset
lemmatize_strings(a)

lemmatize_strings(a,dictionary = lexicon::hash_lemmas)

##Stemming
stem_strings(a)



#Let us Consider a lemmatization 

dfLemma<-lemmatize_strings(dfRemNum)

##First element after lemmatization

dfLemma[1]

#First element after removal of numbers

dfRemNum[1]

#First element after removal of stopwords

dfStop[1]


#Stemming
dfStem<-stem_strings(dfRemNum)

dfStem[1]

#Step by Step Processing is done

#We have understood how we can do remove some unwanted things
#step by step


#We can create our own function

#we can use the same in our future analysis

#Single Argument Function
#Lemmatization


Week9CleanLem<- function(x){
  
  #gsub("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)","",x)
  
  x<-gsub("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)","",x)
  
  x<-gsub("\\S*@\\S*","",x)
  
  myPat<-"© \\d{4} Published\\s+by\\s+Elsevier\\s+Ltd\\.| © \\d{4} Elsevier\\s+Ltd\\.\\s+All\\s+rights\\s+reserved\\.?|© \\d{4} Elsevier\\s+Ltd\\.?"
  
  x<-gsub(myPat, "", x)
  
  x <-tolower(x)
  
  x<-gsub("[[:punct:]]", " ", x)
  
  x <-removeWords(x,stopwords('SMART'))
  
  x <-stripWhitespace(x)
  
  x<-removeNumbers(x)
  
  x<-lemmatize_strings(x)
  
  return(x) 
  
}

#Stemming

Week9CleanStm<- function(x){
  
  #gsub("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)","",x)
  
  x<-gsub("(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)","",x)
  
  x<-gsub("\\S*@\\S*","",x)
  
  x <-tolower(x)
  
  x <-removeWords(x,stopwords('SMART'))
  
  x<-gsub("[[:punct:]]", " ", x)
  
  x <-stripWhitespace(x)
  
  x<-lemmatize_strings(x)
  
  return(x) 
  
}


#In single step our pre-processing is done

CleanDfJCP<- Week9CleanLem(dfJCPTiAb$text) 

#First Element raw data set
dfJCPTiAb$text[1]

#First element after pre-processing 

CleanDfJCP[1]