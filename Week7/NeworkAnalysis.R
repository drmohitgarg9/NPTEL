#  Package

install.packages("igraph")

library(igraph)

# Define nodes
#Authors 
#Total AUthors are four 

nodes <- c("Mohit", "Mukesh", "Priyanka", "Vijay")

nodes

# Define edges
#Collobration Between Authors

edges <- matrix(c(
  "Mohit", "Mukesh",
  "Mohit", "Priyanka",
  "Mukesh", "Priyanka",
  "Mukesh", "Vijay"
), ncol = 2, byrow = TRUE)

edges


#  Undirected graph
gu <- graph_from_edgelist(edges, directed = FALSE)

gu

# We will plot the graph for clear understanding 
# Plot graph
plot(gu, 
     vertex.color = "skyblue",      # Color of the node
     vertex.size = 30,              # Fixing the size of the node
     vertex.label.cex = 1.5,        # Fixing the size of label of the node
     vertex.label.dist = 2,         # Node label distance
     edge.color = "red",          # Edge color
     edge.width = 4,                # Edge width
     main = "Example 1 NPTEL",# Graph Title 
     vertex.label.color = "black")

# Directed graph

gd <- graph_from_edgelist(edges, directed = TRUE)


# Plot graph
plot(gd, 
  
     vertex.color = "green",      # Color of the node
     vertex.size = 30,              # Fixing the size of the node
     vertex.label.cex = 1.5,        # Fixing the size of label of the node
     vertex.label.dist = 2,         # Node label distance
     edge.color = "violetred",          # Edge color
     edge.width = 2,                # Edge width
     main = "NPTEL Example",# Graph Title 
     vertex.label.color = "#FFFFFF")


######Weighted Graph########## 

# load required package


library(igraph)

# Nodes

nodes <- c("Mohit", "Mukesh", "Priyanka", "Vijay")

# Define edges with weights
edges <- matrix(c(
  "Mohit", "Mukesh",2,
  "Mohit", "Priyanka",1,
  "Mukesh", "Priyanka",3,
  "Mukesh", "Vijay",2
), ncol = 3, byrow = TRUE)

# Create graph
g_weighted <- graph_from_edgelist(edges[,1:2], directed = TRUE)



# Plot graph with edge weight
plot(g_weighted, 
     vertex.color = "skyblue",               
     vertex.size = 30,               
     vertex.label = nodes,          
     vertex.label.cex = 1.5,        
     vertex.label.dist = 2,         
     edge.color = "black",          
     edge.width = edges[,3],        
     main = "NPTEL Example Weighted Edge")       #  title



#This weight can be assigned to nodes also. 

# Set node weights
node_weights <- c(5, 3, 8, 4)
V(g_weighted)$weight <- node_weights

# Plot graph with edge weight
plot(g_weighted, 
     vertex.color = "skyblue",      
     vertex.size = V(g_weighted)$weight*5,  
     vertex.label = nodes,          
     vertex.label.cex = 1.5,        
     vertex.label.dist = 2,         
     edge.color = "black",          
     edge.width = edges[,3],        
     main = "NPTEL Example Weighted Node and Edge")       # Plot title





#Centrality
#centrality in terms of Betweenness, Closeness and Strength

#Degree Centrality 

degree(gu)


##Normalized degree  centrality (n -1) 

degree(gu, normalized = TRUE)


#Betweenness Centrality

betweenness(gu)

#Closeness Centrality 

closeness(gu)

#Page Rank Example 


page_rank(gd)



