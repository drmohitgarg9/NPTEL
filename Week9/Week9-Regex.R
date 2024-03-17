#Regex Pattern Matching in R

#Regex is a kind of special code that identify and 
#matches the patterns available in the text data 

#wild card searching

#grey or gray, behaviour or behavior, color or colour
#If you use either of it, your search will be limited 

# For effective searching and retrieving the good number of 
#Results , you have to use both of kinds of words or different
#Type of words 


# Mohit, Mukesh,Priyanka, Vijay

#What's common 

#Two words starts with M

#Character Object

regData<-c("Mohit","Priyanka","Vijay","Mukesh")

#Pattern Boundary , alphanumeric characters 
myPattern <- "\\bM\\w+\\b"

#Pattern matching function 

?grep

#Calling the function 

grep(myPattern, regData)

#Object 
regData

regData[1]

regData[4]

###Retrieving the words 

grep(myPattern, regData, value = TRUE)

#One word of five letters starts with M

myPattern <- "\\bM\\w{5}\\b"

grep(myPattern, regData, value = TRUE)


#Two words of five letters 

myPattern <- "\\b\\w{5}\\b"

grep(myPattern, regData, value = TRUE)


#one word is of 6 letter and one is in eight letter

myPattern <- "\\b\\w{6}\\b"

grep(myPattern, regData, value = TRUE)

myPattern <- "\\b\\w{8}\\b"

grep(myPattern, regData, value = TRUE)


#Two case : 1. words with five letters 

myPattern <- "\\b\\w{5}\\b"

grep(myPattern, regData, value = TRUE)

#2. Words with more than five letters

myPattern <- "\\b\\w{6,}\\b"

grep(myPattern, regData, value = TRUE)

myPattern <- "\\b\\w{6,}\\b"

grep(myPattern, regData, value = TRUE)


#extracting email 

#Email Data 

regDatEmail<-c("infovk@gmail.com","infomg@gmail.com", "mbehera28@gmail.com", "gargmohit@iitd.ac.in", "infokavita@lib")


myPattern<-"\\b\\w+\\@\\w+\\b"


grep(myPattern, regDatEmail, value = TRUE)

## Email with .com

myPattern<-"\\b\\w+\\@\\w+\\.com\\b"

grep(myPattern, regDatEmail, value = TRUE)


#Words with common four letters 

#infovk, infomg, infomb


##email with info

myPattern<-"\\binfo\\w+\\@\\w+\\.com\\b"


grep(myPattern, regDatEmail, value = TRUE)


##Matching a digit 


regDatSet<-c("MOHIT", "mohit", 1234, "mohit1234")

myPattern<-"\\d"

grep(myPattern, regDatSet, value = TRUE)


## Groups and Ranges 

regGroup<- c("MOHIT","Garg", "mohitxt","m","M","moh", "mo", 1234, "mohit1234", "1234mohit", "GarG","Moh12")


#Anything but a lower case letter presence

myPattern<-"[a-z]"

grep(myPattern, regGroup, value = TRUE)


#Starting with lowercase 
#Starting of string ^ caret symbol, 6

myPattern<-"^[a-z]"

grep(myPattern, regGroup, value = TRUE)

#Ending with lowercase 

#ENding of string $, 4

myPattern<-"[a-z]$"

grep(myPattern, regGroup, value = TRUE)


#Start and End with lowercase 

myPattern<-"^[a-z]$"

grep(myPattern, regGroup, value = TRUE)


#Start and End with lowercase  1 or two

myPattern<-"^[a-z]+$"

myPattern<-"^[a-z]{3,}$"

grep(myPattern, regGroup, value = TRUE)



#Start and End with lowercase 

myPattern<-"^[a-z]+$"

grep(myPattern, regGroup, value = TRUE)






#Uppercase 

myPattern<-"^[A-Z]+$"

grep(myPattern, regGroup, value = TRUE)

#Combination of uppercase and lowercase


myPattern<-"^[A-Z][a-z]+[A-Z]$"

grep(myPattern, regGroup, value = TRUE)




#Digits, 0,9

#Starts with Digit

myPattern<-"^[0-9]"
grep(myPattern, regGroup, value = TRUE)


#End with Digit



myPattern<-"[0-9]$"
grep(myPattern, regGroup, value = TRUE)

#Start and End

myPattern<-"^[0-9]+$"
grep(myPattern, regGroup, value = TRUE)

#One or more start and end

myPattern<-"^[0-9]+$"
grep(myPattern, regGroup, value = TRUE)


#Combination of Uppercase, Lowercase and digits

myPattern<-"^[A-Z][a-z]+[0-9]+$"
grep(myPattern, regGroup, value = TRUE)

#Other way of doing same thing

myPattern<-"^[A-Z][a-z]+[0-9]{2}$"

myPattern<-"^[A-Z][a-z][a-z][0-9][0-9]$"

myPattern<-"^[M][o][h][1][2]$"
