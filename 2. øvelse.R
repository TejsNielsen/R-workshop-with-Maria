library(ape); #The Swiss army knife of comparative phylogenetics R packages
library(geiger); #A package for "macroevolutionary simulation and estimating parameters related to diversification"
library(phytools); #Very useful for visualization particularly, great blog support
library(RColorBrewer); # Accessory package with better color
library(plotrix);

tree <- read.nexus("2. øvelse 10-02-20/IntroToCompPhy-master/Data/Clupeiform phylogeny.nex")

library(RColorBrewer)
tmatches <- grep("Anchoa", anchovyTree$tip.label, value = T)
plot(anchovyTree, cex = 0.5, 
     tip.col = ifelse(anchovyTree$tip.label %in% matches,'red','black'))
findMRCA(tree = anchovyTree, tips = matches, type = "node")

subsetAnchovyTree <- extract.clade(anchovyTree, node = 160)
plot(subsetAnchovyTree, type = "fan", rotate.tree = 45, open.angle = 180, 
     main = "Phylogeny of Anchovies", cex.main = 5, col.main = "green",
     label.offset = 2, cex = 1, tip.color = c("blue", "red"))

charactertable <- read.csv("2. øvelse 10-02-20/IntroToCompPhy-master/Data/Bloom_etal_2018_Reduced_Dataset.csv", row.names = 1)
charactertable

anchovyTreeWData <- treedata(tree, charactertable, sort = T);
plot(anchovyTreeWData$phy, main = "Anchovies!")
paste0("There are ", nrow(anchovyTreeWData$data), " taxa represented in both datasets.")

