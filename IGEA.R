####################################################################################
#   Two-dimensional IGEA
#   Test the over-representation of a list of significant brain-wide genome-wide 
#   associaiton results in gene set-brain circuit (GS-BC) modules
# --------------------------------------------------------------------
#   Input:
#   - M: GS-BC module, ie, pathway
#   - SF: a list of significant findings
#   - N: number of total BWGWAS results
# 
#   Output:
#   - p: enrichemnt signficance, ie, over-representation p value
# ------------------------------------------
#   Author: Xiaohui Yao, yao2@umail.iu.edu
#   Date created: Oct-20-2016
#   Date updated: Nov-06-2016
#   @Indiana University.
####################################################################################

############
### IGEA ###
############

igea <- function(N, SF, M){
  
  # hypergeometric test
  hm <- nrow(M) # the size of IG module
  hN <- N - hm
  hn <- nrow(SF) # the number of significant findings
  hk <- 0 # the number of matched gene-roi pairs
  
  for(k in 1:hn)
  {
    if((SF[k,1] %in% M[,1]) && (SF[k,2] %in% M[,2]))
    {
      hk <- hk + 1
    }
  }
  
  p <- phyper(hk, hm, hN, hn, lower.tail=F)
  cat(paste('------The total number of gene-roi associations is: ', N, '------\n', sep=''))
  cat(paste('------The number of significant gene-roi associations is: ', hn, '------\n', sep=''))
  cat(paste('------The size of GS-BC module is: ', hm, '------\n', sep=''))
  cat(paste('------In module M, ', hk, ' gene-roi associations are significant------\n', sep=''))
  cat(paste('------The two-dimensional IG enrichment of module M is: ', p, '------\n', sep=''))
  return(p)
}