#Bradford Law 1934, Samuel C Bradford
##1931, 1933
##Geophysics and Lubrication

##SCattering of Journals

##Journals with articles sorted
#1:n:n^2

#Application Library, Researcher 

##Requirement of a package 

#https://cran.r-project.org/ 

#https://rdrr.io/cran/bibliometrix/man/bradford.html



install.packages("bibliometrix")

library(bibliometrix)





#Now, we need a data


#One way we download the data from source like Scopus, WoS



#Another Way is to use Data in a package 


#Built In data, Sample data associated with the package 

#list of datasets in a package 

data()

?data


##List all dataset in a pacakge 

data(package = .packages(all.available = TRUE))



##List the dataset in a particular package 


data(package = "bibliometrix")

data(package = "bibliometrixData")


##Location of data in system 

#C:\Users\DELL\AppData\Local\R\win-library\4.2

#Each Package has a data 

##Let's take management data

##Calling of Data 

data(management, package = "bibliometrixData")

View(management)



BradResult <- bradford(management)

BradResult


class(BradResult)

#Names of the element in the list

names(BradResult)

#Table and Graph

#Flexible Data Structure 

#Names in the list

names(BradResult$table)

names(BradResult$table)

#What each element consist of...

BradResult$table$SO

BradResult$table$Rank

BradResult$table$Freq

BradResult$table$cumFreq

BradResult$table$Zone

#Converting the results into a dataframe

BradResultDf<-data.frame(BradResult$table)

#Viewing the data frame

View(BradResultDf)

#Exporting the dataframe in CSV file

write.csv(BradResultDf, file = "BradResult.csv")



#Open Source 

#https://cran.r-project.org/web/packages/bibliometrix/index.html
#https://github.com/massimoaria/bibliometrix
#Must Acknowledge and Cite the package

#Color, name Change, to remove logo

#For color codes : https://htmlcolorcodes.com/
#Single Function

#ggplot2 package

library(ggplot2)

#Creating new function by just changing the name of existing function
#[Line from 142 to 182]

NewBradford<-function(M){
  
  SO=sort(table(M$SO),decreasing = TRUE)
  n=sum(SO)
  cumSO=cumsum(SO)
  cutpoints=round(c(1,n*0.33,n*0.67,Inf))
  groups=cut(cumSO,breaks = cutpoints,labels=c("Zone 1", "Zone 2", "Zone 3"))
  a=length(which(cumSO<n*0.33))+1
  b=length(which(cumSO<n*0.67))+1
  Z=c(rep("Zone 1",a),rep("Zone 2",b-a),rep("Zone 3",length(cumSO)-b))
  df=data.frame(SO=names(cumSO),Rank=1:length(cumSO),Freq=as.numeric(SO),cumFreq=cumSO,Zone=Z)
  
  x <- c(max(log(df$Rank))-0.02-diff(range(log(df$Rank)))*0.125, max(log(df$Rank))-0.02)
  y <- c(min(df$Freq),min(df$Freq)+diff(range(df$Freq))*0.125)+1
  data("logo",envir=environment())
  logo <- grid::rasterGrob(logo,interpolate = TRUE)
  
  g=ggplot2::ggplot(df, aes(x = log(.data$Rank), y = .data$Freq, text=paste("Source: ",.data$SO,"\nN. of Documents: ",.data$Freq))) +
    geom_line(aes(group="NA")) +
    #geom_area(aes(group="NA"),fill = "gray90", alpha = 0.5) +
    annotate("rect", xmin=0, xmax=log(df$Rank[a]), ymin=0, ymax=max(df$Freq), alpha=0.2)+
    labs(x = 'Source log(Rank)', y = 'Articles', title = "NPTEL Bradford's Law") +
    annotate("text",x=log(df$Rank[a])/2, y=max(df$Freq)/2, label = "Core\nSources",fontface =2,alpha=0.5,size=10)+
    scale_x_continuous(breaks=log(df$Rank)[1:a],labels=as.character(substr(df$SO,1,25))[1:a]) +
    theme(text = element_text(color = "#5C3BC2")
          ,legend.position="none"
          ,panel.background = element_rect(fill = '#FFFFFF')
          ,panel.grid.minor = element_blank()
          ,panel.grid.major = element_blank()
          ,plot.title = element_text(size = 24)
          ,axis.title = element_text(size = 14, color = '#555555')
          ,axis.line.x = element_line(color="cyan",size=0.5)
          ,axis.line.y = element_line(color="green",size=0.5)
          ,axis.title.y = element_text(vjust = 1, angle = 90)
          ,axis.title.x = element_text(hjust = 0)
          ,axis.text.x = element_text(angle=90,hjust=1,size=8,face="bold")
    ) 
  
  results=list(table=df,graph=g)
  return(results)
}

#Results based on new function

NewBradResults<-NewBradford(management)

NewBradResults

class(NewBradResults)


##Lotka Law 
#Alfred J Lotka
#Author Productivity 
#1926
#1907-1916 from chemical abstract 
#authors with n paper  is 1/n^2 of those making one 
#author single publication approx 60%

library(bibliometrix)

data()

data(package = .packages(all.available = TRUE))

data(package = "bibliometrixData")

data(scientometrics, package = "bibliometrixData")


#Viewing the data 

View(scientometrics)

#PAckage first FUnction
LotRes <- biblioAnalysis(scientometrics)


#Package Second Function

LotkaResult=lotka(LotRes)


class(LotkaResult)


#names of the list element
names(LotkaResult)


LotkaResult

#Each Element one by one

LotkaResult$AuthorProd

LotkaResult$Beta

LotkaResult$C

LotkaResult$R2

LotkaResult$fitted


LotkaResult$p.value



#Two FUnctions 

#biblioAnalysis and lotka


###First Function biblioanalysis

biblioAnalysis12<-function(M,sep=";"){
  # initialize variables
  Authors=NULL
  Authors_frac=NULL
  FirstAuthors=NULL
  PY=NULL
  FAffiliation=NULL
  Affiliation=NULL
  Affiliation_frac=NULL
  CO=rep(NA,dim(M)[1])
  TC=NULL
  TCperYear=NULL
  SO=NULL
  Country=NULL
  DE=NULL
  ID=NULL
  MostCitedPapers=NULL
  
  
  
  
  
  # M is the bibliographic dataframe
  Tags<-names(M)
  
  if (!("SR" %in% Tags)){M=metaTagExtraction(M,"SR")}
  
  # temporal analyis
  
  if ("PY" %in% Tags){PY <- as.numeric(M$PY)}
  
  # Author's distribution
  
  if ("AU" %in% Tags){
    listAU=strsplit(as.character(M$AU),sep)
    listAU=lapply(listAU, function(l) trim(l))
    #nAU=unlist(lapply(listAU,length))  # num. of authors per paper
    nAU <- lengths(listAU)
    #fracAU=unlist(lapply(nAU,function(x){rep(1/x,x)}))  # fractional frequencies
    fracAU <- rep(1/nAU,nAU)
    AU=unlist(listAU)
    
    Authors=sort(table(AU),decreasing=TRUE)
    Authors_frac=aggregate(fracAU,by=list(AU),'sum')
    names(Authors_frac)=c("Author","Frequency")
    Authors_frac=Authors_frac[order(-Authors_frac$Frequency),]
    FirstAuthors=unlist(lapply(listAU,function(l){
      if (length(l)>0){l=l[[1]]} else {l=NA}
      return(l)
    }))
    
    AuSingleAuthoredArt=length(unique(FirstAuthors[nAU==1]))
    AuMultiAuthoredArt=length(Authors)-AuSingleAuthoredArt
  }
  #PY=as.numeric(M$PY)
  
  #Total Citation Distribution
  if ("TC" %in% Tags){
    TC=as.numeric(M$TC)
    CurrentYear=as.numeric(format(Sys.Date(),"%Y"))
    TCperYear=TC/(CurrentYear-PY+1)
    if (!("DI" %in% names(M))) M$DI <- ""
    MostCitedPapers <- data.frame(M$SR,M$DI,TC,TCperYear,PY) %>%
      group_by(.data$PY) %>%
      mutate(NTC = .data$TC/mean(.data$TC)) %>%
      ungroup() %>% 
      select(-.data$PY) %>%
      arrange(desc(.data$TC)) %>%
      as.data.frame()
    
    names(MostCitedPapers)=c("Paper         ","DOI","TC","TCperYear","NTC")
  }
  
  # References
  nReferences <- 0
  if ("CR" %in% Tags){
    CR <- tableTag(M,"CR",sep)
    nReferences <- length(CR)
  }
  
  # ID Keywords
  if ("ID" %in% Tags){ID <- tableTag(M,"ID",sep)}
  
  # DE Keywords
  if ("DE" %in% Tags){DE=tableTag(M,"DE",sep)}
  
  # Sources
  if ("SO" %in% Tags){
    SO=gsub(",","",M$SO,fixed=TRUE)
    SO=sort(table(SO),decreasing = TRUE)
  }
  
  # All Affiliations, First Affiliation and Countries
  if (("C1" %in% Tags) & (sum(!is.na(M$C1))>0)){
    if(!("AU_UN" %in% Tags)){M=metaTagExtraction(M,Field="AU_UN")}
    AFF=M$AU_UN
    listAFF=strsplit(AFF,sep,fixed=TRUE)
    nAFF=unlist(lapply(listAFF,length))
    listAFF[nAFF==0]="NA"
    fracAFF=unlist(sapply(nAFF,function(x){
      if(x>0){x=rep(1/x,x)}else{
        x=0}
    }))  # fractional frequencies
    AFF=trim.leading(unlist(listAFF))  # delete spaces
    Affiliation=sort(table(AFF),decreasing=TRUE)
    Affiliation_frac=aggregate(fracAFF,by=list(AFF),'sum')
    names(Affiliation_frac)=c("Affiliation","Frequency")
    Affiliation_frac=Affiliation_frac[order(-Affiliation_frac$Frequency),]
    
    # First Affiliation
    FAffiliation=lapply(listAFF,function(l) l[1])
    
    # Countries
    data("countries",envir=environment())
    countries=as.character(countries[[1]])
    
    ### new code{
    if (!("AU1_CO" %in% names(M))){
      M=metaTagExtraction(M,Field="AU1_CO",sep)}
    CO=M$AU1_CO
    
    Country=tableTag(M,"AU1_CO")
    
    SCP_MCP=countryCollaboration(M,Country,k=length(Country),sep)
    
  }else{
    M$AU1_CO=NA
    SCP_MCP=data.frame(Country=rep(NA,1),SCP=rep(NA,1))
  }
  if ("DT" %in% names(M)){
    Documents=table(M$DT)
    n=max(nchar(names(Documents)))
    names(Documents)=substr(paste(names(Documents),"                                              ",sep=""),1,n+5)
  }else{Documents=NA}
  
  # international collaboration
  if (!("AU_CO" %in% names(M))){M=metaTagExtraction(M,Field="AU_CO",sep)}
  Coll <- unlist(lapply(strsplit(M$AU_CO,sep), function(l){
    length(unique(l))>1
  }))
  
  results=list(Articles=dim(M)[1],             # Articles
               Authors=Authors,                # Authors' frequency distribution
               AuthorsFrac=Authors_frac,       # Authors' frequency distribution (fractionalized)
               FirstAuthors=FirstAuthors,      # First Author's list
               nAUperPaper=nAU,                # N. Authors per Paper
               Appearances=sum(nAU),            # Author appearances
               nAuthors=dim(Authors),          # N. of Authors
               AuMultiAuthoredArt=AuMultiAuthoredArt, # N. of Authors of multi-authored articles
               AuSingleAuthoredArt=AuSingleAuthoredArt, # N. of Authors of single-authored articles
               MostCitedPapers=MostCitedPapers,# Papers sorted by citations
               Years=PY,                       # Years
               FirstAffiliation=unlist(FAffiliation),  # Affiliation of First Author
               Affiliations=Affiliation,       # Affiliations of all authors
               Aff_frac=Affiliation_frac,      # Affiliations of all authors (fractionalized)
               CO=CO,                          # Country of each paper
               Countries=Country,              # Countries' frequency distribution
               CountryCollaboration=SCP_MCP,   # Intracountry (SCP) and intercountry (MCP) collaboration
               TotalCitation=TC,               # Total Citations
               TCperYear=TCperYear,            # Total Citations per year
               Sources=SO,                     # Sources
               DE=DE,                          # Keywords
               ID=ID,                          # Authors' keywords
               Documents=Documents,
               IntColl=sum(Coll)/nrow(M)*100,         
               nReferences = nReferences,      # N. of References
               DB=M$DB[1])
  class(results)<-"bibliometrix"
  
  return(results)
}
countryCollaboration<-function(M,Country,k,sep){
  if (!("AU_CO" %in% names(M))){M=metaTagExtraction(M,Field="AU_CO",sep)}
  M$SCP=0
  M$SCP_CO=NA
  for (i in 1:dim(M)[1]){
    if (!is.na(M$AU_CO[i])){
      co=M$AU_CO[i]
      co=table(unlist(strsplit(co,";")))
      if (length(co)==1){M$SCP[i]=1}
      M$SCP_CO[i]=M$AU1_CO[i]
    } else {M$SCP[i]=NA}
  }
  
  CO=names(Country)[1:k]
  
  df=data.frame(Country=rep(NA,k),SCP=rep(0,k))
  for (i in 1:length(CO)){
    co=CO[i]
    df$Country[i]=co
    df$SCP[i]=sum(M$SCP[M$SCP_CO==co],na.rm = T)
  }
  df$MCP=as.numeric(tableTag(M,"AU1_CO")[1:k])-df$SCP
  return(df)
}

library(dplyr)

##Running First FUnction
results <- biblioAnalysis12(scientometrics)


###Second Function  [Line from 463 to 480]



Newlotka<-function(results){
  

  if (!inherits(results, "bibliometrix")){cat('\n argument "results" have to be an object of class "bibliometrix"\n');return(NA)}
  
  # Author Productivity (LOTKA's LAW)
  Authors=results$Authors
  AUdf=data.frame(Authors)
  AuthorProd=aggregate(AUdf,by=list(AUdf$Freq),"length")
  AuthorProd[,2]=as.numeric(AuthorProd[,2])
  AuthorProd[,3]=AuthorProd[,2]/sum(AuthorProd[,2])
  names(AuthorProd)=c("N.Articles","N.Authors","Freq")
  LOTKA=(lm(log10(Freq)~log10(N.Articles),data=AuthorProd))
  Yt=LOTKA$coeff[1]-2*log10(AuthorProd[,1])
  p=suppressWarnings(ks.test(AuthorProd[,3],10^Yt,exact=FALSE)$p.value)
  L=list(Beta=abs(as.numeric(LOTKA$coeff[2])),C=10^(as.numeric(LOTKA$coeff[1])), R2=summary(LOTKA)$r.squared,fitted=10^LOTKA$fitted.values,p.value=p,AuthorProd=AuthorProd)
  return(L)
}

L=Newlotka(results)
L


##License and Citation 


