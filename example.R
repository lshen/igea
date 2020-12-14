
###################################################
# Run this example to see how to implement 
# two-dimensional imaging geneic enrichment analysis
# ------------------------------------
# Author: Xiaohui Yao, yao2@umail.iu.edu
# @Indiana University
################################################### 

source('IGEA.R')

# load data
load('example.RData') # wm.example; y.example.classification; y.example.regression; gene

# set N, should be calculated from real data
# As an example, we fix them.
N = 100 * 20000 # for example, there are 100 ROIs and 20000 protein-coding genes

# SF is the list of significant gene-roi pairs, and M is the meaningful GS-BC module
p <- igea(N, SF, M)
