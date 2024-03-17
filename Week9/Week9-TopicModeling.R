#Lecture Topic Modelling


library(tm)

library(topicmodels)

library(textstem)

#First to  make the whole dataset a corpus

?Corpus

corpusJCP<-Corpus(VectorSource(CleanDfJCP))

#This is our text corpus on which we will do topic modelling


# Create a document-term matrix


?DocumentTermMatrix

###Example for DTM #######

D1<-"He is a good boy and a cook"

D2<-"He is a GOOD boy and a driver"

#Cleaning of D1 and D2

D1C<-Week9CleanLem(D1)

D2C<-Week9CleanLem(D2)

D1C

D2C

# corpus of D1, D2
corpus <- Corpus(VectorSource(c(D1C, D2C)))

# Creating a document term matrix
dtm <- DocumentTermMatrix(corpus)

#To see what dtm is

dtm

# Converting the document term matrix to a matrix
dtMatrix <- as.matrix(dtm)


dtMatrix

#extract Few top words example

freq <- colSums(as.matrix(dtm))

length(freq)

decOrd <- order(freq, decreasing = TRUE)

freq [head(decOrd, n = 4)]



####JCP Document Term Matrix#####

?DocumentTermMatrix

dtmJCP <- DocumentTermMatrix(corpusJCP)


dtmJCP


#top words of JCP

freq <- colSums(as.matrix(dtmJCP))

length(freq)

ord <- order(freq, decreasing = TRUE)

freq [head(ord, n = 50)]

#Top 50 Words

top50words<-freq [head(ord, n = 50)]


#Save the 50 words as file

write.csv(top50words, file = "Top50JCPWords.csv")

#Working Directory 

getwd()


#topic Modelling

#Number of Topics
topicNum <- 5


?LDA

ldaJCP <- LDA(dtmJCP, k=topicNum, method = "Gibbs" , control = list(seed = 1234))

#LDA gives multiple things in the output


#Let's have Beta, per topic word distribution

TopicsJCP <- tidy(ldaJCP, matrix = "beta")


View(TopicsJCP)

#To see number of terms 1671*5

#Why 5

length(TopicsJCP$topic)

#Maximum Value 
max(TopicsJCP$beta[1:5])

sort(TopicsJCP$beta[1:5], decreasing = TRUE)


#Topics Words

TopicsExport<-as.data.frame(terms(ldaJCP, 10))

write.csv(TopicsExport, file = "TopicsExportJCP.csv")


#Package tidy and dplyr

library(tidytext)

library(dplyr)

topJCPTerms <-
  TopicsJCP %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

View(topJCPTerms)

#50, 52

#VIsualising the topic wise words plot 

##Topic 1

barplot(topJCPTerms$beta[1:11], names.arg = topJCPTerms$term[1:11], las=2, col ="red", main = "Hello" )

##Topic 2

barplot(topJCPTerms$beta[12:21], names.arg = topJCPTerms$term[12:21], las=2, col ="green", main = "Hello12334" )

##Topic 3

barplot(topJCPTerms$beta[22:32], names.arg = topJCPTerms$term[22:32], las=2, col ="cyan" )

##Topic 4

barplot(topJCPTerms$beta[33:42], names.arg = topJCPTerms$term[33:42], las=2, col ="#E310DC" )

##Topic 5

barplot(topJCPTerms$beta[43:52], names.arg = topJCPTerms$term[43:52], las=2, col ="#F0AC06" )


#We want all these plot in a single plot how we can do

#using par

?par
par(mfrow=c(1,5))   #1 row 5 coloumn

#Original Setting

par(mfrow=c(1,1)) 

#Another way using ggplot2 

library(ggplot2)

topJCPTerms %>%
  mutate(term = reorder(term, beta)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) + 
  geom_col(show.legend = FALSE) + 
  facet_wrap(~ topic, scales = "free") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 18)) +
  labs(title = "Ten Terms of each five Topics", caption = "Top Terms") +
  ylab("") +
  xlab("") +
  coord_flip()


#Documents Classification

JCPgamma <- tidy(ldaJCP, matrix = "gamma")

View(JCPgamma)

#see the gamma of all five topics for one document

?subset

subset(JCPgamma, document == 1)


#Set the criteria :maximum gamma , that will be the topic

AbstractJCPclass <- JCPgamma %>%
  group_by(document) %>%
  slice_max(gamma) %>%
  ungroup()

#See the documents and corresponding topics

View(AbstractJCPclass)

#51

subset(JCPgamma, document == 3)

#save as External files 

write.csv(AbstractJCPclass,file = "AbstractJCPClassfied.csv")
write.csv(JCPgamma, file = "JCPTopicsGamma.csv")

#all fifty title abstract are mapped with in five topics

#see the distribution 

table(AbstractJCPclass$topic)

#Conclusion : Majority of publications are related to topic 5 followed by topic 4. 

