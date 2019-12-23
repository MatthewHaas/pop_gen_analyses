# 23 December 2019
# WD: /home/jkimball/haasx092/main_GBS
# The purpose of this code is to make a neighbor-joining tree with GBS-derived SNP data
# Code works, but the resulting figure is not informative--it is rather dense-- something should be done to make it easier to read

# Load required packages
library(data.table)
library(ape)

# Read in data
fread("191126_full_set_main_gbs_snps_filtered_generalized.csv") -> x

# Remove column with SNP numbers.. not really necessary for this analysis
x[, SNP := NULL]

# Create a distance matrix
dist(x) -> y

# Creat the neighbor-joining tree
nj(y) -> tree

# Plot the neighbor-joining tree
pdf("out.pdf")
plot(tree, "u")
dev.off()