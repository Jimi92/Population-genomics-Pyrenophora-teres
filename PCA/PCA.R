#PCA
BiocManager::install("gdsfmt")
BiocManager::install("SNPRelate")
library("ggplot2")
library(gdsfmt)
library(SNPRelate)



vcf.fn <- "/home/taliadoros/Desktop/phd_projects/Ptt/New_full/Ptt_filtered.vcf"
snpgdsVCF2GDS(vcf.fn, "ptt3.gds", method="biallelic.only")

snpgdsSummary("ptt3.gds")
genofile <- snpgdsOpen("ptt3.gds")
pca2 <- snpgdsPCA(genofile)
pc.percent <- pca2$varprop*100
head(round(pc.percent, 2))


tab2 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV2 = pca2$eigenvect[,2],
                   # the second eigenvector
                   stringsAsFactors = FALSE)
#with wild
head(tab2)
tab2$group <- "ND"
tab2$group[1:9] <- "IR"
tab2$group[10:19] <- "ND"
tab2$group[20:40] <- "FR"
tab2$group[41:51] <- "AZB"
tab2$group[52:56] <- "DN"
tab2$group[57:70] <- "CAW"
tab2$group[71:80] <- "ND"
tab2$group[81] <- "IR"
tab2$group[82:107] <- "IR"


tab2$host <- "Domesticated"
tab2$host[57:70] <- "Wild"

plot(tab2$EV2, tab2$EV1, xlab="eigenvector 1", ylab="eigenvector 2")
ggplot(data=tab2,aes(x=EV1,y=EV2,color=group, shape=host)) + geom_point(size=2.3) + theme_bw() + labs(title = "                                    P. teres isolates clustering" )  + xlab("PC1 (36.14 %)") + ylab("PC2 (7.64 %)")

#without wild
vcf.fn <- "/home/taliadoros/Desktop/phd_projects/Ptt/New_full/Domesticated_only_filtered.vcf"
snpgdsVCF2GDS(vcf.fn, "ptt1.gds", method="biallelic.only")

snpgdsSummary("ptt1.gds")
genofile <- snpgdsOpen("ptt1.gds")
pca2 <- snpgdsPCA(genofile)
pc.percent <- pca2$varprop*100
head(round(pc.percent, 2))


tab2 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV2 = pca2$eigenvect[,2],
                   # the second eigenvector
                   stringsAsFactors = FALSE)


orgn <- read.table("Pyro2.ind2pop")
tab2$group <- orgn$V1
#tab2$group <- "ND"
#tab2$group[1:9] <- "IR"
#tab2$group[20:40] <- "FR"
#tab2$group[41:51] <- "AZB"
#tab2$group[52:56] <- "DN"
#tab2$group[67] <- "IR"
#tab2$group[68:93] <- "MR"

ggplot(data=tab2,aes(x=EV1,y=EV2,color=group)) + scale_color_manual(name="Groups", 
                                                                   values = c("Morocco"="#609CFF","Mixed"="#750000","Iran"="#00BFC4", "North_Dakota"="#F563E3", "Azerbaijan" = "#9BA4A7", "Europe" = "#00BA38"),
                                                                   labels= c("Morocco"="Morocco","Mixed"="Mixed","Iran"="Iran","North_Dakota"="North_Dakota","Azerbaijan"="Azerbaijan", "Europe"="Europe" )) + geom_point(size=2.3) + theme_bw() + xlab("PC1 (12.93 %)") + ylab("PC2 (8.60 %)")


#with iranians
tab2$group <- "ND"
tab2$group[1:5] <- "IR"
tab2$group[6:15] <- "ND"
tab2$group[16:36] <- "FR"
tab2$group[37:47] <- "AZB"
tab2$group[48:52] <- "DN"
tab2$group[53:66] <- "CW"
tab2$group[67:76] <- "ND"
tab2$group[77:102] <- "MR"

tab2$host[1:52] <- "Domesticated"
tab2$host[53:66] <- "Wild"
tab2$host[67:102] <- "Domesticated"

plot(tab2$EV2, tab2$EV1, xlab="eigenvector 1", ylab="eigenvector 2")
ggplot(data=tab2,aes(x=EV1,y=EV2,color=group, shape=host)) + geom_point()+ theme_bw() + xlab("PC1 (40.10 %)") + ylab("PC2 (7.89 %)")

#with iranians no wild
tab2$group <- "ND"
tab2$group[1:5] <- "IR"
tab2$group[6:15] <- "ND"
tab2$group[16:36] <- "FR"
tab2$group[37:47] <- "AZB"
tab2$group[48:52] <- "DN"
tab2$group[53:62] <- "ND"
tab2$group[62:88] <- "MR"

ggplot(data=tab2,aes(x=EV1,y=EV2,color=group)) + geom_point()+ theme_bw() + xlab("PC1 (14.4 %)") + ylab("PC2 (9.8 %)")


tab3 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV3 = pca2$eigenvect[,3],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

tab3$group <- "ND"
tab3$group[1:5] <- "IR"
tab3$group[6:15] <- "ND"
tab3$group[16:36] <- "FR"
tab3$group[37:47] <- "AZB"
tab3$group[48:52] <- "DN"
tab3$group[53:62] <- "ND"
tab3$group[62:88] <- "MR"

ggplot(data=tab3,aes(x=EV1,y=EV3,color=group)) + geom_point()+ theme_bw() + xlab("PC1 (14.4 %)") + ylab("PC3 (6.0 %)")


tab4 <- data.frame(sample.id = pca2$sample.id,
                   EV2 = pca2$eigenvect[,2],
                   # the first eigenvector
                   EV3 = pca2$eigenvect[,3],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

tab4$group <- "ND"
tab4$group[1:5] <- "IR"
tab4$group[6:15] <- "ND"
tab4$group[16:36] <- "FR"
tab4$group[37:47] <- "AZB"
tab4$group[48:52] <- "DN"
tab4$group[53:62] <- "ND"
tab4$group[62:88] <- "MR"

ggplot(data=tab4,aes(x=EV2,y=EV3,color=group)) + geom_point()+ theme_bw() + xlab("PC2 (9.8 %)") + ylab("PC3 (6.0 %)")

tab5 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV4 = pca2$eigenvect[,4],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

tab5$group <- "ND"
tab5$group[1:5] <- "IR"
tab5$group[6:15] <- "ND"
tab5$group[16:36] <- "FR"
tab5$group[37:47] <- "AZB"
tab5$group[48:52] <- "DN"
tab5$group[53:62] <- "ND"
tab5$group[62:88] <- "MR"

ggplot(data=tab5,aes(x=EV1,y=EV4,color=group)) + geom_point()+ theme_bw() + xlab("PC1 (14.4 %)") + ylab("PC4 (4.2 %)")


#admixture analysis
tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.2.Q")
#tbl$site <- ifelse(tbl$V2 < 0.0001, "USA", "MOR")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
ord = tbl[order(tbl$V1,tbl$V2),]

barNaming <- function(vec) {
  retVec <- vec
  for(k in 2:length(vec)) {
    if(vec[k-1] == vec[k])
      retVec[k] <- ""
  }
  return(retVec)
}
barplot(t(as.matrix(ord)), col=rainbow(7), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

#admixture analysis
tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.3.Q")
#tbl$site <- ifelse(tbl$V2 < 0.0001, "USA", "MOR")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3),]
ord = tbl[order(tbl$site),]
barNaming <- function(vec) {
  retVec <- vec
  for(k in 2:length(vec)) {
    if(vec[k-1] == vec[k])
      retVec[k] <- ""
  }
  return(retVec)
}
barplot(t(as.matrix(ord)), col=rainbow(7), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.4.Q")
#tbl$site <- ifelse(tbl$V2 < 0.0001, "USA", "MOR")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4),]
ord = tbl[order(tbl$site),]
barNaming <- function(vec) {
  retVec <- vec
  for(k in 2:length(vec)) {
    if(vec[k-1] == vec[k])
      retVec[k] <- ""
  }
  return(retVec)
}
barplot(t(as.matrix(ord)), col=rainbow(6), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.5.Q")
#tbl$site <- ifelse(tbl$V2 < 0.0001, "USA", "MOR")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4,tbl$V5),]
ord = tbl[order(tbl$site),]
barNaming <- function(vec) {
  retVec <- vec
  for(k in 2:length(vec)) {
    if(vec[k-1] == vec[k])
      retVec[k] <- ""
  }
  return(retVec)
}
barplot(t(as.matrix(ord)), col=rainbow(6), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.6.Q")
#tbl$site <- ifelse(tbl$V2 < 0.0001, "USA", "MOR")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4,tbl$V5,tbl$V6),]
ord = tbl[order(tbl$site),]
barNaming <- function(vec) {
  retVec <- vec
  for(k in 2:length(vec)) {
    if(vec[k-1] == vec[k])
      retVec[k] <- ""
  }
  return(retVec)
}
barplot(t(as.matrix(ord)), col=rainbow(7), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.7.Q")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4,tbl$V5,tbl$V6),]
ord = tbl[order(tbl$site),]
barplot(t(as.matrix(ord)), col=rainbow(7), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.8.Q")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4,tbl$V5,tbl$V6),]
ord = tbl[order(tbl$site),]
barplot(t(as.matrix(ord)), col=rainbow(8), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

tbl = read.table("/home/taliadoros/Desktop/PhD_projects/Ptt/VCF/Admixture_thin/plink.9.Q")

tbl$site <- "ND"
tbl$site[11:31] <- "FR"
tbl$site[32:42] <- "AZB"
tbl$site[43:47] <- "DN"
tbl$site[48:61] <- "CW"
tbl$site[62:71] <- "ND"
tbl$site[72:97] <- "MR"
#ord = tbl[order(tbl$V1,tbl$V2,tbl$V3,tbl$V4,tbl$V5,tbl$V6),]
ord = tbl[order(tbl$site),]
barplot(t(as.matrix(ord)), col=rainbow(9), xlab="Sampling site", main = "Admixture", ylab="Ancestry", border=NA, names.arg=barNaming(ordered(ord$site)), las=3)

