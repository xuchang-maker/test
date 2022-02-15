#! /Work/pipeline/software/Base/miniconda/v4.10.3/bin/Rscript
library(gplots)
ge <- read.table("/Work/user/zhangxg/project/30_BYM2022012101_meta/otu/all.abundance_uniform_s.tsv",row.names = 1)
names(ge)<-c("C1","C2","C3","C4","C5","C6","T1","T2","T3","T4","T5","T6")
row_name <- apply(ge,1,mean)
ge=ge[c(order(row_name,decreasing=TRUE)[1:50]),]
ge <- as.matrix(ge)
class(ge)
png("./heatmap.png",type="cairo-png")
heatmap.2(ge,Rowv = TRUE,Colv = TRUE,dendrogram = ("both"),distfun = dist,hclustfun = hclust,scale = c("row"),na.rm = TRUE)
