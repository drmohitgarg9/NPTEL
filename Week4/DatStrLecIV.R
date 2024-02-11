### Week 4 Lecture 


#Practice Solution

MyName<-"Mohit Garg"

MyPin<- 110016


#Vector


#c()

pubDoc<-c(12,14,15)

pubDoc


#Vector of names 


researcher<-c("Raman","Mohit","Lokesh")

researcher

class(pubDoc)
class(researcher)

#Vector can have value of same type only

myVector1<-c(19,20, "ab")

myVector1
myVector2<-c("ab","bc")

myVector1*2

#Checking Class of Vector

class(myVector1)


class(myVector2)


#Valid Vector 

myVector1<-c(19,20)

myVector2<-c("ab","bc")


#Invalid Vector 

myVector1<-c(19,20, "ab")

myVector2<-c("ab","bc", TRUE)


#practice 


myVectorTest<- c("AB","BC", "ab")


##Numeric Vector 

NumVector<-c(1,2)

class(NumVector)

##Integer Vector 

IntVector<-c(1L,2L)

##Character Vector 

myCharVector<-c("Mohit","Mukesh")

myCharVector1<-c("Garg","Behera")


#Basics Operations 

myVector1<-c(19,20,21)
myVector2<-c(2,3,4)

#Addition 

myVector1 + myVector2

AddVector<-myVector1+myVector2

AddVector

#Subtraction 

SubVector<-myVector1-myVector2

#Multiplication 

MulVector<-myVector1*myVector2

#Division

DivVector<-myVector1/myVector2



#Accesing the values  #1-based indexing

myVector1[2]

myVector2[2]

myVector1[2]*myVector2[2]



#Addition of Charcter vector 

#Prcatice 

myCharVector + myCharVector1




#Data Frame


##Individual Vector 

researcher<-c("Raman","Mohit","Lokesh")

pubDoc<-c(12,14,15)


##Combining to form a data frame

ResPub<-data.frame(researcher,pubDoc)


#Modifying the data frame by Adding/Deleting more values 


##Lengthy Way

researcher<-c("Raman","Mohit","Lokesh","Mukesh")

pubDoc<-c(12,14,15, 16)

ResPub<-data.frame(researcher,pubDoc)


##Short Way 

fix(ResPub)


## to add one more column

CitDoc <- c(2,4,6,7,12,13,10,12 )

data.frame(ResPub, CitDoc)


fix(ResPub)


#dimension of a data frame

dim(ResPub) 

#number of rows

nrow(ResPub)

#number of columns 

ncol(ResPub)


## structure of a data frame

str(ResPub)

## summary of a data frame

summary(ResPub)


## first and last few values of a data frame

head(ResPub)
tail(ResPub)

##limiting with only two or three

head(ResPub, n=3)

tail(ResPub, n=2)


#What about if we have to see bottom three values


#First Way 

tail(ResPub, n=3)

head(ResPub, n=-3)


#Second Way



##Column Name 

ResPub

colnames(ResPub)


###Changing Column Name

colnames(ResPub) <-c("Sch","Pub","Cit")

ResPub

fix(ResPub)


### Basic data manipulation 

is.na(ResPub)

fix(ResPub)

ResPub<- replace(ResPub, is.na(ResPub),123 )

##Accessing column of a data frame 

ResPub$Schol

ResPub$Public

sum(ResPub$Public)

ResPub$Public[3]

ResPub$Public[3] < ResPub$Public[5]

ResPub$Public[3] > ResPub$Public[5]



##Lists


researcher<-c("Raman","Mohit","Lokesh")

pubDoc<-c(12,14,15)

MetScore<-c(2,3) 

TotalPub<- data.frame(researcher, pubDoc,MetScore)


#Another Example

researcher<-c("Raman","Mohit","Lokesh", "Mukesh")

pubDoc<-c(12,14,15, 16)

MetScore<-c(2,3)


TotalPub<- data.frame(researcher, pubDoc,MetScore)



#Lists

#We have to create Vector 
researchID<-c(01,02,03)
researcher <- c("Raman", "Mohit", "Lokesh")
TotalPub <-131


#List creation 
PubList<-list(researchID, researcher, TotalPub)

#Single List 
PubList<-list(researchID, researcher, TotalPub)


#List element name

names(PubList)

#DataFrame names are from vector

PubList<-list(ID=researchID,name=researcher,total=TotalPub)

PubList

names(PubList)

#or 

names(PubList) <- c("ID","Name","Total")


##Accessing List Elements $

PubList$Name

PubList[2]

PubList[3]

PubList[4]

PubList$Name[2]

## Modifying a list 


PubList$Name[3] <-"Tarun"

PubList$Name

##Adding a new value to existing lists

PubList$Name[5] <-"Tarun"

PubList$Name


##Adding data frame in to list 

myNewList<-list(data=ResPub, Total= TotalPub)

myNewList

#Nested Lists

#Two Institute Publications


##Institute1 Publication
researchID1<-c(01,02,03)
researcher1 <- c("Raman", "Mohit", "Lokesh")
TotalPub1 <-131


Inst1List<-list(researchID1, researcher1, TotalPub1)


##Institute2 Publication

researchID2<-c(11,12,13)
researcher2 <- c("Rahul", "Mukesh", "Priyanka")
TotalPub2 <-208


Inst2List<-list(researchID2, researcher2, TotalPub2)

###Nested List Creation
instList <-list(Inst1List, Inst2List)

instList


#Matrices


#matrix creation

myMat <- matrix(1:8)  

myMat

dim(myMat)

nrow(myMat)

ncol(myMat)

#with Rows and Columns

myMat <- matrix(1:8, nrow = 4, ncol=2) 

myMat

#incorrect value in col/row

matrix(1:8, ncol = 7) 

matrix(1:8, nrow = 8)

myMat
#Naming Rows and columns of matrix 

rownames(myMat)

colnames(myMat)

rownames(myMat) <- c("1st", "2nd", "3rd","4th")

colnames(myMat) <- c("Pub1","Pub2")

myMat


##Accessing Matrix Element [row,column]


myMat[2,2]

myMat[2,4]

myMat[1,2]


myMat[2,1]

myMat[2,]

myMat[,2]

myMat
myMat [,]


#Factor 

OpenPub<- factor(c("Green","Gold","Diamond"))

levels(OpenPub)

OpenPub1<- factor(c("Green","Gold","Diamond","Diamond"))

OpenPub1
levels(OpenPub1)

as.numeric(OpenPub)

factor(c("Green","Gold","Diamond", "Gold"))

#Class
class(OpenPub)



#Array

MyArr1D<-array(1:8, dim = c(8))

MyArr1D

MyArr2D<-array(1:8, dim = c(4,2))

MyArr2D

MyArr2D<-array(1:8, dim = c(2,4))

MyArr3D<-array(1:8, dim = c(4,2,1))

MyArr3D













