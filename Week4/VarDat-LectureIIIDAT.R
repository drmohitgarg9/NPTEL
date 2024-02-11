###Week-4 Lecture Objects


#Object Syntax

# ObjectName  <-  value

#Object Name


Nptel  <-  14

Nptel <- "Mohit Garg"
Nptel <- TRUE



#(letter/period, recommended letter only)


Author <- 12

123Author <-12

.Author <-12

^Author<-12


##After letter/period : number,letter,underscore(-) and period(.) 

Author123 <-12

Author_123 <-12



##Case Sensitive

AUTHOR <-23

author <- 36

##Avoid Reserved Words

else<-123


##No special character( (,$,%@,&,)) except _ . 

Author%<-234


# Valid Object Name # Invalid Object Name


#Object Values Type

#Object Name

Nptel  <-  14
Nptel <- "Mohit Garg"
Nptel <- TRUE


Nptel1  <-  14
Nptel2 <- "Mohit Garg"
Nptel3 <- TRUE

#class()

class(Nptel1)

class(Nptel2)

class(Nptel3)




#Numeric 

NptNUM <- 1.2

class(NptNUM)

NptNUM <- -1.2

NptNUM +1

NptNUM <- 1

class(NptNUM)


#Integer 

NptINT <- 1

class(NptINT)

NptINT<-1.9

class(NptINT)

Nptel<-as.integer(NptINT)

Nptel


#Character 


NptCHAR <- "Welcome to MOOC"

class(NptCHAR)


NptCHAR


NptCHAR <- welcome to mooc




#Logical 

NptLOG<-T

NptLOG<-TRUE

NptLOG<-True

class(NptLOG)

Auth1<-14

Auth1>10


Auth1<10

Auth1==10

#NA


Auth2<-NA

is.na(Auth1)

is.na(Auth2)

#ls() to list all the objects

ls()

#rm() to remove the object

rm("value")

##Single Removal


##MultiRemoval

rm(list=ls())


#Practice 


#Create Object that store your name and pin code of your area
#Share in the discussion forum. 





Nptel <- 5

Nptel <-"Hello"

Nptel <- TRUE
